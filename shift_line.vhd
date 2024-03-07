----------------------------------------------------------------------------------
-- Company: RiS Lab
-- Engineer: John Kalomiros
-- 
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

entity shift_line is
GENERIC(depth: POSITIVE;--depth of delay line, nominally equal to image line
        width: NATURAL); -- bit width of shift register, nominally 8-bit
    Port ( shiftin : in STD_LOGIC_VECTOR(width-1 downto 0);
           clk, resetn: in STD_LOGIC;
           shiftout : out STD_LOGIC_VECTOR(width-1 downto 0));
end shift_line;

architecture Behavioral of shift_line is
SUBTYPE sample IS STD_LOGIC_VECTOR(width-1 downto 0); --�������� ��� �������� ��� ��� ������ 
TYPE OneD IS ARRAY(NATURAL RANGE <>) OF sample;
begin
PROCESS(clk, Resetn)
VARIABLE q : OneD(0 TO depth);--Array q holds the outputs of FFs
BEGIN	
IF Resetn='0' THEN
gen0: FOR i IN 1 TO depth LOOP
      q(i):=(OTHERS=>'0');
      END LOOP;
 		ELSIF clk'EVENT AND clk='1' THEN
		q(0):=shiftin;
gen1: FOR i IN depth DOWNTO 1 LOOP --see paragraph 6.9	
 		q(i):= q(i-1);
 	    END LOOP;
 END IF;
 	shiftout<=q(depth);
END PROCESS;
end Behavioral;
