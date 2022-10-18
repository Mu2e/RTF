-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : LED_Flasher
-- Author      : Greg Deuerling
-- Company     : FermiLab
--
-------------------------------------------------------------------------------
--
-- File        : c:\Projects\CAPTAN_Plus\CAPTAN_PLUS_MB\Xilinx_Projects\LED_Flasher\LED_Flasher\compile\LED_Flasher_Top.vhd
-- Generated   : Tue Mar 14 13:50:17 2017
-- From        : c:\Projects\CAPTAN_Plus\CAPTAN_PLUS_MB\Xilinx_Projects\LED_Flasher\LED_Flasher\src\LED_Flasher_Top.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

library UNISIM;
use UNISIM.Vcomponents.ALL;

library unimacro;
use unimacro.Vcomponents.ALL;


entity LED_Flasher_Top is
  port(

       USER_CLK1 : in STD_LOGIC;
	   USER_CLK2 : in STD_LOGIC;
	   -- I2C Interface to the clock generator 
	   USER_CLK2_SCL : inout STD_LOGIC;
	   USER_CLK2_SDA : inout STD_LOGIC;
	   
       --GEL0 : out STD_LOGIC;
       LED0 : out STD_LOGIC;
       
	   -- Ethernet Interface
	   PHY_RXCLK  : in    std_logic; 
	   PHY_RXCTL_RXDV : in    std_logic; 
	   PHY_RXD0	  : in    std_logic; 
	   PHY_RXD1	  : in    std_logic; 
	   PHY_RXD2	  : in    std_logic; 
	   PHY_RXD3	  : in    std_logic; 
	   PHY_RXD4	  : in    std_logic; 
	   PHY_RXD5	  : in    std_logic; 
	   PHY_RXD6	  : in    std_logic; 
	   PHY_RXD7	  : in    std_logic; 
	   PHY_RXER   : in    std_logic; 
	   PHY_RESET  : out    std_logic; 	   	
	   PHY_TXCTL_TXEN : out   std_logic; 
	   PHY_TXD0	  : out   std_logic; 
	   PHY_TXD1	  : out   std_logic; 
	   PHY_TXD2	  : out   std_logic; 
	   PHY_TXD3	  : out   std_logic;
	   PHY_TXD4	  : out   std_logic; 
	   PHY_TXD5	  : out   std_logic; 
	   PHY_TXD6	  : out   std_logic; 
	   PHY_TXD7	  : out   std_logic; 
	   PHY_TXER	  : out   std_logic;				  
	   PHY_TXC_GTXCLK : out   std_logic;
	   
	   -- Main PCB LVDS In
	   NW_LA_16_P : in STD_LOGIC;  -- CLK_IN0_P
       NW_LA_16_N : in STD_LOGIC;  -- CLK_IN0_N
	   NW_LA_18_P : in STD_LOGIC;  -- TRIG_IN0_P
       NW_LA_18_N : in STD_LOGIC;  -- TRIG_IN0_N
       
	   -- Main PCB LVDS Out
       NW_LA_02_P : out STD_LOGIC;  -- BANK4A_CLK_P
       NW_LA_02_N : out STD_LOGIC;  -- BANK4A_CLK_N
       NW_LA_04_P : out STD_LOGIC;  -- BANK4A_TRIG_P
       NW_LA_04_N : out STD_LOGIC;  -- BANK4A_TRIG_P
       NW_LA_07_P : out STD_LOGIC;  -- BANK4B_CLK_P
       NW_LA_07_N : out STD_LOGIC;  -- BANK4B_CLK_N
       NW_LA_11_P : out STD_LOGIC;  -- BANK4B_TRIG_P
       NW_LA_11_N : out STD_LOGIC;  -- BANK4B_TRIG_P
       NW_LA_15_P : out STD_LOGIC;  -- BANK5A_CLK_P
       NW_LA_15_N : out STD_LOGIC;  -- BANK5A_CLK_N
       NW_LA_19_P : out STD_LOGIC;  -- BANK5A_TRIG_P
       NW_LA_19_N : out STD_LOGIC;  -- BANK5A_TRIG_P
       NW_LA_21_P : out STD_LOGIC;  -- BANK5B_CLK_P
       NW_LA_21_N : out STD_LOGIC;  -- BANK5B_CLK_N
       NW_LA_24_P : out STD_LOGIC;  -- BANK5B_TRIG_P
       NW_LA_24_N : out STD_LOGIC;  -- BANK5B_TRIG_P
       SW_LA_06_P : out STD_LOGIC;  -- BANK6A_CLK_P
       SW_LA_06_N : out STD_LOGIC;  -- BANK6A_CLK_N
       SW_LA_10_P : out STD_LOGIC;  -- BANK6A_TRIG_P
       SW_LA_10_N : out STD_LOGIC;  -- BANK6A_TRIG_P
       SW_LA_14_P : out STD_LOGIC;  -- BANK6B_CLK_P
       SW_LA_14_N : out STD_LOGIC;  -- BANK6B_CLK_N
       SW_LA_18_P : out STD_LOGIC;  -- BANK6B_TRIG_P
       SW_LA_18_N : out STD_LOGIC;  -- BANK6B_TRIG_P
	   
	   SW_LA_09_P : out STD_LOGIC;  -- ISO_OUT0_P
       SW_LA_09_N : out STD_LOGIC;  -- ISO_OUT0_N
	   SW_LA_13_P : out STD_LOGIC;  -- ISO_OUT1_P
       SW_LA_13_N : out STD_LOGIC;  -- ISO_OUT1_N
	   
	   
	   -- Daughter Card LVDS Out
	   SW_LA_08_P : out STD_LOGIC;  -- BANK1A_CLK_P
       SW_LA_08_N : out STD_LOGIC;  -- BANK1A_CLK_N
       SW_LA_12_P : out STD_LOGIC;  -- BANK1A_TRIG_P
       SW_LA_12_N : out STD_LOGIC;  -- BANK1A_TRIG_P
       SW_LA_16_P : out STD_LOGIC;  -- BANK1B_CLK_P
       SW_LA_16_N : out STD_LOGIC;  -- BANK1B_CLK_N
       SW_LA_20_P : out STD_LOGIC;  -- BANK1B_TRIG_P
       SW_LA_20_N : out STD_LOGIC;  -- BANK1B_TRIG_P
       SW_LA_22_P : out STD_LOGIC;  -- BANK2A_CLK_P
       SW_LA_22_N : out STD_LOGIC;  -- BANK2A_CLK_N
       SW_LA_25_P : out STD_LOGIC;  -- BANK2A_TRIG_P
       SW_LA_25_N : out STD_LOGIC;  -- BANK2A_TRIG_P
       SW_LA_07_P : out STD_LOGIC;  -- BANK2B_CLK_P
       SW_LA_07_N : out STD_LOGIC;  -- BANK2B_CLK_N
       SW_LA_11_P : out STD_LOGIC;  -- BANK2B_TRIG_P
       SW_LA_11_N : out STD_LOGIC;  -- BANK2B_TRIG_P
       SW_LA_15_P : out STD_LOGIC;  -- BANK3A_CLK_P
       SW_LA_15_N : out STD_LOGIC;  -- BANK3A_CLK_N
       SW_LA_19_P : out STD_LOGIC;  -- BANK3A_TRIG_P
       SW_LA_19_N : out STD_LOGIC;  -- BANK3A_TRIG_P
       SW_LA_21_P : out STD_LOGIC;  -- BANK3B_CLK_P
       SW_LA_21_N : out STD_LOGIC;  -- BANK3B_CLK_N
       SW_LA_24_P : out STD_LOGIC;  -- BANK3B_TRIG_P
       SW_LA_24_N : out STD_LOGIC;  -- BANK3B_TRIG_P

       TP7 : out STD_LOGIC
  );
end LED_Flasher_Top;

architecture LED_Flasher_Top of LED_Flasher_Top is


component c_counter_binary_0
  port (
       CLK : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;


component debug_pll
port
 ( -- Clock in 
  clk_in1           : in     std_logic; -- 100MHz 
  -- Clock out 
  clk_out1          : out    std_logic; -- 200 MHz
  clk_out2          : out    std_logic; -- 250 MHz
  -- Status and control signals
  locked            : out    std_logic

 );
end component;


component pll_clk_0
port
 (-- Clock in 
  clk_in200M        : in     std_logic;
  -- Clock out
  clk_out200M       : out    std_logic;
    -- Status and control signals
  reset             : in     std_logic;
  input_clk_stopped : out    std_logic;
  locked            : out    std_logic

 );
end component;

component IIC2
port(
  clock			    : in std_logic;        	
  user_reset        : in std_logic;
  reset             : in std_logic;
  DelayValue        : in std_logic_vector(7 downto 0);
  DeviceAddress     : in std_logic_vector(7 downto 0);
  ReadEnable        : in std_logic;
  ReadDone          : out std_logic;
  ReadRegAddress    : in std_logic_vector(7 downto 0);
  ReadRegData       : out std_logic_vector(7 downto 0);
  WriteEnable       : in std_logic;
  WriteDone         : out std_logic;
  WriteRegAddress   : in std_logic_vector(7 downto 0);
  WriteRegData      : in std_logic_vector(7 downto 0);
  error             : out std_logic;
  SCL	            : inout std_logic;
  SDA		        : inout std_logic
);
end component;
  

component ethernet_interface is
port ( 								
  reset_in          : in    std_logic; 		-- optional for user to reset, this block will self reset on startup					
  reset_out         : out   std_logic;  		-- ethernet reset can be used for "reset on start-up" or for reset to PHY  
  		
  -- rx/tx signals
  rx_addr           : out   std_logic_vector (31 downto 0); 
  rx_data           : out   std_logic_vector (63 downto 0);   	
  rx_wren           : out   std_logic;												   
  tx_data           : in    std_logic_vector (63 downto 0); 	 					 
  user_tx_rden      : out 	std_logic; 	
  user_ready		: in    std_logic;
  
  -- burst signals
  b_data            : in    std_logic_vector (63 downto 0); 
  b_data_we         : in    std_logic; 												                            
  b_enable          : out   std_logic; 				  		  															 				   
  
  -- PHY interface signals
  MASTER_CLK        : in    std_logic; 
  USER_CLK          : in    std_logic; 			
  
  PHY_RXD           : in    std_logic_vector (7 downto 0); 
  PHY_RX_DV         : in    std_logic; 
  PHY_RX_ER         : in    std_logic; 				 	   
  
  TX_CLK            : out   std_logic; 
  PHY_TXD           : out   std_logic_vector (7 downto 0); 
  PHY_TX_EN         : out   std_logic; 
  PHY_TX_ER         : out   std_logic
  );
end component;  
  

	
  signal LEDD 				: std_logic_vector(31 downto 0);
  
  signal debug_counter1_sig : std_logic_vector(31 downto 0);
  signal debug_counter2_sig : std_logic_vector(31 downto 0);
  
  signal clk0_counter 		: unsigned(7 downto 0) := (others => '0');
  signal clk0_unlock_counter: unsigned(3 downto 0) := (others => '0');
  
  signal clk_in, clk_in_sig : std_logic;
  signal clk_in_pll			: std_logic;
  signal trig_in 			: std_logic;
  signal clk0_locked     	: std_logic;
  signal clk0_locked_latch, clk0_locked_latch2     : std_logic := '1';
  signal clk0_stopped       : std_logic;
  signal debug_locked       : std_logic;		
  signal gen_dtc_clock      : std_logic;  -- 200MHz
  signal sel 				: std_logic;
  
-- iic signals  
  signal iic_clock      	: std_logic;  -- 250MHz
  signal reset_iic			: std_logic;
  constant DelayValue		: std_logic_vector(7 downto 0) := X"04";
  constant DeviceAddress	: std_logic_vector(7 downto 0) := X"55"; -- I2C Address (Hex Format) of the Oscillator
  signal ReadEnable     	: std_logic;
  signal ReadDone       	: std_logic;
  signal ReadRegAddress 	: std_logic_vector(7 downto 0);
  signal ReadRegData    	: std_logic_vector(7 downto 0);
  signal WriteEnable    	: std_logic;
  signal WriteDone      	: std_logic;
  signal WriteRegAddress	: std_logic_vector(7 downto 0);
  signal WriteRegData   	: std_logic_vector(7 downto 0);
  signal error          	: std_logic;


-- Ethernet signals
  signal b_data                   : std_logic_vector (63 downto 0);
  signal b_data_we                : std_logic;
  signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
  signal GMII_RX_DV_0_sig         : std_logic;
  signal GMII_RX_ER_0_sig         : std_logic;
  signal GTX_CLK_0_sig            : std_logic;
  signal MASTER_CLK               : std_logic;
  signal USER_CLK                 : std_logic;
  signal CLK15NS, CLK15NS_sig     : std_logic;
  
  signal reset_btn 				  : std_logic;

  signal PHY_TXD_sig              : std_logic_vector (7 downto 0);
  signal PHY_TXEN_sig             : std_logic;
  signal PHY_TXER_sig             : std_logic;
  signal reset                    : std_logic;
  signal reset_n                  : std_logic;
  signal rx_addr                  : std_logic_vector (31 downto 0);
  signal rx_data                  : std_logic_vector (63 downto 0);
  signal rx_wren                  : std_logic;
  signal tx_data                  : std_logic_vector (63 downto 0);
  signal user_tx_rden             : std_logic;  
  signal user_ready	              : std_logic;
  

--  attribute MARK_DEBUG : string;
--  attribute MARK_DEBUG of gen_dtc_clock: signal is "TRUE";
--  attribute MARK_DEBUG of debug_locked: signal is "TRUE";
--  attribute MARK_DEBUG of clk0_locked: signal is "TRUE";
--  attribute MARK_DEBUG of clk0_stopped: signal is "TRUE";
--  attribute MARK_DEBUG of USER_CLK1: signal is "TRUE";
--  attribute MARK_DEBUG of LEDD: signal is "TRUE";
--  attribute MARK_DEBUG of clk0_counter: signal is "TRUE";
--  attribute MARK_DEBUG of clk0_unlock_counter: signal is "TRUE";
--  attribute MARK_DEBUG of debug_counter1_sig: signal is "TRUE";
--  attribute MARK_DEBUG of debug_counter2_sig: signal is "TRUE";
-- 
--  attribute MARK_DEBUG of clk_in: signal is "TRUE";
--  attribute MARK_DEBUG of trig_in: signal is "TRUE";
  
begin

--IBUF_USER_CLK1 : IBUF  port map (I=>USER_CLK1, O=>LED0);


-- Multiplexer to select between an clock from a pin or the clock from the local programmable oscillator
-- clk_in_sig is the 200 MHz clock input, regenerated to 
-- a clk_in 200 MHz clock out, USER_CLK2 is the  clock from the local programmable oscillator
clk_in_pll <= clk_in_sig when sel = '1' else USER_CLK2;


pll_clk_0_inst : pll_clk_0
   port map ( 
   -- Clock in ports
   clk_in200M => clk_in_pll,    -- 200 MHz external or clock from the local programmable oscillator
	-- Clock out ports  
   clk_out200M => clk_in,		-- 200 MHz
  -- Status and control signals                
   reset => '0',
   input_clk_stopped => clk0_stopped,
   locked => clk0_locked
 );
 
  
debug_pll_inst : debug_pll
  port map (
	-- Clock in ports
    clk_in1  => USER_CLK1, 		--100MHz
    -- Clock out ports  
    clk_out1 => gen_dtc_clock,  -- 200MHz
    clk_out2 => iic_clock, 	    -- 250MHz

    locked => debug_locked
 );
     
debug_counter : c_counter_binary_0
port map(
     CLK => USER_CLK1, -- 100 MHz 
     Q => LEDD
);
debug_counter1 : c_counter_binary_0
port map(
     CLK => clk_in,  -- 200 Mhz
     Q => debug_counter1_sig
);
debug_counter2 : c_counter_binary_0
port map(
     CLK => trig_in,  -- External Trigger
     Q => debug_counter2_sig
);
  
process(gen_dtc_clock)
begin
  if(rising_edge(gen_dtc_clock)) then
      clk0_locked_latch <= clk0_locked;
      clk0_locked_latch2 <= clk0_locked_latch;
      if(clk0_locked_latch = '1') then
          if(clk0_counter < 200) then
              clk0_counter <= clk0_counter + 1;
          end if;
      else 
          clk0_counter <= (others => '0');
      end if;
      
      if(clk0_locked_latch2 = '1' and clk0_locked_latch = '0') then
          clk0_unlock_counter <= clk0_unlock_counter + 1;
      end if;
  end if;
end process;


 
iic_inst : IIC2
port map(
	clock			=> iic_clock, -- 250 Mhz 
	user_reset      => reset_iic, 
	reset           => reset,
	DelayValue      => DelayValue,     	
	DeviceAddress   => DeviceAddress,  	
	ReadEnable      => ReadEnable,     	
	ReadDone        => ReadDone,       	
	ReadRegAddress  => ReadRegAddress, 	
	ReadRegData     => ReadRegData,    	
	WriteEnable     => WriteEnable,    	
	WriteDone       => WriteDone,      	
	WriteRegAddress => WriteRegAddress,	
	WriteRegData    => WriteRegData,   	
	error           => error,          	
	SCL	            => USER_CLK2_SCL,
	SDA		        => USER_CLK2_SDA
);
  

  
U2 : OBUFDS port map(I=> clk_in, O=>NW_LA_02_P, OB=>NW_LA_02_N);	-- BANK4A_CLK
U3 : OBUFDS port map(I=> clk_in, O=>NW_LA_04_P, OB=>NW_LA_04_N);	-- BANK4A_TRIG

U4 : OBUFDS port map(I=> clk_in, O=>NW_LA_07_P, OB=>NW_LA_07_N);	-- BANK4B_CLK
U5 : OBUFDS port map(I=> clk_in, O=>NW_LA_11_P, OB=>NW_LA_11_N);	-- BANK4B_TRIG

U6 : OBUFDS port map(I=> clk_in, O=>NW_LA_15_P, OB=>NW_LA_15_N);	-- BANK5A_CLK
U7 : OBUFDS port map(I=> clk_in, O=>NW_LA_19_P, OB=>NW_LA_19_N);	-- BANK5A_TRIG

U8 : OBUFDS port map(I=> clk_in, O=>NW_LA_21_P, OB=>NW_LA_21_N);	-- BANK5B_CLK
U9 : OBUFDS port map(I=> clk_in, O=>NW_LA_24_P, OB=>NW_LA_24_N);	-- BANK5B_TRIG

U10 : OBUFDS port map(I=> clk_in, O=>SW_LA_18_P, OB=>SW_LA_18_N);	-- BANK6A_CLK
U11 : OBUFDS port map(I=> clk_in, O=>SW_LA_14_P, OB=>SW_LA_14_N);	-- BANK6A_TRIG

U12 : OBUFDS port map(I=> clk_in, O=>SW_LA_10_P, OB=>SW_LA_10_N);	-- BANK6B_CLK
U13 : OBUFDS port map(I=> clk_in, O=>SW_LA_06_P, OB=>SW_LA_06_N);	-- BANK6B_TRIG

U14 : OBUFDS port map(I=> clk_in, O=>SW_LA_08_P, OB=>SW_LA_08_N);	-- BANK1A_CLK
U15 : OBUFDS port map(I=> clk_in, O=>SW_LA_12_P, OB=>SW_LA_12_N);	-- BANK1A_TRIG

U16 : OBUFDS port map(I=> clk_in, O=>SW_LA_16_P, OB=>SW_LA_16_N);	-- BANK1B_CLK
U17 : OBUFDS port map(I=> clk_in, O=>SW_LA_20_P, OB=>SW_LA_20_N);	-- BANK1B_TRIG

U18 : OBUFDS port map(I=> clk_in, O=>SW_LA_22_P, OB=>SW_LA_22_N);	-- BANK2A_CLK
U19 : OBUFDS port map(I=> clk_in, O=>SW_LA_25_P, OB=>SW_LA_25_N);	-- BANK2A_TRIG

U20 : OBUFDS port map(I=> clk_in, O=>SW_LA_07_P, OB=>SW_LA_07_N);	-- BANK2B_CLK
U21 : OBUFDS port map(I=> clk_in, O=>SW_LA_11_P, OB=>SW_LA_11_N);	-- BANK2B_TRIG

U22 : OBUFDS port map(I=> clk_in, O=>SW_LA_15_P, OB=>SW_LA_15_N);	-- BANK3A_CLK
U23 : OBUFDS port map(I=> clk_in, O=>SW_LA_19_P, OB=>SW_LA_19_N);	-- BANK3A_TRIG

U24 : OBUFDS port map(I=> clk_in, O=>SW_LA_21_P, OB=>SW_LA_21_N);	-- BANK3B_CLK
U25 : OBUFDS port map(I=> clk_in, O=>SW_LA_24_P, OB=>SW_LA_24_N);	-- BANK3B_TRIG

U26 : IBUFDS port map(I=> NW_LA_16_P, IB=>NW_LA_16_N, O=>trig_in );	-- ISO_OUT0
U27 : IBUFDS port map(I=> NW_LA_18_P, IB=>NW_LA_18_N, O=>clk_in_sig );	-- ISO_OUT1

U28 : OBUFDS port map(I=> clk_in, O=>SW_LA_09_P, OB=>SW_LA_09_N);	-- ISO_OUT0
U29 : OBUFDS port map(I=> trig_in, O=>SW_LA_13_P, OB=>SW_LA_13_N);	-- ISO_OUT1

--GEL0 <= LEDD(20);

LED0 <= LEDD(24);

TP7 <= PHY_RXCLK;



--==============================================================================
--============================= ETHERNET INTERAFCE =============================
--==============================================================================

eth_interface : entity work.Ethernet_Interface
  port map (
  reset_in				=> reset_btn,  
  reset_out 			=> reset,
  -- rx/tx signals
  rx_addr(31 downto 0)	=> rx_addr(31 downto 0),
  rx_data(63 downto 0)	=> rx_data(63 downto 0),
  rx_wren				=> rx_wren,
  tx_data(63 downto 0)	=> tx_data(63 downto 0),
  user_tx_rden			=> user_tx_rden,
  user_ready	        => user_ready,	 
  -- burst signals
  b_data(63 downto 0)   => b_data(63 downto 0), 
  b_data_we             => b_data_we,		
  b_enable				=> open,  
  
  MASTER_CLK			=> MASTER_CLK,  -- 125 MHz 
  USER_CLK				=> USER_CLK,                
  -- PHY interface signals 
  PHY_RXD(7 downto 0)   => GMII_RXD_0_sig(7 downto 0),
  PHY_RX_DV				=> GMII_RX_DV_0_sig,
  PHY_RX_ER				=> GMII_RX_ER_0_sig,
  TX_CLK				=> GTX_CLK_0_sig,
  PHY_TXD(7 downto 0)	=> PHY_TXD_sig(7 downto 0),
  PHY_TX_EN				=> PHY_TXEN_sig,
  PHY_TX_ER				=> PHY_TXER_sig

  );


reset_btn <= '0';
reset_n <= not reset;


	
---- IBUF 
    
IBUF_PHY_RXDV : IBUF       port map (I=>PHY_RXCTL_RXDV,  O=>GMII_RX_DV_0_sig);

IBUF_PHY_RXD7 : IBUF        port map (I=>PHY_RXD7, O=>GMII_RXD_0_sig(7));	  
IBUF_PHY_RXD6 : IBUF        port map (I=>PHY_RXD6, O=>GMII_RXD_0_sig(6));	  
IBUF_PHY_RXD5 : IBUF        port map (I=>PHY_RXD5, O=>GMII_RXD_0_sig(5)); 	  
IBUF_PHY_RXD4 : IBUF        port map (I=>PHY_RXD4, O=>GMII_RXD_0_sig(4));
IBUF_PHY_RXD3 : IBUF        port map (I=>PHY_RXD3, O=>GMII_RXD_0_sig(3));
IBUF_PHY_RXD2 : IBUF        port map (I=>PHY_RXD2, O=>GMII_RXD_0_sig(2));
IBUF_PHY_RXD1 : IBUF        port map (I=>PHY_RXD1, O=>GMII_RXD_0_sig(1));
IBUF_PHY_RXD0 : IBUF        port map (I=>PHY_RXD0, O=>GMII_RXD_0_sig(0));   
 
GMII_RX_ER_0_sig <= '0';
 
IBUF_PHY_RXCLK : BUFG      port map (I=>PHY_RXCLK,  O=>MASTER_CLK);

    
---- OBUF 's 

OBUF_PHY_RESET : OBUF	   port map (I=>reset_n,  O=>PHY_RESET); --hold not reset
	 
OBUF_PHY_TXER : OBUF       port map (I=>PHY_TXER_sig,  O=>PHY_TXER);
 
OBUF_PHY_TXEN : OBUF       port map (I=>PHY_TXEN_sig,  O=>PHY_TXCTL_TXEN);

OBUF_PHY_TXCLK : OBUF      port map (I=>GTX_CLK_0_sig, O=>PHY_TXC_GTXCLK);

OBUF_PHY_TXD7 : OBUF   	   port map (I=>PHY_TXD_sig(7), O=>PHY_TXD7);    
OBUF_PHY_TXD6 : OBUF       port map (I=>PHY_TXD_sig(6), O=>PHY_TXD6);    
OBUF_PHY_TXD5 : OBUF       port map (I=>PHY_TXD_sig(5), O=>PHY_TXD5);    
OBUF_PHY_TXD4 : OBUF       port map (I=>PHY_TXD_sig(4), O=>PHY_TXD4);    
OBUF_PHY_TXD3 : OBUF       port map (I=>PHY_TXD_sig(3), O=>PHY_TXD3);    
OBUF_PHY_TXD2 : OBUF       port map (I=>PHY_TXD_sig(2), O=>PHY_TXD2);    
OBUF_PHY_TXD1 : OBUF       port map (I=>PHY_TXD_sig(1), O=>PHY_TXD1);    
OBUF_PHY_TXD0 : OBUF       port map (I=>PHY_TXD_sig(0), O=>PHY_TXD0);


end LED_Flasher_Top;

