# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in lab2_pt1.v to working dir
# could also have multiple verilog files
vlog move.v

#load simulation using lab2_pt1 as the top level simulation module
vsim move

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {po1} 0000
force {po2} 0010
force {po3} 0100
force {po4} 0000
force {po5} 0011
force {po6} 0000
force {po7} 0001
force {po8} 0001
force {po9} 0011
force {po10} 0010
force {po11} 0100
force {po12} 0001
force {po13} 0000
force {po14} 0100
force {po15} 0000
force {po16} 0001
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 10ns

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 0
run 10ns


force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 10ns

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 10ns

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 20ns

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 40ns

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 40ns

force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 40ns


force {clock_inere} 1 0, 0 {5 ns} -r 10ns
force {random_number_ine} 1100
force {real_movemente} 11
force {real_movemen_te} 1
run 40ns