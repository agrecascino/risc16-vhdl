entity memctrl is
	port(
		clk : in std_logic;
		len : in std_logic_vector(1 downto 0);
		ap1 : in std_logic_vector(31 downto 0);
		wen : in std_logic;
		ren : in std_logic;
		dp1 : out std_logic_vector(31 downto 0)
		unaligned : out std_logic;
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
	end sprom;
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
	end dpram;
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
	signal ramina : std_logic_vector(31 downto 0);
	signal raminb : std_logic_vector(31 downto 0);
	
begin
	rom : sprom port map(romaddr, clk, romenable, romout);
	ram : dpram port map(ramaddra, ramaddrb, clk, ramina, raminb, enable_a_r, enable_b_r, enable_a_w, enable_b_w, ramouta, ramoutb);
	process(clk)
	begin
		if falling_edge(clk) then
			if ren = '1' then
				if ap1 >
			end if;
		end if;
	end process;
end mctl;