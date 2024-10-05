
### How to Run VHDL ( GHDL compiler + GTKWAVE to view waveform )
ghdl -a process.vhdl
ghdl -a process_vhdl_test_bench.vhdl
ghdl -e  tb_example_and 
ghdl -r tb_example_and 
ghdl -r tb_example_and --vcd=add.vcd