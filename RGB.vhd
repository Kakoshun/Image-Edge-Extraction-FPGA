----------------------------------------------------------------------------------
-- Engineer:Betounis Ioannis 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use ieee.numeric_std.all;

entity RGB is

generic
(
    word_width: integer := 8     -- dhlwsh bit
);
Port 
(
    
    datain     : in std_logic_vector ((word_width * 3) - 1 downto 0); -- dedomena eisodoy
    REDout     : out std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy Red
    GREENout   : out std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy Green
    BLUEout    : out std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy Blue
	clk_pix    : in STD_LOGIC;
	OUT_clk_pix: out STD_LOGIC
	
);
end entity;

architecture Behavioral of RGB is

begin

RGBSplit:
process(clk_pix)
begin
	if rising_edge(clk_pix) then
REDout   <= datain ((word_width * 3) - 1 downto word_width * 2);
GREENout <= datain ((word_width * 2) - 1 downto word_width);
BLUEout  <= datain (word_width - 1 downto word_width - word_width);
	end if;
end process RGBSplit;

OUT_clk_pix <= clk_pix;

end Behavioral;