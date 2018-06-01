
vlib work

vlog control_new.v move.v box.v variable_counter.v game2048test.v

vsim game2048

log {/*}

add wave {/*}



force {CLOCK_50} 0 0, 1 10 -r 20

force {KEY} 1111
force {SW} 11
run 100

force {SW} 00
run 100

force {SW} 01
run 100

force {SW} 00
run 100

force {KEY} 1110
run 500

force {KEY} 1111
run 200

force {KEY} 1101
run 500

force {KEY} 1111
run 200

force {KEY} 1101
run 500
