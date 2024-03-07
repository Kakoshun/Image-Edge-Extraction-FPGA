library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
----------------------------

entity sobel_tb is
end entity;

----------------------------

architecture sobel_tb_Arch of sobel_tb is

constant platos : POSITIVE := 640; 

component sobel is
generic
(
	row_width: POSITIVE:=640
);
port
(
		datain : in STD_LOGIC_VECTOR (7 downto 0);
      dataout : out STD_LOGIC_VECTOR(7 downto 0);
      clken : in STD_LOGIC;
      reset_n: in STD_LOGIC;
      clock : in STD_LOGIC
);
end component;

signal datain  : std_logic_vector(7 downto 0);
signal dataout : std_logic_vector(7 downto 0);
signal reset_n : std_logic;
signal clock   : std_logic;
signal clken   : std_logic;

begin

dut: sobel generic map
(
	row_width => platos
)
port map
(
	datain		=> datain,
	dataout		=> dataout,
	reset_n		=> reset_n,
	clock			=> clock,
	clken       => clken 
);

process

file rp: text open read_mode is "input_im.dat"; -- arxeio apo to opoio 8a diabasei ta dedomena 
variable line_rd: line;

file wp: text open write_mode is "out_im.dat"; -- arxeio poy 8a dhmioyrgh8ei me to sobel
variable line_wr: line;

variable a: integer range 0 to 2 ** 8 - 1;

variable i, j: integer;

begin

reset_n <= '0';
clock   <= '0';
clken   <= '0'; -- pros8hkh den yphrxe sto paradeigma

wait for 10 ns;

reset_n <= '1';

wait for 10 ns;

i := 1;
j := 1;

while(not endfile(rp)) loop

	-- dedomena apo eikona
	
	readline(rp, line_rd);
	read(line_rd, a);
	
	datain <= std_logic_vector(to_unsigned(a, 8));
	
	clock <= '1';
	clken <= '1'; -- pros8hkh den yphrxe sto paradeigma
	
	wait for 10 ns;
	
	-- paragomena dedomena
	
	if ((i >= 0) and (j >= 0)) then
	
		write(line_wr, to_integer(unsigned(dataout)));
		writeline(wp, line_wr);
	
	end if;
	
	clock <= '0';
	
	wait for 10 ns;
	
	
	if j < platos then
		j := j + 1;
	else
		j := 1;
		i := i + 1;
		
	end if;
	
end loop;


end process;

end sobel_tb_Arch;