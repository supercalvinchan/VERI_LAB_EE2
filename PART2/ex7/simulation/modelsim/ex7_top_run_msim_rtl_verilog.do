transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex7 {H:/VERI/PART2/ex7/LFSR_7.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART2/ex7 {H:/VERI/PART2/ex7/ex7_top.v}

