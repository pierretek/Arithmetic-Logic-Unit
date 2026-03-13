library verilog;
use verilog.vl_types.all;
entity lab6_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Clock           : in     vl_logic;
        data_in         : in     vl_logic;
        En              : in     vl_logic;
        opcode          : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end lab6_vlg_sample_tst;
