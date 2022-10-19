#----------------------------------------
# FLASH programming - BPI Sync Mode fast
#----------------------------------------

#necessary
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
#contributes to speed
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
#contributes to speed
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
#documentation claims necessary
set_property CONFIG_VOLTAGE 3.3 [current_design]
#documentation claims ABSOLUTELY necessary
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
#Ryan and Alan found this last constraint to cause problems! (April 2017)
#list_property_value BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]

#-------------------------------------
# CLOCK
#-------------------------------------

set_property PACKAGE_PIN AA30 [get_ports USER_CLK1]
set_property IOSTANDARD LVCMOS33 [get_ports USER_CLK1]
create_clock -period 5.000 -name USER_CLK1 [get_ports USER_CLK1]

set_property PACKAGE_PIN AC28 [get_ports USER_CLK1_SDA]
set_property PACKAGE_PIN AC29 [get_ports USER_CLK1_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports USER_CLK1_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports USER_CLK1_SDA]

set_property PACKAGE_PIN AC33 [get_ports USER_CLK2]
set_property IOSTANDARD LVCMOS33 [get_ports USER_CLK2]
create_clock -period 10.000 -name USER_CLK2 [get_ports USER_CLK2]

set_property PACKAGE_PIN AC34 [get_ports USER_CLK2_SDA]
set_property PACKAGE_PIN AA33 [get_ports USER_CLK2_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports USER_CLK2_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports USER_CLK2_SDA]

create_clock -period 5.000 -name NW_LA_16_P -waveform {0.000 2.500} [get_ports NW_LA_16_P]
create_clock -period 8.000 -name PHY_RXCLK -waveform {0.000 4.000} [get_ports PHY_RXCLK]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets debug_pll_inst/inst/clk_in1_debug_pll]

#-------------------------------------
# LED Status Pinout   (bottom to top)
#-------------------------------------
set_property IOSTANDARD LVCMOS25 [get_ports LED0]
set_property SLEW SLOW [get_ports LED0]
set_property DRIVE 4 [get_ports LED0]
set_property PACKAGE_PIN J3 [get_ports LED0]

#set_property IOSTANDARD LVCMOS33 [get_ports GEL0]
#set_property SLEW SLOW [get_ports GEL0]
#set_property DRIVE 4 [get_ports GEL0]

set_property IOSTANDARD LVCMOS33 [get_ports TP7]
set_property SLEW SLOW [get_ports TP7]
set_property DRIVE 4 [get_ports TP7]
set_property PACKAGE_PIN W29 [get_ports TP7]

#BANK4A_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_02_P]
set_property SLEW FAST [get_ports NW_LA_02_P]
set_property PACKAGE_PIN K11 [get_ports NW_LA_02_P]
set_property PACKAGE_PIN J11 [get_ports NW_LA_02_N]
#BANK4A_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_02_N]

#BANK4A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_04_P]
set_property SLEW FAST [get_ports NW_LA_04_P]
set_property PACKAGE_PIN L8 [get_ports NW_LA_04_P]
set_property PACKAGE_PIN K8 [get_ports NW_LA_04_N]
#BANK4A_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_04_N]

#BANK4B_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_07_P]
set_property SLEW FAST [get_ports NW_LA_07_P]
set_property PACKAGE_PIN G7 [get_ports NW_LA_07_P]
set_property PACKAGE_PIN G6 [get_ports NW_LA_07_N]
#BANK4B_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_07_N]

#BANK4B_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_11_P]
set_property SLEW FAST [get_ports NW_LA_11_P]
set_property PACKAGE_PIN H4 [get_ports NW_LA_11_P]
set_property PACKAGE_PIN H3 [get_ports NW_LA_11_N]
#BANK4B_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_11_N]

#BANK5A_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_15_P]
set_property SLEW FAST [get_ports NW_LA_15_P]
set_property PACKAGE_PIN N1 [get_ports NW_LA_15_P]
set_property PACKAGE_PIN M1 [get_ports NW_LA_15_N]
#BANK5A_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_15_N]

#set_property PACKAGE_PIN H2 [get_ports NW_LA_16_P]
##CLK_IN0_P
#set_property IOSTANDARD LVDS_25 [get_ports NW_LA_16_P]
#set_property PACKAGE_PIN G2 [get_ports NW_LA_16_N]
##CLK_IN0_N
#set_property IOSTANDARD LVDS_25 [get_ports NW_LA_16_N]
#set_property DIFF_TERM TRUE [get_ports NW_LA_16_P]
#set_property DIFF_TERM TRUE [get_ports NW_LA_16_N]


#problems in 2022 July, using channel 4!
#CLK_IN4_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_16_P]
set_property PACKAGE_PIN L10 [get_ports NW_LA_16_P]
set_property PACKAGE_PIN L9 [get_ports NW_LA_16_N]
#CLK_IN4_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_16_N]
set_property DIFF_TERM TRUE [get_ports NW_LA_16_P]
set_property DIFF_TERM TRUE [get_ports NW_LA_16_N]



#set_property PACKAGE_PIN N3 [get_ports NW_LA_18_P]
##TRIG_IN0_P
#set_property IOSTANDARD LVDS_25 [get_ports NW_LA_18_P]
#set_property PACKAGE_PIN N2 [get_ports NW_LA_18_N]
##TRIG_IN0_N
#set_property IOSTANDARD LVDS_25 [get_ports NW_LA_18_N]
#set_property DIFF_TERM TRUE [get_ports NW_LA_18_P]
#set_property DIFF_TERM TRUE [get_ports NW_LA_18_N]


#problems in 2022 July, using channel 4!
#TRIG_IN0_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_18_P]
set_property PACKAGE_PIN M7 [get_ports NW_LA_18_P]
set_property PACKAGE_PIN M6 [get_ports NW_LA_18_N]
#TRIG_IN0_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_18_N]
set_property DIFF_TERM TRUE [get_ports NW_LA_18_P]
set_property DIFF_TERM TRUE [get_ports NW_LA_18_N]



#BANK5A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_19_P]
set_property SLEW FAST [get_ports NW_LA_19_P]
set_property PACKAGE_PIN M11 [get_ports NW_LA_19_P]
set_property PACKAGE_PIN M10 [get_ports NW_LA_19_N]
#BANK5A_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_19_N]

#BANK5B_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_21_P]
set_property SLEW FAST [get_ports NW_LA_21_P]
set_property PACKAGE_PIN N9 [get_ports NW_LA_21_P]
set_property PACKAGE_PIN M9 [get_ports NW_LA_21_N]
#BANK5B_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_21_N]

#BANK5B_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_24_P]
set_property SLEW FAST [get_ports NW_LA_24_P]
set_property PACKAGE_PIN T5 [get_ports NW_LA_24_P]
set_property PACKAGE_PIN T4 [get_ports NW_LA_24_N]
#BANK5B_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports NW_LA_24_N]

#BANK6B_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_06_P]
set_property SLEW FAST [get_ports SW_LA_06_P]
set_property PACKAGE_PIN T8 [get_ports SW_LA_06_P]
set_property PACKAGE_PIN T7 [get_ports SW_LA_06_N]
#BANK6B_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_06_N]

#BANK2B_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_07_P]
set_property SLEW FAST [get_ports SW_LA_07_P]
set_property PACKAGE_PIN AB5 [get_ports SW_LA_07_P]
set_property PACKAGE_PIN AB4 [get_ports SW_LA_07_N]
#BANK2B_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_07_N]

#BANK1A_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_08_P]
set_property SLEW FAST [get_ports SW_LA_08_P]
set_property PACKAGE_PIN AC4 [get_ports SW_LA_08_P]
set_property PACKAGE_PIN AC3 [get_ports SW_LA_08_N]
#BANK1A_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_08_N]

#ISO_OUT0_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_09_P]
set_property SLEW FAST [get_ports SW_LA_09_P]
set_property PACKAGE_PIN U9 [get_ports SW_LA_09_P]
set_property PACKAGE_PIN T9 [get_ports SW_LA_09_N]
#ISO_OUT0_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_09_N]
#set_property DIFF_TERM TRUE [get_ports SW_LA_09_P]

#BANK6B_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_10_P]
set_property SLEW FAST [get_ports SW_LA_10_P]
set_property PACKAGE_PIN AA5 [get_ports SW_LA_10_P]
set_property PACKAGE_PIN AA4 [get_ports SW_LA_10_N]
#BANK6B_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_10_N]

#BANK2B_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_11_P]
set_property SLEW FAST [get_ports SW_LA_11_P]
set_property PACKAGE_PIN AC7 [get_ports SW_LA_11_P]
set_property PACKAGE_PIN AC6 [get_ports SW_LA_11_N]
#BANK2B_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_11_N]

#BANK1A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_12_P]
set_property SLEW FAST [get_ports SW_LA_12_P]
set_property PACKAGE_PIN V2 [get_ports SW_LA_12_P]
set_property PACKAGE_PIN V1 [get_ports SW_LA_12_N]
#BANK1A_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_12_N]

#ISO_OUT1_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_13_P]
set_property SLEW FAST [get_ports SW_LA_13_P]
set_property PACKAGE_PIN AB7 [get_ports SW_LA_13_P]
set_property PACKAGE_PIN AB6 [get_ports SW_LA_13_N]
#ISO)OUT1_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_13_N]
#set_property DIFF_TERM TRUE [get_ports SW_LA_13_P]

#BANK6A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_14_P]
set_property SLEW FAST [get_ports SW_LA_14_P]
set_property PACKAGE_PIN V7 [get_ports SW_LA_14_P]
set_property PACKAGE_PIN V6 [get_ports SW_LA_14_N]
#BANK6A_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_14_N]

#BANK3A_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_15_P]
set_property SLEW FAST [get_ports SW_LA_15_P]
set_property PACKAGE_PIN W9 [get_ports SW_LA_15_P]
set_property PACKAGE_PIN W8 [get_ports SW_LA_15_N]
#BANK3A_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_15_N]

#BANK1B_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_16_P]
set_property SLEW FAST [get_ports SW_LA_16_P]
set_property PACKAGE_PIN AC9 [get_ports SW_LA_16_P]
set_property PACKAGE_PIN AC8 [get_ports SW_LA_16_N]
#BANK1B_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_16_N]

#BANK6A_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_18_P]
set_property SLEW FAST [get_ports SW_LA_18_P]
set_property PACKAGE_PIN V9 [get_ports SW_LA_18_P]
set_property PACKAGE_PIN V8 [get_ports SW_LA_18_N]
#BANK6A_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_18_N]

#BANK3A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_19_P]
set_property SLEW FAST [get_ports SW_LA_19_P]
set_property PACKAGE_PIN W5 [get_ports SW_LA_19_P]
set_property PACKAGE_PIN Y5 [get_ports SW_LA_19_N]
#BANK3A_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_19_N]

#BANK1B_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_20_P]
set_property SLEW FAST [get_ports SW_LA_20_P]
set_property PACKAGE_PIN W10 [get_ports SW_LA_20_P]
set_property PACKAGE_PIN Y10 [get_ports SW_LA_20_N]
#BANK1B_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_20_N]

#BANK3B_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_21_P]
set_property SLEW FAST [get_ports SW_LA_21_P]
set_property PACKAGE_PIN AA3 [get_ports SW_LA_21_P]
set_property PACKAGE_PIN AA2 [get_ports SW_LA_21_N]
#BANK3B_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_21_N]

#BANK2A_CLK_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_22_P]
set_property SLEW FAST [get_ports SW_LA_22_P]
set_property PACKAGE_PIN R10 [get_ports SW_LA_22_P]
set_property PACKAGE_PIN P10 [get_ports SW_LA_22_N]
#BANK2A_CLK_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_22_N]

#BANK3B_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_24_P]
set_property SLEW FAST [get_ports SW_LA_24_P]
set_property PACKAGE_PIN AK2 [get_ports SW_LA_24_P]
set_property PACKAGE_PIN AK1 [get_ports SW_LA_24_N]
#BANK3B_TRIG_N
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_24_N]

#BANK2A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_25_P]
set_property SLEW FAST [get_ports SW_LA_25_P]
set_property PACKAGE_PIN Y8 [get_ports SW_LA_25_P]
set_property PACKAGE_PIN Y7 [get_ports SW_LA_25_N]
#BANK2A_TRIG_P
set_property IOSTANDARD LVDS_25 [get_ports SW_LA_25_N]




