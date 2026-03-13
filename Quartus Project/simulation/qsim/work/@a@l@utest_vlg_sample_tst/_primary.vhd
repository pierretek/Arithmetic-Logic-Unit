library verilog;
use verilog.vl_types.all;
entity ALUtest_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        clk1            : in     vl_logic;
        data_in         : in     vl_logic;
        opcode          : in     vl_logic_vector(15 downto 0);
        res             : in     vl_logic;
        reset           : in     vl_logic;
        student_id      : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALUtest_vlg_sample_tst;
