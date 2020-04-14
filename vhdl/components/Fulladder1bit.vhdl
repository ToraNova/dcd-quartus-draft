-- Fulladder1bit Entity
-- Describes the Entity/Arch pair for a 1-bit full adder
-- This file shall contain no more than the entity (interface)
-- and its architecture (logic). Name of file shall be same as that of entity
--
-- Written by ToraNova
-- chia_jason96@live.com
-- DCD-quartus-draft project

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;

-- only the first char in entity names are capitalized
entity Fulladder1bit is
	port(
		a, b, cin : in std_logic;
		s, cout : out std_logic -- this irks me so much
	);
end entity;

-- the architecture of the entity bears the same name
-- it definen how the circuit process the I/O
architecture logic of Fulladder1bit is
begin
	s <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (b and cin);
end architecture;
