library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decodeunit is 
	port(
		clk : in std_logic;
		instruction : in std_logic_vector(31 downto 0);
		ivalid : in std_logic;
		except : in std_logic;
		aluop : out std_logic_vector(1 downto 0);
		aluin : out std_logic_vector(31 downto 0);
		aluin2 : out std_logic_vector(31 downto 0);
		wbreg : out std_logic_vector(3 downto 0); 
		cfl  : out std_logic;
		cflid : out std_logic_vector(3 downto 0)
		);
end decodeunit;

architecture decode of decodeunit is 
begin
	process(clk) 
	begin
		if rising_edge(clk) then
			if ivalid = '1' then
				
			end if;
		end if;
	end process;
end decode;