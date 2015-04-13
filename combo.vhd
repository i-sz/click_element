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

entity combo is
	port(a_req, b_ack, a_ack : in std_logic;
	combo_out : out std_logic);
end combo;

architecture Behavioral of combo is

begin
	combo_out <= (not a_req and a_ack and b_ack) or (a_req and not a_ack and not b_ack);
end Behavioral;

