----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:08 04/13/2015 
-- Design Name: 
-- Module Name:    adder_combo - Behavioral 
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

entity adder_combo is
	port(a_req, b_req, c_ack, c_req, init_clk : in std_logic;
	combo_out : out std_logic);
end adder_combo;

architecture Behavioral of adder_combo is

-- signal delayed_a_ack :  std_logic;

begin
	-- delayed_a_ack <= a_ack after 5 ns;
	combo_out <= (a_req and b_req and not c_req and not c_ack) or (not a_req and not b_req and c_req and c_ack) or init_clk;
end Behavioral;
