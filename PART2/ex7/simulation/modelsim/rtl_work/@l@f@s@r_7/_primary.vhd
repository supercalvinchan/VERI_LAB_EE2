library verilog;
use verilog.vl_types.all;
entity LFSR_7 is
    port(
        data_out        : out    vl_logic_vector(7 downto 1);
        clk             : in     vl_logic
    );
end LFSR_7;
