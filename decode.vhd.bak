library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decodeunit is 
	port(
		instruction : in std_logic_vector(31 downto 0);
		aluop : out std_logic_vector(1 downto 0);
		reg1 : out std_logic_vector(3 downto 0);
		reg2 : out std_logic_vector(3 downto 0);
		reg3 : out std_logic_vector(3 downto 0);
		cfl  : out std_logic;
		cflid : out std_logic_vector(3 downto 0);
		bitop : out std_logic;
		bitid : out std_logic_vector(3 downto 0)
		);
end decodeunit;