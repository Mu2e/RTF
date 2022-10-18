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

architecture Behavioral of testbench is

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
	clock			: in std_logic;        	
	user_reset      : in std_logic;
	reset           : in std_logic;
	DelayValue      : in std_logic_vector(7 downto 0);
	DeviceAddress   : in std_logic_vector(7 downto 0);
	ReadEnable      : in std_logic;
	ReadDone        : out std_logic;
	ReadRegAddress  : in std_logic_vector(7 downto 0);
	ReadRegData     : out std_logic_vector(7 downto 0);
	WriteEnable     : in std_logic;
	WriteDone       : out std_logic;
	WriteRegAddress : in std_logic_vector(7 downto 0);
	WriteRegData    : in std_logic_vector(7 downto 0);
	error           : out std_logic;
	SCL	            : inout std_logic;
	SDA		        : inout std_logic
);
end component;

signal LEDD 				: std_logic_vector(31 downto 0);
signal USER_CLK1 			: std_logic := '0'; -- 100 MHz


signal debug_counter1_sig   : std_logic_vector(31 downto 0);
signal debug_counter2_sig   : std_logic_vector(31 downto 0);

signal clk0_counter 		: unsigned(7 downto 0) := (others => '0');
signal clk0_unlock_counter  : unsigned(3 downto 0) := (others => '0');

signal clk_in, clk_in_sig   : std_logic:= '0'; -- 200 MHz;
signal trig_in 			    : std_logic:= '0'; 
signal clk0_locked     	    : std_logic;
signal clk0_locked_latch, clk0_locked_latch2     : std_logic := '1';
signal clk0_stopped         : std_logic;
signal debug_locked         : std_logic;		
						    
signal iic_clock      	    : std_logic:= '0';  -- 250MHz
signal gen_dtc_clock        : std_logic:= '0';  -- 200MHz

attribute MARK_DEBUG : string;
attribute MARK_DEBUG of gen_dtc_clock: signal is "TRUE";
attribute MARK_DEBUG of debug_locked: signal is "TRUE";
attribute MARK_DEBUG of clk0_locked: signal is "TRUE";
attribute MARK_DEBUG of clk0_stopped: signal is "TRUE";
attribute MARK_DEBUG of USER_CLK1: signal is "TRUE";
attribute MARK_DEBUG of LEDD: signal is "TRUE";
attribute MARK_DEBUG of clk0_counter: signal is "TRUE";
attribute MARK_DEBUG of clk0_unlock_counter: signal is "TRUE";
attribute MARK_DEBUG of debug_counter1_sig: signal is "TRUE";
attribute MARK_DEBUG of debug_counter2_sig: signal is "TRUE";

attribute MARK_DEBUG of clk_in: signal is "TRUE";
attribute MARK_DEBUG of trig_in: signal is "TRUE";


constant clk100MHz_period:   time := 10.0ns;   -- 100 MHz
constant clk200MHz_period:   time := 5.0ns;    -- 200 MHz

 
begin

USER_CLK1 <= not USER_CLK1 after clk100MHz_period/2;
clk_in_sig <= not clk_in_sig after clk200MHz_period/2;


-- clk_in_sig is the 200 MHz clock input, regenerated to 
-- a clk_in 200 MHz clock out 
pll_clk_0_inst : pll_clk_0
   port map ( 
   -- Clock in ports
   clk_in200M => clk_in_sig,    -- 200 MHz
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



end Behavioral;
