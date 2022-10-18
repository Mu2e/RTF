// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Feb 11 14:57:45 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode funcsim
//               /data/rrivera/mu2e/mu2e-daq-firmware/RJ45_Test1/project_1/project_1.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tffg1156-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [31:0]Q;

  wire CLK;
  wire [31:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_13 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_0_c_counter_binary_v12_0_13
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [31:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_13_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
m+Ocg+3yF+mwvvWgj/+1trqznEFTpCQY8b/6xRMEWRPvOzil07unGpDEnDGc38eOtIHYKHvIJtgW
qFDfeiL/IWX6nJWk+IiCQlMiNEXXA4KakQ1xriklvMyrhuP67cj62aCkfL/NnsqBJvbyjJ0ijN17
ilUK8LHB+1oV5RWCFuE3sgGkaKnCzvLNeCdRYsYPmC3BSDHdVVFbcA08rG+dvNf47q+ElclaRAet
t617wM3sCm/SUB/gpp3nJBCUwd7ywpMoL74GO3GpdncRSFcYk978mVf4bg5evT92bzpFmQg7V9n5
/s62d3OhXjXbV++ldBeTBcvZ9s2ee8p4wsKzDQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mWTQTxk15r3Bsi8IwwmmqV5kjtJQqer3W0/jyS4NLkijjUD28L/G2I0arP5FEhUyaunQY1vE4Yxd
jTGuxlaJwkJEedoW+P2I27s4XbLiYUX0Ws2nS2aYm02Q3iQXJLiRYWFuAlpfeAU7tZ7UcwBFzplU
dFrAynYTydU+3+8e655CxqZOcnLVLqyPQbVxU4eoN7BkMIAYqEpEP2fAdCAsPxHkuKWD54VJ7iZ0
zTF4vvDKyko3IeGkKB3SgTI0xcWYGlv66fAeIgU2Q7Boj+81tTPI+BKHWCkYJTEXAr60NbSSMLUn
dAIfMf00Qae0z2o/G3MQueag8M0MsWb+fgsLGQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17488)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
