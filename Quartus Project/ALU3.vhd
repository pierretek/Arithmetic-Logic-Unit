LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY ALU3 IS -- ALU unit includes Reg. 3
	PORT (
		clk, res : IN std_logic;
		A, B : IN std_logic_vector(7 DOWNTO 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
		opcode : IN std_logic_vector(15 DOWNTO 0); -- 8-bit opcode from Decoder
		student_id : IN std_logic_vector(3 DOWNTO 0); -- 8-bit opcode from Decoder
		R1 : OUT std_logic_vector(3 DOWNTO 0));
END ALU3;

ARCHITECTURE calculation OF ALU3 IS
	SIGNAL Result, Reg1 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');

BEGIN

	Reg1 <= A;
		
	PROCESS (clk, res) --For each opcode submitted to the ALU, display 'y' if one of the 2 digits of A is equal to the student_id signal value and 'n' otherwise
	BEGIN
	
		
		IF res = '1' THEN
			Result <= "00000000";
		ELSIF (clk'EVENT AND clk = '1') THEN
		
			CASE opcode IS
				WHEN "0000000000000001" => 

				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
	
 
				WHEN "0000000000000010" => 

				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
					
 
				WHEN "0000000000000100" => 
	
				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
	
 
				WHEN "0000000000001000" => 

				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
					
 
				WHEN "0000000000010000" => 
					
				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
 
				WHEN "0000000000100000" => 

				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
					
				WHEN "0000000001000000" => 
				
				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
				
				WHEN "0000000010000000" => 
				
				--Checking the Digits of A compared to student_id
					IF student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) / 10, 4))
				   OR student_id = std_logic_vector(TO_UNSIGNED(TO_INTEGER(UNSIGNED(A)) MOD 10, 4))	THEN
					Result <= "00000001"; -- y 
					ELSE
					Result <= "00000000"; -- n
					END IF;
				
 
				WHEN OTHERS => 
					-- Don’t care, do nothing
					Result <= "--------";
 
			END CASE;
		END IF;

		
	END PROCESS;
	
	R1 <= Result(3 DOWNTO 0);
 
 
END calculation;
