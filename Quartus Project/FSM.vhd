LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY FSM IS
	PORT (
		data_in, clk, reset : IN std_logic;
		student_id : OUT std_logic_vector(3 DOWNTO 0);
		current_state : OUT std_logic_vector(3 DOWNTO 0));

END FSM;
ARCHITECTURE fsm OF FSM IS
	TYPE state_type IS (s0, s1, s2, s3, s4, s5, s6, s7);
	SIGNAL yfsm : state_type;
BEGIN
	PROCESS (clk, reset)BEGIN
	
		IF reset = '0' THEN
			yfsm <= s0;
			
		ELSIF (clk'EVENT AND clk = '1') THEN
			CASE yfsm IS
				
				WHEN s0 => --Case 1 
					IF data_in = '1' THEN
						yfsm <= s1;
				END IF;
					
				WHEN s1 => --Case 2 
					IF data_in = '1' THEN
						yfsm <= s2;
				END IF;
					
				WHEN s2 => --Case 3 
					IF data_in = '1' THEN
						yfsm <= s3;
				END IF;
					
				WHEN s3 => --Case 4 
					IF data_in = '1' THEN
						yfsm <= s4;
				END IF;
					
				WHEN s4 =>  --Case 5 
					IF data_in = '1' THEN
						yfsm <= s5;
				END IF;
					
				WHEN s5 =>  --Case 6 
					IF data_in = '1' THEN
						yfsm <= s6;
				END IF;
					
				WHEN s6 => --Case 7 
					IF data_in = '1' THEN
						yfsm <= s7;
				END IF;
					
				WHEN s7 => --Case 8 
					IF data_in = '1' THEN
						yfsm <= s0;
				END IF;
				
			END CASE;
		END IF;
		
	END PROCESS;
	
	
	PROCESS (yfsm)BEGIN
	
			CASE yfsm IS
				WHEN s0 => current_state <= "0000";
				student_id <= "0000"; -- d2(0)
				
				WHEN s1 => current_state <= "0001";
				student_id <= "0001"; -- d3(1)
				
				WHEN s2 => current_state <= "0010";
				student_id <= "0010"; -- d4(2)
				
				WHEN s3 => current_state <= "0011";
				student_id <= "0101"; -- d5(5)
				
				WHEN s4 => current_state <= "0100";
				student_id <= "0111"; -- d6(7)
				
				WHEN s5 => current_state <= "0101";
				student_id <= "0100"; -- d7(4)
				
				WHEN s6 => current_state <= "0110";
				student_id <= "0010"; -- d8(2)
				
				WHEN s7 => current_state <= "0111";
				student_id <= "0100"; -- d9(4) 

			END CASE; -- d1 d2 d3 d4 d5 d6 d7 d8 d9
		END PROCESS; -- 5 0 1 2 5 7 4 2 4
END fsm; -- states: s0 s1 s2 s3 s4 s5 s6 s7