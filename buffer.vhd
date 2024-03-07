----------------------------------------------------------------------------------
-- Company: RiS Lab
-- Engineer: John Kalomiros
-- Remaster : Betounis Ioannis - 13.12.2020 19:38:45
-- Create Date: 08.06.2019 22:39:30
-- Design Name: shift line
-- Module Name: shift_line - Behavioral
-- Project Name: edge detector
-- Target Devices: 
-- Tool Versions: 
-- Description: generic delay line for image line buffering
-- 
-- Dependencies: shift_line
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buffer_lines is

GENERIC (depth      : POSITIVE:= 1024;--depth of delay line, nominally equal to image line
         data_width : POSITIVE:= 8); -- bit width of shift register, nominally 8-bit

Port    ( datain         : in STD_LOGIC_VECTOR(data_width - 1 downto 0);
          pixel_clk_in   : in STD_LOGIC;
          resetn         : in STD_LOGIC;
          data_out_11    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_12    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_13    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_21    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_22    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_23    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_31    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_32    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          data_out_33    : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
          pixel_clk_out  : out STD_LOGIC
          );
          
end buffer_lines;

architecture Behavioral of buffer_lines is

SUBTYPE sample IS STD_LOGIC_VECTOR (data_width - 1 downto 0); 

TYPE OneD IS ARRAY(NATURAL RANGE <>) OF sample;

signal data11, data12, data13, data21, data22, data23, data31, data32, data33: std_logic_vector(data_width - 1 downto 0);

begin

PROCESS(pixel_clk_in, Resetn)

VARIABLE q : OneD (0 TO depth);--Array q holds the outputs of FFs

BEGIN	

IF Resetn='0' THEN

gen0: FOR i IN 1 TO depth LOOP
      q(i):= (OTHERS => '0');
      END LOOP;

ELSIF pixel_clk_in' EVENT AND pixel_clk_in = '1' THEN
q(0) := datain;

gen1: FOR i IN depth DOWNTO 1 LOOP --see paragraph 6.9	
 		q(i):= q( i - 1);
 	    END LOOP;

 END IF;
 	 	data11 <= q(depth);
		data12 <= data11;
		data13 <= data12;
		data22 <= data21;
		data23 <= data22;
		data32 <= data31;
		data33 <= data32;

END PROCESS;

data_out_11 <= data11;
data_out_12 <= data12;
data_out_13 <= data13;
data_out_21 <= data21;
data_out_22 <= data22;
data_out_23 <= data23;
data_out_31 <= data31;
data_out_32 <= data32;
data_out_33 <= data33;

pixel_clk_out <= pixel_clk_in;

end Behavioral;