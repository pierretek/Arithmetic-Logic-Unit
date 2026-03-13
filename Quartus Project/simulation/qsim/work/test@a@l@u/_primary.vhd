library verilog;
use verilog.vl_types.all;
entity testALU is
    port(
        clk             : in     vl_logic;
        res             : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        opcode          : in     vl_logic_vector(15 downto 0);
        output          : out    vl_logic_vector(7 downto 0)
    );
end testALU;
