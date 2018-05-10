add wave N clk trigger time_out
force N 10000 0ms, 1000 100ms
force trigger 0 0ms, 1 3ms, 0 30ms, 1 100ms
force clk 0 0, 1 0.5ms -repeat 1ms
run 400ms