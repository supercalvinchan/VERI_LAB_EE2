add wave clock reset enable
add wave -decimal count
force clock 0 0, 1 10ns -repeat 20ns
force enable 1 80ns
force reset 1 200ns
run 1000ns