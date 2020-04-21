-- 4 bit adder test
-- show cases a test bench which exhausts a list of possibilities
-- what's the diff between 'AND' and 'and' ?

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- this allow the to_unsigned keyword

entity add4_tb is
end entity;

architecture sim of add4_tb is
	signal a : std_logic_vector(3 downto 0) := (others => '0'); --input
	signal b : std_logic_vector(3 downto 0) := (others => '0'); --input
	signal s : std_logic_vector(3 downto 0); --output
	signal cin, cout  : std_logic;
	
	component Fulladder4bit is
		port(
		a, b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		s : out std_logic_vector(3 downto 0);
		cout : out std_logic --this irks me
		);
	end component;

begin
	fa4: Fulladder4bit port map(a => a, b => b, s => s, cin => cin, cout => cout);
	
	procseq : process
	begin
	cin <= '0';
	for i in 0 to 2**a'length - 1 loop
		for j in 0 to 2**b'length -1 loop
			a <= std_logic_vector(to_unsigned(i, a'length));
			b <= std_logic_vector(to_unsigned(j, b'length));
			wait for 10 ps;
		end loop;
	end loop;
	
	cin <= '1';
	for i in 0 to 2**a'length - 1 loop
		for j in 0 to 2**b'length -1 loop
			a <= std_logic_vector(to_unsigned(i, a'length));
			b <= std_logic_vector(to_unsigned(j, b'length));
			wait for 10 ps;
		end loop;
	end loop;

	report "Done";
	wait;
	end process;
end architecture;
