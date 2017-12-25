library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity alu32 is
	port(
		clk : in std_logic;
		op  : in std_logic_vector(1 downto 0);
		except : out std_logic;
		etype : out std_logic_vector(1 downto 0);
		in1 : in std_logic_vector(31 downto 0);
		in2 : in std_logic_vector(31 downto 0);
		out1 : out std_logic_vector(31 downto 0);
		extend : out std_logic_vector(31 downto 0)
	);
end alu32;

architecture alu of alu32 is
begin
	process(clk)
		variable temporary : unsigned(63 downto 0);
	begin
		temporary := x"0000000000000000";
		if falling_edge(clk) then
			if op(0) = '1' then
				temporary := (x"00000000" & unsigned(in1)) + unsigned(in2);
				extend <= std_logic_vector(temporary(63 downto 32));
				out1 <= std_logic_vector(temporary(31 downto 0));
			end if;
			if op(1) = '1' then
				temporary := (x"00000000" & unsigned(in1)) - unsigned(in2);
				extend <= std_logic_vector(temporary(63 downto 32));
				out1 <= std_logic_vector(temporary(31 downto 0));
			end if;
			if temporary /= 0 then
				except <= '1';
				etype <= "00";
			end if;
		end if;
	end process;
end alu;