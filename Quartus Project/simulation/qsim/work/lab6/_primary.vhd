library verilog;
use verilog.vl_types.all;
entity lab6 is
    port(
        neg2            : out    vl_logic;
        Clock           : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        opcode          : in     vl_logic_vector(15 downto 0);
        neg1            : out    vl_logic;
        numLeds         : out    vl_logic_vector(6 downto 0);
        data_in         : in     vl_logic;
        R1              : out    vl_logic_vector(3 downto 0);
        R2              : out    vl_logic_vector(3 downto 0);
        En              : in     vl_logic
    );
end lab6;
