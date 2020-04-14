-- Adder testbench Entity
-- This file is used to drive (and test) adders in simulation
--
-- Written by ToraNova
-- chia_jason96@live.com
-- DCD-quartus-draft project

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;

-- adder testbench
entity add_tb is
end entity;

architecture sim of add_tb is

	signal a : std_logic := '0';
	signal b : std_logic := '0';
	signal ci : std_logic := '0';
	signal s, co : std_logic;

	component Fulladder1bit is
		port(
			a, b, cin : in std_logic;
			s, cout : out std_logic
		);
	end component;

begin
	ad0 : Fulladder1bit port map ( a => a, b => b, cin => ci, s => s, cout => co );
	-- another neat way without using component is the following syntax
	--ad0 : entity work.Fulladder1bit port map ( a => a, b => b, cin => ci, s => s, cout => co );

	process is
	begin
		wait for 1 us;
		a <= '1';
		wait for 1 us;
		ci <= '1';
		wait for 1 us;
		a <= '0';
		b <= '1';
		wait for 1 us;
		ci <= '0';
		wait for 1 us;
		a <= '1';
		b <= '1';
		wait for 1 us;
		ci <= '1';

		report "Done";
		wait;
	end process;
end architecture;
