----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2022 11:08:29 AM
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

library UNISIM;
use UNISIM.Vcomponents.ALL;

library unimacro;
use unimacro.Vcomponents.ALL;

entity testbench is
end testbench;

architecture testbench_arch of testbench is

component debug_pll
port
 ( -- Clock in 
  clk_in1           : in     std_logic; -- 100MHz 
  -- Clock out 
  clk_out1          : out    std_logic; -- 200 MHz
  clk_out2          : out    std_logic; -- 125 MHz
  -- Status and control signals
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
  

signal USER_CLK1 			: std_logic := '0'; -- 200 MHz
signal USER_CLK2 			: std_logic := '0'; -- 100 MHz
signal clk_in_sig   		: std_logic:= '0'; -- 200 MHz;

signal Clk125Mhz      	    : std_logic;  		-- 125 MHz
signal gen_dtc_clock        : std_logic;  		-- 200 MHz

constant clk100MHz_period:   time := 10.0ns;   -- 100 MHz
constant clk200MHz_period:   time := 5.0ns;    -- 200 MHz

signal debug_locked       : std_logic;

signal rst          	: std_logic;
signal reset_iic     	: std_logic;
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
signal USER_CLK2_SCL    : std_logic;
signal USER_CLK2_SDA    : std_logic;
 
-- Ethernet signals
signal b_data                   : std_logic_vector (63 downto 0);
signal b_data_we                : std_logic;
signal GMII_RXD_0_sig           : std_logic_vector (7 downto 0);
signal GMII_RX_DV_0_sig         : std_logic;
signal GMII_RX_ER_0_sig         : std_logic;
signal GTX_CLK_0_sig            : std_logic;
signal MASTER_CLK               : std_logic;

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
 
 
begin

USER_CLK1 <= not USER_CLK1 after clk200MHz_period/2;
USER_CLK2 <= not USER_CLK2 after clk100MHz_period/2;
clk_in_sig <= not clk_in_sig after clk200MHz_period/2;

gen_reset: process(Clk125Mhz)
begin
	if rising_edge(Clk125Mhz) then
    rst <= '1', '0' after 16 ns;
	reset_iic <= '1', '0' after 16 ns;
  end if;	
end process;

debug_pll_inst : debug_pll
  port map (
	-- Clock in ports
    clk_in1  => USER_CLK2, 		--100 MHz
    -- Clock out ports  
    clk_out1 => gen_dtc_clock,  -- 200 MHz
    clk_out2 => Clk125Mhz, 	    -- 125 MHz

    locked => debug_locked
 );

 
iic_inst : IIC2
port map(
	clock			=> Clk125Mhz, -- 125 MHz 
	user_reset      => reset_iic, 
	reset           => rst,
	DelayValue      => DelayValue,     	
	DeviceAddress   => DeviceAddress,  	
	ReadEnable      => ReadEnable,     	
	ReadDone        => ReadDone,       	
	ReadRegAddress  => rx_addr(7 downto 0), 	
	ReadRegData     => tx_data(7 downto 0),    	
	WriteEnable     => rx_wren,    	
	WriteDone       => WriteDone,      	
	WriteRegAddress => rx_addr(7 downto 0),	
	WriteRegData    => rx_data(7 downto 0),   	
	error           => error,          	
	SCL	            => USER_CLK2_SCL,
	SDA		        => USER_CLK2_SDA
);
  
rx_addr(31 downto 8) <= (others=>'0');
rx_data(63 downto 8) <= (others=>'0');
tx_data(63 downto 8) <= (others=>'0');

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
  USER_CLK				=> Clk125Mhz,   -- 125 MHz from internal PLL             
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









end testbench_arch;
