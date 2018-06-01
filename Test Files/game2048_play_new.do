
vlib work

vlog control_new.v move.v box.v variable_counter.v game2048test.v first_placement.v

vsim game2048

log {/*}

add wave {/*}



force {clock} 0 0, 1 10 -r 20

force {direction} 0000
force {reset} 1
force {start} 1
run 100

force {reset} 0
force {start} 0
run 100

force {start} 1
run 100

force {start} 0
run 100

force {direction} 0001
run 100

force {direction} 0000
run 100

force {direction} 0010
run 200

force {direction} 0000
run 100

force {direction} 0010
run 200
