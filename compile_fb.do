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
vcom -quiet  dflop_ctrl.vhd
vcom -quiet  fork_combo.vhd
vcom -quiet  adder_combo.vhd
vcom -quiet  click_adder.vhd
vcom -quiet  fork_click_pipeline.vhd
vcom -quiet  three_stage_ringA_fb.vhd
vcom -quiet  three_stage_ring_fb.vhd
vcom -quiet  top_fibonacci.vhd

# The -quiet option disables output from the vcom command
# that is not error or warning messages.

################################################################
# The vsim command starts the testbench design unit and runs
# the simulation

vsim  -novopt top_fibonacci


run 200 ns

################################################################
