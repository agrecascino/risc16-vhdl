library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity memctrl is
	port(
		clk : in std_logic;
		len : in std_logic_vector(1 downto 0);
		ap1 : in std_logic_vector(31 downto 0);
		wen : in std_logic;
		ren : in std_logic;
		dp1 : out std_logic_vector(31 downto 0);
		unaligned : out std_logic;
		rdy       : out std_logic
		);
end memctrl;

architecture mctl of memctrl is
	component sprom is
		port
		(
			address		: in STD_LOGIC_VECTOR (13 downto 0);
			clock		: in STD_LOGIC  := '1';
			rden		: in STD_LOGIC  := '1';
			q		: out STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
	component dpram is
		port
		(
			address_a		: in STD_LOGIC_VECTOR (15 downto 0);
			address_b		: in STD_LOGIC_VECTOR (15 downto 0);
			clock		: in STD_LOGIC  := '1';
			data_a		: in STD_LOGIC_VECTOR (31 downto 0);
			data_b		: in STD_LOGIC_VECTOR (31 downto 0);
			rden_a		: in STD_LOGIC  := '1';
			rden_b		: in STD_LOGIC  := '1';
			wren_a		: in STD_LOGIC  := '0';
			wren_b		: in STD_LOGIC  := '0';
			q_a		: out STD_LOGIC_VECTOR (31 downto 0);
			q_b		: out STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
	signal romaddr : std_logic_vector(13 downto 0);
	signal romenable : std_logic;
	signal romout : std_logic_vector(31 downto 0);
	signal last_input : std_logic;
	signal mask : std_logic_vector(31 downto 0);
	signal ramaddra : std_logic_vector(15 downto 0);
	signal ramaddrb : std_logic_vector(15 downto 0);
	signal ramouta  : std_logic_vector(31 downto 0);
	signal ramoutb  : std_logic_vector(31 downto 0);
	signal enable_a_r : std_logic;
	signal enable_b_r : std_logic;
	signal enable_a_w : std_logic;
	signal enable_b_w : std_logic;
	signal lastarom : std_logic;
	signal lastaram : std_logic;
	signal ramina : std_logic_vector(31 downto 0);
	signal raminb : std_logic_vector(31 downto 0);
	signal resbitmask : std_logic_vector(31 downto 0);
	signal resshiftamt : std_logic_vector(7 downto 0);
	
begin
	rom : sprom port map(romaddr, clk, romenable, romout);
	ram : dpram port map(ramaddra, ramaddrb, clk, ramina, raminb, enable_a_r, enable_b_r, enable_a_w, enable_b_w, ramouta, ramoutb);
	process(clk)
	begin
		if falling_edge(clk) then
			if ren = '1' then
			   case ap1(1 downto 0) is
					when "10" => 
						case len is
							when "00" =>
								resbitmask <= x"0000FF00";
								resshiftamt <= x"08";
							when "01" =>
								resbitmask <= x"0000FFFF";
								resshiftamt <= x"00";
							when others =>
								unaligned <= '1';
								rdy <= '1';
						end case;
					when "00" =>
						case len is
							when "00" =>
								resbitmask <= x"FF000000";
								resshiftamt <= x"18";
							when "01" => 
								resbitmask <= x"FFFF0000";
								resshiftamt <= x"10";
							when "11" =>
								resbitmask <= x"FFFFFFFF";
								resshiftamt <= x"00";
						   when others =>
								unaligned <= '1';
								rdy <= '1';
						end case;
					when "01" =>
						case len is 
							when "00" =>
								resbitmask <= x"00FF0000";
								resshiftamt <= x"10";
							when others =>
								unaligned <= '1';
								rdy <= '1';
						end case;
					when "11" =>
						case len is
							when "00" =>
								resbitmask <= x"000000FF";
								resshiftamt <= x"00";
							when others =>
								unaligned <= '1';
								rdy <= '1';
						end case;
				end case;
							
			   if lastarom = '1' then
					rdy <= '1';
					dp1 <= std_logic_vector(shift_right(unsigned(romout and resbitmask), to_integer(unsigned(resshiftamt)))); 
				elsif lastaram = '1' then
					rdy <= '1';
					dp1 <= std_logic_vector(shift_right(unsigned(ramouta and resbitmask), to_integer(unsigned(resshiftamt)))); 
				end if;
				if unsigned(ap1) < 65536 then
					lastarom <= '1';
					lastaram <= '0';
					romaddr <= std_logic_vector(shift_right(unsigned(ap1), 2))(13 downto 0);
					romenable <= '1';
				elsif unsigned(ap1) < 327681 then
					lastarom <= '0';
					lastaram <= '1';
					enable_a_r <= '1';
					ramaddra <= std_logic_vector(shift_right(unsigned(ap1) - 65536, 2))(15 downto 0);
				else
			   	lastarom <= '0';
					lastaram <= '0';
					rdy <= '1';
					dp1 <= x"00000000";
				end if;
			end if;
		end if;
	end process;
end mctl;