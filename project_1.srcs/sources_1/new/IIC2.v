// 
// IIC Interface
//
// IIC interface to SI570 clock chip.
//
// Kwarciany  30.Oct.2013
//  mod 4.Nov.2014

// Copyright 2013, 2014 Firmilab, U.S. Department of Energy

`default_nettype none

`timescale 1ns / 1ps
`define DLY #1

//`define debug = 1

//***************************** Entity Declaration ****************************
module IIC2 #(
	parameter					enable_ila	= 1'b0,
	parameter					debugenable	= 1'b0
	)(
	input 	wire 				clock,	        	//250mhz
	input	wire				user_reset,
	input 	wire 				reset,
	input	wire	[8-1:0]		DelayValue,
	input	wire	[8-1:0]		DeviceAddress,
	input	wire				ReadEnable,
	output	reg					ReadDone,
	input	wire	[8-1:0]		ReadRegAddress,
	output	reg		[8-1:0]		ReadRegData,
	input	wire				WriteEnable,
	output	reg					WriteDone,
	input	wire	[8-1:0]		WriteRegAddress,
	input	wire	[8-1:0]		WriteRegData,
	output 	reg 				error,
	inout 	wire 				SCL,		        //K21
	inout 	wire 				SDA		        	//L21
	);         

wire 			SCLIn, SDAIn;
reg 			SCLOut, SDAOut;
reg 	[11:0] 	ClockDivider;

reg 	[7:0] 	ShiftReg;
reg 	[3:0] 	BitCount;
reg 	[7:0] 	ConfigState;
reg 			Read;
reg 	[7:0] 	ShiftIn;

reg 			SCLChange, SDAChange;
wire			Change;

reg		[7:0]	DelayCount;

reg		[2:0]	WriteEnableReg;
reg		[2:0]	ReadEnableReg;
wire			ReadOrWriteEnable;

wire			reseti;

reg		[15:0]	GlobalCount;

assign reseti = reset || user_reset;

generate
    if      (enable_ila)//(GTXID == 0)
        begin : ILAs
ila_37 ila_37_i (
	.clk			(clock					),	// input wire clk
	.probe0			(reseti					),	// input wire [0 : 0] probe0
	.probe1			(DelayValue				),	// input wire [7 : 0] probe1
	.probe2			(DeviceAddress			),	// input wire [7 : 0] probe2
	.probe3			(ReadEnable				),	// input wire [0 : 0] probe3
	.probe4			(ReadDone				),	// input wire [0 : 0] probe4
	.probe5			(ReadRegAddress			),	// input wire [7 : 0] probe5
	.probe6			(ReadRegData			),	// input wire [7 : 0] probe6
	.probe7			(WriteEnable			),	// input wire [0 : 0] probe7
	.probe8			(WriteDone				),	// input wire [0 : 0] probe8
	.probe9			(WriteRegAddress		),	// input wire [7 : 0] probe9
	.probe10		(WriteRegData			),	// input wire [7 : 0] probe10
	.probe11		(error					),	// input wire [0 : 0] probe11
	.probe12		(SCLIn					),	// input wire [0 : 0] probe12
	.probe13		(SDAIn					),	// input wire [0 : 0] probe13
	.probe14		(ClockDivider			),	// input wire [11 : 0] probe14
	.probe15		(ShiftReg				),	// input wire [7 : 0] probe15
	.probe16		(BitCount				),	// input wire [3 : 0] probe16
	.probe17		(ConfigState			),	// input wire [7 : 0] probe17
	.probe18		(Read					),	// input wire [0 : 0] probe18
	.probe19		(ShiftIn				),	// input wire [7 : 0] probe19
	.probe20		(SCLChange				),	// input wire [0 : 0] probe20
	.probe21		(SDAChange				),	// input wire [0 : 0] probe21
	.probe22		(DelayCount				),	// input wire [7 : 0] probe22
	.probe23		(WriteEnableReg			),	// input wire [2 : 0] probe23
	.probe24		(ReadEnableReg			),	// input wire [2 : 0] probe24
	.probe25		(SCLOut					),	// input wire [0 : 0] probe25
	.probe26		(SDAOut					),	// input wire [0 : 0] probe26
	.probe27		(GlobalCount			),	// input wire [15 : 0] probe27
	.probe28		(Change					),	// input wire [0 : 0] probe28
	.probe29		(ReadOrWriteEnable		)	// input wire [0 : 0] probe29
);
end 
endgenerate

IOBUF_LVCMOS25 U1
(
	.I				(1'b0					),
	.IO				(SCL					),
	.O				(SCLIn					),
	.T				(SCLOut					)
);

IOBUF_LVCMOS25 U2
(
	.I				(1'b0					),
	.IO				(SDA					),
	.O				(SDAIn					),
	.T				(SDAOut					)
);

//SCL is 100KHz so need to wait 2500 clock ticks between rising edges.


always @ (posedge clock) begin
	if (reseti) begin
		ClockDivider <= 0;
	end else if (ClockDivider == 0) begin
	//ORIGINAL//////
	//	ClockDivider <= (debugenable) ? 49 : 1249;
	///////////////
	ClockDivider <= (debugenable) ? 49 : 625;
//		`ifdef debug	
//		ClockDivider <= 49;
//		`else
//		ClockDivider <= 1249;
//		`endif
	end else begin
		ClockDivider <= ClockDivider - 1;
	end
end

always @ (posedge clock)
	begin
		if (reseti) begin
			SCLChange <= 1'b0;
		end else if (debugenable && (ClockDivider == 49)) begin
			SCLChange <= 1'b1;
		//ORIGINAL//////
		//end else if (ClockDivider == 624) begin
		///////////////
		end else if (ClockDivider == 312) begin
			SCLChange <= 1'b1;
//		`ifdef debug
//		else if (ClockDivider == 49)
//		`else
//		else if (ClockDivider == 624)
//		`endif
//			SCLChange <= 1'b1;
		end else begin
			SCLChange <= 1'b0;
		end
	end

always @ (posedge clock) begin
	if (reseti) begin
		SDAChange <= 1'b0;
	end else if (debugenable && (ClockDivider == 24)) begin
		SDAChange <= 1'b1;
		
	//ORIGINAL//////
	//end else if (ClockDivider == 1249) begin
	///////////////		
	end else if (ClockDivider == 625) begin
//	`ifdef debug
//	else if (ClockDivider == 24)
//	`else
//	else if (ClockDivider == 1249)
//	`endif
		SDAChange <= 1'b1;
	end else begin
		SDAChange <= 1'b0;
	end
end

assign Change = SCLChange || SDAChange;
assign ReadOrWriteEnable = WriteEnableReg[2] || ReadEnableReg[2];


always @ (posedge clock or posedge reseti) begin
	if (reseti) begin
		WriteEnableReg		<= '0;
		ReadEnableReg		<= '0;
	end else begin
		WriteEnableReg		<= {WriteEnableReg[1:0], WriteEnable};
		ReadEnableReg		<= {ReadEnableReg[1:0], ReadEnable};
	end
end

always @ (posedge clock or posedge reseti) begin
	if (reseti) begin
		ConfigState <= 0;
		SCLOut <= 1'b1;
		SDAOut <= 1'b1;
		ShiftReg <= 8'b0;
		BitCount <= 4'h8;
		error <= 1'b0;
		Read <= 1'b0;
		ReadRegData <= '0;
		ShiftIn <= 8'b0;
		DelayCount <= 0;
		ReadDone <= 1'b0;
		WriteDone <= 1'b0;
		GlobalCount <= '0;
	end	else case (ConfigState)
//--------------------------------------------------------- first start
		'h0 : if (SDAChange && WriteEnableReg[2]) begin					 
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b0;
				ShiftReg <= {DeviceAddress[6:0], 1'b0};
				Read <= 1'b0;
				WriteDone <= 1'b0;
				ReadDone <= 1'b0;
				GlobalCount <= GlobalCount + 1;
			end else if (SDAChange && ReadEnableReg[2]) begin
				ConfigState <= 'h20;
				SDAOut <= 1'b0;
				ShiftReg <= {DeviceAddress[6:0], 1'b0};
				Read <= 1'b1;
				WriteDone <= 1'b0;
				ReadDone <= 1'b0;
				GlobalCount <= GlobalCount + 1;
			end else begin
				WriteDone <= 1'b0;
				ReadDone <= 1'b0;
				Read <= 1'b0;
			end
		'h1 : if (SCLChange) begin 
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end
//--------------------------------------------------------- Read or Write cycle -- output device address
		'h2 : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= ShiftReg[7];
				ShiftReg[7:1] <= ShiftReg[6:0];
				BitCount <= BitCount - 1;
			end
		'h3 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h4 : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 2;
				SCLOut <= 1'b0;
			end
//---------------------------------------------------------ack
		'h5 : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
			end
		'h6 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h7 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				BitCount <= 4'h8;
				ShiftReg <= WriteRegAddress;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
//--------------------------------------------------------- Read or Write cycle -- output register address
		'h8 : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= ShiftReg[7];
				ShiftReg[7:1] <= ShiftReg[6:0];
				BitCount <= BitCount - 1;
			end
		'h9 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'ha : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 8;
				SCLOut <= 1'b0;
			end
//---------------------------------------------------------ack
		'hb : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
			end
		'hc : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'hd : if (SCLChange && Read) begin
				ConfigState <= 'h20;
				SCLOut <= 1'b0;
				BitCount <= 4'h8;
				ShiftReg <= '0;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end else if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				BitCount <= 4'h8;
				ShiftReg <= WriteRegData;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
//--------------------------------------------------------- Write cycle -- output data
		'he : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= ShiftReg[7];
				ShiftReg[7:1] <= ShiftReg[6:0];
				BitCount <= BitCount - 1;
			end
		'hf : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h10 : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 'he;
				SCLOut <= 1'b0;
			end
//---------------------------------------------------------ack
		'h11 : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
			end
		'h12 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h13 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				BitCount <= 4'h8;
				ShiftReg <= WriteRegAddress;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
//---------------------------------------------------------end  release bus
		'h14 : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b0;
			end
		'h15 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h16 : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
				DelayCount	<= 8;
			end
		'h17 : if (SCLChange) begin
				ConfigState <= (DelayCount == 0) ? ConfigState + 1 : ConfigState;
//				SDAOut <= (DelayCount == 0) ? 1'b0 : 1'b1;
				DelayCount <= (DelayCount == 0) ? DelayCount : DelayCount - 1;
				WriteDone <= (DelayCount == 0) ? 1'b1 : 1'b0;
			end
		'h18 : if (!WriteEnableReg[2]) begin
				ConfigState <= 0;
			end else begin
				ConfigState <= ConfigState;
			end
//--------------------------------------------------------- Read cycle -- output device address
		'h20 : if (SCLChange) begin 
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end
		'h21 : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= ShiftReg[7];
				ShiftReg[7:1] <= ShiftReg[6:0];
				BitCount <= BitCount - 1;
			end
		'h22 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h23 : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 'h21;
				SCLOut <= 1'b0;
			end
//---------------------------------------------------------ack
		'h24 : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
			end
		'h25 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h26 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				ShiftIn <= 8'b0;
				BitCount <= 4'h8;
				ShiftReg <= ReadRegAddress;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
//--------------------------------------------------------- Read cycle -- output register address
		'h27 : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= ShiftReg[7];
				ShiftReg[7:1] <= ShiftReg[6:0];
				BitCount <= BitCount - 1;
			end
		'h28 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h29 : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 'h27;
				SCLOut <= 1'b0;
			end
//---------------------------------------------------------ack
		'h2a : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
			end
		'h2b : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h2c : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				ShiftIn <= 8'b0;
				BitCount <= 4'h8;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
		'h2d : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h2e : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
			end
//--------------------------------------------------------- Read cycle -- output device address
		'h2f : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h30 : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b0;
				ShiftReg <= {DeviceAddress[6:0], 1'b1};
			end
		'h31 : if (SCLChange) begin 
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end
		'h32 : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= ShiftReg[7];
				ShiftReg[7:1] <= ShiftReg[6:0];
				BitCount <= BitCount - 1;
			end
		'h33 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h34 : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 'h32;
				SCLOut <= 1'b0;
			end
//---------------------------------------------------------ack
		'h35 : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
				ReadRegData <= ShiftIn;
			end
		'h36 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h37 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				ShiftIn <= 8'b0;
				BitCount <= 4'h7;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
//--------------------------------------------------------- Read cycle -- read data
		'h38 : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h39 : if (SCLChange && (BitCount == 0)) begin
				ConfigState <= ConfigState + 1;
				ShiftIn <= {ShiftIn[6:0], SDAIn};
				SCLOut <= 1'b0;
			end	else if (SCLChange)	begin
				ConfigState <= 'h38;
				ShiftIn <= {ShiftIn[6:0], SDAIn};
				SCLOut <= 1'b0;
				BitCount <= BitCount - 1;
			end
//---------------------------------------------------------ack
		'h3a : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
				ReadRegData <= ShiftIn;
			end
		'h3b : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h3c : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b0;
				ShiftIn <= 8'b0;
				BitCount <= 4'h8;
				if (SDAIn) error <= 1'b1; else error <= 1'b0; //ack
			end
//---------------------------------------------------------end  release bus
		'h3d : if (SDAChange) begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b0;
			end
		'h3e : if (SCLChange) begin
				ConfigState <= ConfigState + 1;
				SCLOut <= 1'b1;
			end
		'h3f : if (SDAChange)	begin
				ConfigState <= ConfigState + 1;
				SDAOut <= 1'b1;
				DelayCount	<= 8;
			end
		'h40 : if (SCLChange) begin
				ConfigState <= (DelayCount == 0) ? ConfigState + 1 : ConfigState;
				DelayCount <= DelayCount - 1;
				ReadDone <= (DelayCount == 0) ? 1'b1 : 1'b0;
			end
		'h41 : if (!ReadEnableReg[2]) begin
				ConfigState <= 0;
			end else begin
				ConfigState <= ConfigState;
			end
	endcase
end


endmodule
`default_nettype wire