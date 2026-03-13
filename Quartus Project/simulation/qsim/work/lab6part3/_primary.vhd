library verilog;
use verilog.vl_types.all;
entity lab6part3 is
    port(
        numLeds         : out    vl_logic_vector(6 downto 0);
        Clock           : in     vl_logic;
        ALUReset        : in     vl_logic;
        AReset          : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        BReset          : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        En              : in     vl_logic;
        data_in         : in     vl_logic;
        FSMReset        : in     vl_logic;
        sID             : out    vl_logic_vector(6 downto 0)
    );
end lab6part3;
