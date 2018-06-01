
vlib work

vlog control_new.v move.v box.v variable_counter.v first_placement.v

vsim control

log {/*}

add wave {/*}



force {clock} 0 0, 1 10 -r 20

force {direction} 4'b0000
force {oldvalues} 64'b0000000000000000000000000000000000000000000000000000000000000000

force {reset} 1
force {start} 1
run 1000

force {reset} 0
force {start} 0
run 1000

force {start} 1
run 1000

force {start} 0
run 1000

force {direction} 0001
run 1000

force {direction} 0000
run 1000

force {direction} 0010
run 2000
