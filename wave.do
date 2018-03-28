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

force {clock_iner} 1 0, 0 {10 ns} -r 10ns
force {o1} 0000
force {o2} 0010
force {o3} 0100
force {o4} 0000
force {o5} 0011
force {o6} 0000
force {o7} 0001
force {o8} 0001
force {o9} 0011
force {o10} 0010
force {o11} 0100
force {o12} 0001
force {o13} 0000
force {o14} 0001
force {o15} 0000
force {o16} 0001
force {real_movement} 11
force {real_movemen_t} 0
run 40ns

force {clock_iner} 1 0, 0 {10 ns} -r 10ns
force {o1} 0000
force {o2} 0010
force {o3} 0100
force {o4} 0000
force {o5} 0011
force {o6} 0000
force {o7} 0001
force {o8} 0001
force {o9} 0011
force {o10} 0010
force {o11} 0100
force {o12} 0001
force {o13} 0000
force {o14} 0001
force {o15} 0000
force {o16} 0001
force {real_movement} 11
force {real_movemen_t} 1
run 20ns


force {clock_iner} 1 0, 0 {10 ns} -r 10ns
force {o1} 0000
force {o2} 0010
force {o3} 0100
force {o4} 0000
force {o5} 0011
force {o6} 0000
force {o7} 0001
force {o8} 0001
force {o9} 0011
force {o10} 0010
force {o11} 0100
force {o12} 0001
force {o13} 0000
force {o14} 0001
force {o15} 0000
force {o16} 0001
force {real_movement} 11
force {real_movemen_t} 0
run 40ns

force {clock_iner} 1 0, 0 {10 ns} -r 10ns
force {o1} 0000
force {o2} 0010
force {o3} 0100
force {o4} 0000
force {o5} 0011
force {o6} 0000
force {o7} 0001
force {o8} 0001
force {o9} 0011
force {o10} 0010
force {o11} 0100
force {o12} 0001
force {o13} 0000
force {o14} 0001
force {o15} 0000
force {o16} 0001
force {real_movement} 10
force {real_movemen_t} 0
run 40ns

force {clock_iner} 1 0, 0 {10 ns} -r 10ns
force {o1} 0000
force {o2} 0010
force {o3} 0100
force {o4} 0000
force {o5} 0011
force {o6} 0000
force {o7} 0001
force {o8} 0001
force {o9} 0011
force {o10} 0010
force {o11} 0100
force {o12} 0001
force {o13} 0000
force {o14} 0001
force {o15} 0000
force {o16} 0001
force {real_movement} 10
force {real_movemen_t} 0
run 20ns

force {clock_iner} 1 0, 0 {10 ns} -r 10ns
force {o1} 0000
force {o2} 0010
force {o3} 0100
force {o4} 0000
force {o5} 0011
force {o6} 0000
force {o7} 0001
force {o8} 0001
force {o9} 0011
force {o10} 0010
force {o11} 0100
force {o12} 0001
force {o13} 0000
force {o14} 0001
force {o15} 0000
force {o16} 0001
force {real_movement} 10
force {real_movemen_t} 0
run 40ns
