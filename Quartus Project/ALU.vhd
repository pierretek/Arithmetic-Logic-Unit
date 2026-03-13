LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
ENTITY ALU IS -- ALU unit includes Reg. 3
	PORT (
		clk, res : IN std_logic;
		A, B : IN std_logic_vector(7 DOWNTO 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
		opcode : IN std_logic_vector(15 DOWNTO 0); -- 8-bit opcode from Decoder
		Neg1 : OUT std_logic;
		Neg2 : OUT std_logic;
		R1 : OUT std_logic_vector(3 DOWNTO 0);
	R2 : OUT std_logic_vector(3 DOWNTO 0)); -- 8-bit Result
END ALU;
ARCHITECTURE calculation OF ALU IS
	SIGNAL Reg1, Reg2, Result : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL temp_result : std_logic_vector(7 DOWNTO 0);
BEGIN
	Reg1 <= A;
	Reg2 <= B;
 
	PROCESS (clk, res)
	BEGIN
		IF res = '0' THEN
			Result <= "00000000";
		ELSIF (clk'EVENT AND clk = '1') THEN
			CASE opcode IS
				WHEN "0000000000000001" => 
 
					-- Do addition for Reg1 and Reg2
					Result <= Reg1 + Reg2;
 
					--Set Neg Value Depending on index 7 & 3
					Neg2 <= UNSIGNED(Reg1 + Reg2)(7);
					Neg1 <= UNSIGNED(Reg1 + Reg2)(3);
 
				WHEN "0000000000000010" => 
					-- Do subtraction for Reg1 & Reg2
					IF (Reg1 < Reg2) THEN
						Result <= Reg2 - Reg1;
						Neg2 <= '1';
 
						--Set Neg1 Depending on index 3
						Neg1 <= UNSIGNED(Reg2 - Reg1)(3);
 
					ELSE
						Result <= Reg1 - Reg2;
						--Set Neg Values Depending on index 3
						Neg1 <= UNSIGNED(Reg1 - Reg2)(3);
					END IF;

				WHEN "0000000000000100" => 
					-- Do inverse
					Result <= NOT Reg1;
 
					--Set Neg Value Depending on index 7 and 3
					Neg2 <= UNSIGNED(NOT Reg1)(7);
					Neg1 <= UNSIGNED(NOT Reg1)(3);
				WHEN "0000000000001000" => 
					-- Do Boolean NAND
					Result <= (Reg1 NAND Reg2);
 
					--Set Neg Value Depending on index 7 and 3
					Neg2 <= UNSIGNED(Reg1 NAND Reg2)(7);
					Neg1 <= UNSIGNED(Reg1 NAND Reg2)(3);

				WHEN "0000000000010000" => 
					-- Do Boolean NOR
					Result <= (Reg1 NOR Reg2);
 
					--Set Neg Value Depending on index 7 and 3
					Neg2 <= UNSIGNED(Reg1 NOR Reg2)(7);
					Neg1 <= UNSIGNED(Reg1 NOR Reg2)(3);
 
				WHEN "0000000000100000" => 
					-- Do Boolean AND
					Result <= Reg1 AND Reg2;
 
					--Set Neg Value Depending on index 7 and 3
					Neg2 <= UNSIGNED(Reg1 AND Reg2)(7);
					Neg1 <= UNSIGNED(Reg1 AND Reg2)(3);

				WHEN "0000000001000000" => 
					-- Do Boolean XOR
					Result <= Reg1 XOR Reg2;

					--Set Neg Value Depending on index 7 and 3
					Neg2 <= UNSIGNED(Reg1 XOR Reg2)(7);
					Neg1 <= UNSIGNED(Reg1 XOR Reg2)(3);
 
				WHEN "0000000010000000" => 
					-- Do Boolean OR
					Result <= Reg1 OR Reg2;
 
					--Set Neg Value Depending on index 7 and 3
					Neg2 <= UNSIGNED(Reg1 OR Reg2)(7);
					Neg1 <= UNSIGNED(Reg1 OR Reg2)(3);

				WHEN OTHERS => 
					-- Don’t care, do nothing
					Result <= "--------";

				END CASE;
 
						--Switching index 3 & 7 to 0;
						Result(7) <= '0';
						Result(3) <= '0';
		END IF;
 
	END PROCESS;
 
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);
END calculation;