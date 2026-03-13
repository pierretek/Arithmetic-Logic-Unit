LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg2 IS
    PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            numLeds : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)); --Right Display

END sseg2;

ARCHITECTURE Behavior OF sseg2 IS
BEGIN
    PROCESS (bcd)
    BEGIN

--Determining Which Value to Display
        CASE (bcd) IS              
            WHEN "0001" => numLeds <= "0111011"; --y
            WHEN "0000" => numLeds <= "1110110"; --n
            WHEN OTHERS => numLeds <= "-------";
        END CASE;
       
       
    END PROCESS;
END Behavior;