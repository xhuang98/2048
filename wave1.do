# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in lab2_pt1.v to working dir
# could also have multiple verilog files
vlog state_final.v

#load simulation using lab2_pt1 as the top level simulation module
vsim state_final

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

force {CLOCK_IN} 1 0, 0 {5 ns} -r 10ns
force {CONTROL} 1
force {randomnumber_generated} 0010
force {SQ1} 0000
force {SQ2} 0010
force {SQ3} 0100
force {SQ4} 0000
force {SQ5} 0011
force {SQ6} 0000
force {SQ7} 0001
force {SQ8} 0001
force {SQ9} 0011
force {SQ10} 0010
force {SQ11} 0100
force {SQ12} 0001
force {SQ13} 0000
force {SQ14} 0001
force {SQ15} 0000
force {SQ16} 0001

run 20ns

force {CLOCK_IN} 1 0, 0 {5 ns} -r 10ns
force {CONTROL} 0
force {randomnumber_generated} 0101
force {SQ1} 0000
force {SQ2} 0010
force {SQ3} 0100
force {SQ4} 0000
force {SQ5} 0011
force {SQ6} 0000
force {SQ7} 0001
force {SQ8} 0001
force {SQ9} 0011
force {SQ10} 0010
force {SQ11} 0100
force {SQ12} 0001
force {SQ13} 0000
force {SQ14} 0001
force {SQ15} 0000
force {SQ16} 0001

run 40ns

force {CLOCK_IN} 1 0, 0 {5 ns} -r 10ns
force {CONTROL} 0
force {randomnumber_generated} 0101
force {SQ1} 0000
force {SQ2} 0010
force {SQ3} 0100
force {SQ4} 0000
force {SQ5} 0011
force {SQ6} 0000
force {SQ7} 0001
force {SQ8} 0001
force {SQ9} 0011
force {SQ10} 0010
force {SQ11} 0100
force {SQ12} 0001
force {SQ13} 0000
force {SQ14} 0001
force {SQ15} 0000
force {SQ16} 0001

run 40ns

