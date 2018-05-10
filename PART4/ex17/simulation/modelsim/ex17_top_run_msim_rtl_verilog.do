transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/spi2dac.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/spi2adc.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/pwm.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+H:/VERI/mylib {H:/VERI/mylib/clktick_16.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART4/ex17 {H:/VERI/PART4/ex17/ex17_top.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART4/ex17 {H:/VERI/PART4/ex17/echoprocessor.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART4/ex17 {H:/VERI/PART4/ex17/FIFO.v}
vlog -vlog01compat -work work +incdir+H:/VERI/PART4/ex17 {H:/VERI/PART4/ex17/pulse_gen.v}
