----------------------------------------------------------------------------------
-- Company: RiS Lab
-- Engineer: John Kalomiros, John Vourvoulakis
-- Remaster : Betounis Ioannis - 13.12.2020 19:38:45
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

entity sobel_filter is
    generic( data_width: POSITIVE := 8;
             timh_sobel: NATURAL  := 70);
    Port   ( datain          : in STD_LOGIC_VECTOR  (data_width - 1 downto 0);
             dataout         : out STD_LOGIC_VECTOR (data_width - 1 downto 0);
             pixel_clock_in  : in STD_LOGIC;
             pixel_clock_out : out STD_LOGIC);
end sobel_filter;

architecture Behavioral of sobel_filter is

signal data11, data12, data13, data21, data22, data23, data31, data32, data33: std_logic_vector(data_width - 1 downto 0);

begin
p1: process(pixel_clock_in)
variable Ix, Iy: INTEGER;
begin
if rising_edge(pixel_clock_in) then
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
		
		if ((Ix + Iy) > timh_sobel) then
			dataout <= "11111111";
		else
			dataout <= "00000000";
		end if;
		
end if;
end process;

data11 <= datain;
pixel_clock_out <= pixel_clock_in;

end Behavioral;