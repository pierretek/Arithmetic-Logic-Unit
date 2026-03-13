library verilog;
use verilog.vl_types.all;
entity testALU_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        opcode          : in     vl_logic_vector(15 downto 0);
        res             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end testALU_vlg_sample_tst;
