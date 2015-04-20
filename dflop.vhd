----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:52:42 04/13/2015 
-- Design Name: 
-- Module Name:    dflop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dflop is
	port(clk, data, reset, set : in std_logic;
	Q : out std_logic);
end dflop;

architecture Behavioral of dflop is

begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			if (reset = '1') then
				Q <= '0'; 
			else
				if (set = '1') then 
					Q <= '1';
				else
					Q <= data;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

