library verilog;
use verilog.vl_types.all;
entity lab6_vlg_check_tst is
    port(
        neg1            : in     vl_logic;
        neg2            : in     vl_logic;
        numLeds         : in     vl_logic_vector(6 downto 0);
        R1              : in     vl_logic_vector(3 downto 0);
        R2              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab6_vlg_check_tst;
