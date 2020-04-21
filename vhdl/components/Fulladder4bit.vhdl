-- Fulladder4bit Entity
-- Describes the Entity/Arch pair for a 4-bit full adder
-- This file shall contain no more than the entity (interface)
-- and its architecture (logic). Name of file shall be same as that of entity
-- this uses the Fulladder1bit Entity
--
-- Written by ToraNova
-- chia_jason96@live.com
-- DCD-quartus-draft project

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;

-- only the first char in entity names are capitalized
entity Fulladder4bit is
	port(
		a, b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		s : out std_logic_vector(3 downto 0);
		cout : out std_logic --this irks me
	);
end entity;

-- the architecture of the entity bears the same name
-- it definen how the circuit process the I/O
architecture logic of Fulladder4bit is
	-- declare the component that we will be using
	component Fulladder1bit is
		port(
			a, b, cin : in std_logic;
			s, cout : out std_logic
		);
	end component;
	-- declare the signals (internal wiring)
	signal c : std_logic_vector(4 downto 0);
begin
	-- this is hardcoding and just dumb
	-- u0: Fulladder1bit port map(a => a(0), b => b(0), s => s(0), cin => cin,  cout => c(1));
	-- u1: Fulladder1bit port map(a => a(1), b => b(1), s => s(1), cin => c(1), cout => c(2));
	-- u2: Fulladder1bit port map(a => a(2), b => b(2), s => s(2), cin => c(2), cout => c(3));
	-- u3: Fulladder1bit port map(a => a(3), b => b(3), s => s(3), cin => c(3), cout => cout);
	
	--using generate statement
	gen: for i in 0 to 3 generate
		u: Fulladder1bit port map(a => a(i), b => b(i), s => s(i), cin => c(i), cout => c(i+1));
	end generate;
	c(0) <= cin;
	cout <= c(4);
end architecture;
