LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
    PORT (bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            numLeds : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --Right Display
            signLeds : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --Left Display
            sign : IN STD_LOGIC); --Sign 
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
    PROCESS (bcd, sign)
    BEGIN
			
			--Determining Which Value to Display
        CASE (bcd) IS              -- abcdefg
            WHEN "0000" => numLeds <= "1111110"; --0
            WHEN "0001" => numLeds <= "0110000"; --1
            WHEN "0010" => numLeds <= "1101101"; --2
            WHEN "0011" => numLeds <= "1111001"; --3
            WHEN "0100" => numLeds <= "0110011"; --4
            WHEN "0101" => numLeds <= "1011011"; --5 
            WHEN "0110" => numLeds <= "1011111"; --6
            WHEN "0111" => numLeds <= "1110000"; --7
            WHEN "1000" => numLeds <= "1111111"; --8
            WHEN "1001" => numLeds <= "1110011"; --9
				WHEN "1010" => numLeds <= "1110111"; --10 (A)
				WHEN "1011" => numLeds <= "0011111"; --11 (b)
				WHEN "1100" => numLeds <= "1001110"; --12 (C)
				WHEN "1101" => numLeds <= "0111101"; --13 (d)
				WHEN "1110" => numLeds <= "1001111"; --14 (E)
				WHEN "1111" => numLeds <= "1000111"; --15 (F)
            WHEN OTHERS => numLeds <= "-------";
        END CASE;
        
        Case sign IS          -- abcdefg
            WHEN '1' => signLeds <= "0000001";
            WHEN OTHERS => signLeds <= "0000000";
        END CASE;
        
    END PROCESS;
END Behavior;