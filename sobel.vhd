----------------------------------------------------------------------------------
-- Company: RiS Lab
-- Engineer: John Kalomiros, John Vourvoulakis
-- 
-- Create Date: 08.06.2019 22:38:08
-- Design Name: 
-- Module Name: prewitt - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sobel is
    generic( row_width : POSITIVE:=640);
    Port   ( datain    : in STD_LOGIC_VECTOR (7 downto 0);
             dataout   : out STD_LOGIC_VECTOR(7 downto 0);
             clken     : in STD_LOGIC;
             reset_n   : in STD_LOGIC;
             clock     : in STD_LOGIC);
end sobel;

architecture Behavioral of sobel is
component shift_line
    generic(depth: POSITIVE; -- depth of delay line, nominally equal to image line
            width: NATURAL); -- bit width of shift register, nominally 8-bit
    Port ( shiftin : in STD_LOGIC_VECTOR(width-1 downto 0);
           clk, resetn: in STD_LOGIC;
           shiftout : out STD_LOGIC_VECTOR(width-1 downto 0));
end component;

signal data11, data12, data13, data21, data22, data23, data31, data32, data33: std_logic_vector(7 downto 0);
constant sobel_Threshold:	NATURAL  := 15;

begin
buffer1: shift_line
generic map(depth => row_width-2, width => 8)
port map(shiftin => data13, clk => clock, resetn => reset_n, shiftout => data21);
buffer2: shift_line
generic map(depth => row_width-2, width => 8)
port map(shiftin => data23, clk => clock, resetn => reset_n, shiftout => data31);
p1: process(clock)
variable Ix, Iy: INTEGER;
begin
if rising_edge(clock) then
	if clken = '1' then
		data12 <= data11;
		data13 <= data12;
		data22 <= data21;
		data23 <= data22;
		data32 <= data31;
		data33 <= data32;
		
			-- pinakas X
			
			Ix := abs(to_integer(unsigned(data23)) + to_integer(unsigned(data23)) + to_integer(unsigned(data13)) + to_integer(unsigned(data33)) 

		         - (to_integer(unsigned(data21)) + to_integer(unsigned(data21)) + to_integer(unsigned(data11)) + to_integer(unsigned(data31))));
		
		    -- pinakas Y
		    
		    Iy := abs(to_integer(unsigned(data12)) + to_integer(unsigned(data12)) + to_integer(unsigned(data11)) + to_integer(unsigned(data13)) 

		         - (to_integer(unsigned(data32)) + to_integer(unsigned(data32)) + to_integer(unsigned(data31)) + to_integer(unsigned(data33))));
		
		if ((Ix + Iy) > sobel_Threshold) then
			dataout <= "11111111";
		else
			dataout <= "00000000";
		end if;
		
	end if;
end if;
end process;

data11 <= datain;

end Behavioral;
