library verilog;
use verilog.vl_types.all;
entity ALUtest_vlg_check_tst is
    port(
        cState          : in     vl_logic_vector(3 downto 0);
        R1              : in     vl_logic_vector(3 downto 0);
        stuID           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALUtest_vlg_check_tst;
