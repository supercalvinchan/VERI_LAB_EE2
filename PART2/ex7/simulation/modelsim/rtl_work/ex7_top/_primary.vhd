library verilog;
use verilog.vl_types.all;
entity ex7_top is
    port(
        KEY             : in     vl_logic_vector(3 downto 0);
        HEX0            : out    vl_logic_vector(3 downto 0);
        HEX1            : out    vl_logic_vector(3 downto 0)
    );
end ex7_top;
