library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_three_stage_ring is
end tb_three_stage_ring;

architecture testbench of tb_three_stage_ring is

component three_stage_ring
port(
	init, init_clk, set_3, reset_3, init_clk_3 : in std_logic;
	output : out std_logic
);
end component;

signal init_s : std_logic;
signal init_clk_s : std_logic;
signal output_s : std_logic;
signal set_3_s : std_logic;
signal reset_3_s : std_logic;
signal init_clk_3_s : std_logic;

begin

dut : three_stage_ring port map(
	init => init_s,
	init_clk => init_clk_s,
	set_3 => set_3_s,
	reset_3 => reset_3_s,
	init_clk_3 => init_clk_3_s,
	output => output_s
);

process
begin

-- Initialize all three click elements to 0
init_clk_s <='0';
init_s <= '0';
set_3_s <= '0';
reset_3_s <= '0';
init_clk_3_s <= '0';
wait for 5 ns;
init_s <= '1';
reset_3_s <= '1';
wait for 10 ns;
init_clk_s <= '1';
init_clk_3_s <= '1';
wait for 5 ns;
init_s <= '0';
reset_3_s <= '0';
init_clk_s <= '0';
init_clk_3_s <= '0';
wait for 35 ns;

-- Fire request on the third click element
set_3_s <= '1';
wait for 35 ns;
init_clk_3_s <= '1';
wait for 5 ns;
init_clk_3_s <= '0';
set_3_s <= '0';

wait for 200 ns;

end process;
	   
  

end testbench;

