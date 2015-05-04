----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:08 04/13/2015 
-- Design Name: 
-- Module Name:    combo - Behavioral 
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

entity fork_combo is
	port(a_req, b_ack1, b_ack2, a_ack, init_clk : in std_logic;
	combo_out : out std_logic);
end fork_combo;

architecture Behavioral of fork_combo is

signal delayed_a_ack :  std_logic;

begin
  delayed_a_ack <= a_ack after 5 ns;
	combo_out <= (not a_req and delayed_a_ack and b_ack1 and b_ack2) or (a_req and not delayed_a_ack and not b_ack1 and not b_ack2) or init_clk;
end Behavioral;


