add wave data_in sysclk load dac_sdi dac_cs dac_sck dac_ld
force data_in 001000111011
force sysclk 0 0, 1 10ns -repeat 20ns
force load 0 0, 1 40ns, 0 80ns
run 30000ns