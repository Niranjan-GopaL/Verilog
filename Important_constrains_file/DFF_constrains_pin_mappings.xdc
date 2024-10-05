set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN W5 [get_ports clk]

create_clock -period 12.000 -name clk -waveform {0.000 6.000} -add
create_clock -period 12.000 -name clk -waveform {0.000 6.000} [get_ports clk]

set_input_delay -clock [get_clocks clk] -min -add_delay 0.200 [get_ports D]
set_input_delay -clock [get_clocks clk] -max -add_delay 0.200 [get_ports D]
set_input_delay -clock [get_clocks clk] -min -add_delay 0.200 [get_ports rst]
set_input_delay -clock [get_clocks clk] -max -add_delay 0.200 [get_ports rst]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports Q]
set_output_delay -clock [get_clocks clk] -max -add_delay 0.200 [get_ports Q]

set_property PACKAGE_PIN U16 [get_ports Q]
set_property PACKAGE_PIN V17 [get_ports D]
set_property PACKAGE_PIN V16 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports D]
set_property IOSTANDARD LVCMOS33 [get_ports Q]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
