library verilog;
use verilog.vl_types.all;
entity ALUtest is
    port(
        cState          : out    vl_logic_vector(3 downto 0);
        data_in         : in     vl_logic;
        clk1            : in     vl_logic;
        reset           : in     vl_logic;
        R1              : out    vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        res             : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        opcode          : in     vl_logic_vector(15 downto 0);
        student_id      : in     vl_logic_vector(3 downto 0);
        stuID           : out    vl_logic_vector(3 downto 0)
    );
end ALUtest;
