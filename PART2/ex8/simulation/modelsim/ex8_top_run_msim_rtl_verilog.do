transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex8 {H:/VERI/PART2/ex8/ex8_top.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex8 {H:/VERI/PART2/ex8/ex8_fsm.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/LFSR_6.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex8 {H:/VERI/PART2/ex8/delay.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex8 {H:/VERI/PART2/ex8/clkdiv_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex8 {H:/VERI/PART2/ex8/clktick_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/add3_ge5.v}

