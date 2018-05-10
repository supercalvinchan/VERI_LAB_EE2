add wave clk trigger pulse
force clk 0 0, 1 10ns -repeat 20ns
force trigger 0 0, 1 30ns, 0 100ns, 1 130ns, 0 170ns
run 1000ns