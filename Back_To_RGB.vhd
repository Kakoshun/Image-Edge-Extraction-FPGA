----------------------------------------------------------------------------------
-- Engineer:Betounis Ioannis 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use ieee.numeric_std.all;

entity Back_To_RGB is

generic
(
    word_width: integer := 8     -- dhlwsh bit
);
Port 
(
    REDin     : in std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy Red
    GREENin   : in std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy Green
    BLUEin    : in std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy Blue
    dataout     : out std_logic_vector ((word_width * 3) - 1 downto 0) -- dedomena e3odoy Red
	--clk_pix    : in STD_LOGIC;
	--OUT_clk_pix: out STD_LOGIC
);

end entity;

architecture Behavioral of Back_To_RGB is

begin

--p1: process(clk_pix)
--variable bw: integer;
--begin

--bw := to_integer(unsigned(REDin) + to_integer(unsigned(GREENin) + to_integer(unsigned(BLUEin);

dataout  (23 downto 16) <= REDin (15 downto 8);
dataout  (15 downto 8)  <= BLUEin (15 downto 8);
dataout  (7 downto 0)   <= GREENin (15 downto 8);

end Behavioral;