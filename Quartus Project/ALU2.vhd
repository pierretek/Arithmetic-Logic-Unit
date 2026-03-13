LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
ENTITY ALU2 IS -- ALU unit includes Reg. 3
	PORT (
		clk, res : IN std_logic;
		A, B : IN std_logic_vector(7 DOWNTO 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
		opcode : IN std_logic_vector(15 DOWNTO 0); -- 8-bit opcode from Decoder
		Neg1 : OUT std_logic;
		Neg2 : OUT std_logic;
		R1 : OUT std_logic_vector(3 DOWNTO 0);
		R2 : OUT std_logic_vector(3 DOWNTO 0)); -- 8-bit Result
END ALU2;
ARCHITECTURE calculation OF ALU2 IS
	SIGNAL Reg1, Reg2, Result : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
	
BEGIN

	Reg1 <= A;
	Reg2 <= B;
	
	PROCESS (clk, res)
	BEGIN
		IF res = '1' THEN
			Result <= "00000000";
		ELSIF (clk'EVENT AND clk = '1') THEN
		
			CASE opcode IS
				WHEN "0000000000000001" => 
				
					-- Invert the bit-significance order of A
					Result <= Reg1(0)&Reg1(1)&Reg1(2)&Reg1(3)&Reg1(4)&Reg1(5)&Reg1(6)&Reg1(7);

					--Set Neg Values
					Neg2 <= Reg1(0);
					Neg1 <= Reg1(4);
 
				WHEN "0000000000000010" => 
					-- Shift A to left by 4 bits, input bit = 1 (SHL)
					Result <= Reg1(3 DOWNTO 0)& "1111";
					
					--Set Neg Values
					Neg2 <= Reg1(3);
					Neg1 <= '1';
 
				WHEN "0000000000000100" => 
					-- Invert upper four bits of B
					Result <= (NOT Reg2(7 DOWNTO 4))& Reg2(3 DOWNTO 0);
					
					--Set Neg Values
					Neg2 <= NOT Reg2(7);
					Neg1 <= Reg2(3);
 
				WHEN "0000000000001000" => 
					-- Find the smaller value of A and B and produce the results ( Min(A,B) )
					IF (Reg1 < Reg2) THEN
					Result <= Reg1;
					
					--Set Neg Values
					Neg2 <= Reg1(7);
					Neg1 <= Reg1(3);
					
					
					ELSE
					Result <= Reg2;
					
				   --Set Neg Values
					Neg2 <= Reg2(7);
					Neg1 <= Reg2(3);
					END IF;
					
 
				WHEN "0000000000010000" => 
					-- Calculate the summation of A and B and increase it by 4
					Result <= Reg1 + Reg2+ "00000100";
					
					--Set Neg Values
					Neg2 <= UNSIGNED(Reg1 + Reg2+ "00000100")(7);
					Neg1 <= UNSIGNED(Reg1 + Reg2+ "00000100")(3);
 
				WHEN "0000000000100000" => 
					-- Increment A by 3
					Result <= Reg1+ "00000011";
					
					--Set Neg Values
					Neg2 <= UNSIGNED(Reg1+ "00000011")(7);
					Neg1 <= UNSIGNED(Reg1+ "00000011")(3);					
					
 
				WHEN "0000000001000000" => 
					-- Replace the even bits of A with even bits of B
					Result <= Reg1(7)&Reg2(6)&Reg1(5)&Reg2(4)&Reg1(3)&Reg2(2)&Reg1(1)&Reg2(0);
					
										--Set Neg Values
					Neg2 <= Reg1(7);
					Neg1 <= Reg1(3);		
 
				WHEN "0000000010000000" => 
					-- Produce the result of XNORing A and B
					Result <= NOT(Reg1 XOR Reg2);
					
					--Set Neg Values
					Neg2 <= UNSIGNED(NOT(Reg1 XOR Reg2))(7);
					Neg1 <= UNSIGNED(NOT(Reg1 XOR Reg2))(3);					
					
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