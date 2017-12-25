library work;
use work.types.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity regbank32 is
	port(
		clk : in std_logic;
		enable : in std_logic;
   	regp1 : in std_logic_vector(3 downto 0);
		regp2 : in std_logic_vector(3 downto 0);
		regp3 : in std_logic_vector(3 downto 0);
		rval : in std_logic_vector(31 downto 0);
		rout : out std_logic_vector(31 downto 0);
		rout2 : out std_logic_vector(31 downto 0)
	);
end regbank32;	

library work;
use work.all;
architecture bank of regbank32 is
	component r32 is
		port(
			clk : in std_logic;
			rval : in std_logic_vector(31 downto 0);
			rout : out std_logic_vector(31 downto 0);
			enable : inout std_logic
		);
	end component;
	signal regin : reginarray;
	signal regout : regoutarray;
	signal regclr : regclrarray;
begin
	r32_gen:
	for i in 0 to 15 generate
		registers : r32 port map
			(clk, regin(i), regout(i), regclr(i));
	end generate r32_gen;
	process (clk)
	begin
		if falling_edge(clk) then
			regclr(0 to 15) <= (others => '0');
			if enable = '1' then
				regclr(to_integer(unsigned(regp3))) <= '1';
				regin(to_integer(unsigned(regp3))) <= rval;
			end if;
			rout <= regout(to_integer(unsigned(regp1)));
			rout2 <= regout(to_integer(unsigned(regp2)));
		end if;
	end process;
end bank;