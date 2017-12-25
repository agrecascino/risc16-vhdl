library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package types is
	type reginarray is array (0 to 15) of std_logic_vector(31 downto 0);
	type regoutarray is array (0 to 15) of std_logic_vector(31 downto 0);
	type regclrarray is array (0 to 15) of std_logic;
end types;