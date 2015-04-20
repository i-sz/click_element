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
	init : in std_logic;
	output : out std_logic
);
end component;

signal init_s : std_logic;
signal output_s : std_logic;

begin

dut : three_stage_ring port map(
	init => init_s,
	output => output_s
);

process
begin

init_s <= '0';
wait for 10 ns;
init_s <= '1';
wait for 20 ns;
init_s <= '0';
end process;
	   
  

end testbench;
