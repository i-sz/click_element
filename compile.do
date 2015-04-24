## ##############################################################
##
##	Title		: Compilation and simulation
##
##	Developers	: Istvan Szonyi, Russel Barnes
##
## This script is meant for compiling the files in the project
## and starting the simulation
#################################################################

# The vlib command creates the work library
#rm -rf work
vlib work

# When the work library is already created the vlib command
# gives a warning, that is OK.

################################################################
# The order of the vcom statements is important, the hierachy
# should be compiled bottom-up.
# The top most entity should be compiled last.
# And the components that do not instantiate other components
# should be compiled first.
################################################################

vcom -quiet  dflop.vhd
vcom -quiet  combo.vhd
vcom -quiet  click_pipeline.vhd
vcom -quiet  three_stage_ring.vhd
vcom -quiet  tb_three_stage_ring.vhd

# The -quiet option disables output from the vcom command
# that is not error or warning messages.

################################################################
# The vsim command starts the testbench design unit and runs
# the simulation

vsim  -novopt tb_three_stage_ring

add wave -noupdate /tb_three_stage_ring/dut/init
add wave -noupdate /tb_three_stage_ring/dut/init_clk
add wave -noupdate /tb_three_stage_ring/dut/output
add wave -noupdate /tb_three_stage_ring/dut/ack_1
add wave -noupdate /tb_three_stage_ring/dut/ack_2
add wave -noupdate /tb_three_stage_ring/dut/ack_3
add wave -noupdate /tb_three_stage_ring/dut/req_1
add wave -noupdate /tb_three_stage_ring/dut/req_2
add wave -noupdate /tb_three_stage_ring/dut/req_3
add wave -noupdate /tb_three_stage_ring/dut/data_1
add wave -noupdate /tb_three_stage_ring/dut/data_2
add wave -noupdate /tb_three_stage_ring/dut/data_3

run 200 ns

################################################################
