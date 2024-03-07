----------------------------------------------------------------------------------
-- Engineer:Betounis Ioannis 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity blackw_white is

generic
(
    word_width: integer := 8     -- dhlwsh bit
);

Port 
(
   
    REDin      : in std_logic_vector (word_width - 1 downto 0); -- dedomena eisodoy
    GREENin    : in std_logic_vector (word_width - 1 downto 0); -- dedomena eisodoy
    BLUEin     : in std_logic_vector (word_width - 1 downto 0); -- dedomena eisodoy
    dataout    : out std_logic_vector (word_width - 1 downto 0); -- dedomena e3odoy
	clk_pix    : in STD_LOGIC;
	OUT_clk_pix: out STD_LOGIC

);

end entity;

architecture Behavioral of blackw_white is

SIGNAL grayPixel_u   : UNSIGNED((word_width * 2) - 1 downto 0);
SIGNAL redSignal_u   : UNSIGNED(word_width - 1 downto 0);
SIGNAL greenSignal_u : UNSIGNED(word_width - 1 downto 0);
SIGNAL blueSignal_u  : UNSIGNED(word_width - 1 downto 0);

begin 

VideoEdition:

process(clk_pix)
begin
	if rising_edge(clk_pix) then	
			grayPixel_u <= (x"4c"*unsigned(REDin) + x"97"*unsigned(GREENin) + x"1C"*unsigned(BLUEin)); --weighted color
	end if;
end process VideoEdition;

dataout <= std_logic_vector(grayPixel_u((word_width * 2) - 1 downto word_width)); 

OUT_clk_pix <= clk_pix;

end Behavioral;