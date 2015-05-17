onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider top_fib
add wave -noupdate /top_fibonacci/init_s
add wave -noupdate /top_fibonacci/init_clk_s
add wave -noupdate /top_fibonacci/output_s
add wave -noupdate /top_fibonacci/set_3_s
add wave -noupdate /top_fibonacci/reset_3_s
add wave -noupdate /top_fibonacci/init_clk_3_s
add wave -noupdate -radix unsigned /top_fibonacci/data_2
add wave -noupdate -radix unsigned /top_fibonacci/data_3
add wave -noupdate -radix unsigned /top_fibonacci/data_4
add wave -noupdate -radix unsigned /top_fibonacci/data_5
add wave -noupdate /top_fibonacci/ack_2
add wave -noupdate /top_fibonacci/ack_3
add wave -noupdate /top_fibonacci/ack_4
add wave -noupdate /top_fibonacci/ack_5
add wave -noupdate /top_fibonacci/req_2
add wave -noupdate /top_fibonacci/req_3
add wave -noupdate /top_fibonacci/req_4
add wave -noupdate /top_fibonacci/req_5
add wave -noupdate -divider ringA
add wave -noupdate /top_fibonacci/ringA/init
add wave -noupdate /top_fibonacci/ringA/init_clk
add wave -noupdate /top_fibonacci/ringA/set_3
add wave -noupdate /top_fibonacci/ringA/reset_3
add wave -noupdate /top_fibonacci/ringA/init_clk_3
add wave -noupdate /top_fibonacci/ringA/b_ack1
add wave -noupdate /top_fibonacci/ringA/b_ack2
add wave -noupdate /top_fibonacci/ringA/a_req_i
add wave -noupdate -radix unsigned /top_fibonacci/ringA/data_i
add wave -noupdate /top_fibonacci/ringA/a_ack_o
add wave -noupdate /top_fibonacci/ringA/b_req1
add wave -noupdate /top_fibonacci/ringA/b_req2
add wave -noupdate -radix unsigned /top_fibonacci/ringA/b_data1
add wave -noupdate -radix unsigned /top_fibonacci/ringA/b_data2
add wave -noupdate /top_fibonacci/ringA/ack_1
add wave -noupdate /top_fibonacci/ringA/ack_2
add wave -noupdate /top_fibonacci/ringA/ack_3
add wave -noupdate /top_fibonacci/ringA/req_1
add wave -noupdate /top_fibonacci/ringA/req_2
add wave -noupdate /top_fibonacci/ringA/req_3
add wave -noupdate -radix unsigned /top_fibonacci/ringA/data_1
add wave -noupdate -radix unsigned /top_fibonacci/ringA/data_2
add wave -noupdate -radix unsigned /top_fibonacci/ringA/data_3
add wave -noupdate -divider adder
add wave -noupdate /top_fibonacci/adder/a_req
add wave -noupdate /top_fibonacci/adder/b_req
add wave -noupdate /top_fibonacci/adder/c_ack
add wave -noupdate /top_fibonacci/adder/reset
add wave -noupdate /top_fibonacci/adder/init_clk
add wave -noupdate -radix unsigned /top_fibonacci/adder/a_data
add wave -noupdate -radix unsigned /top_fibonacci/adder/b_data
add wave -noupdate /top_fibonacci/adder/a_ack
add wave -noupdate /top_fibonacci/adder/b_ack
add wave -noupdate /top_fibonacci/adder/c_req
add wave -noupdate -radix unsigned /top_fibonacci/adder/c_data
add wave -noupdate /top_fibonacci/adder/c_req_internal
add wave -noupdate /top_fibonacci/adder/not_c_req_internal
add wave -noupdate /top_fibonacci/adder/combo_out_internal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {250 ns}
