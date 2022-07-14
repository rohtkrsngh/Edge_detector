----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2022 17:45:42
-- Design Name: 
-- Module Name: Edge_dect_comb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Edge_dect_comb is
  Port (clk, rst : in std_logic;   -- clock and reset as input
        Din : in std_logic;        -- data in 
        Dout : out std_logic );    -- data out
end Edge_dect_comb;

architecture Behavioral of Edge_dect_comb is
signal D0_reg : std_logic ;
signal D1_reg : std_logic ;
begin
process(clk)
begin
    if rst = '1' then
        D0_reg <= '0';
        D1_reg <= '0';
    elsif rising_edge(clk) then
        D0_reg <= Din;
        D1_reg <= D0_reg;
    end if;  
end process;
Dout <= not D1_reg and D0_reg;
end Behavioral;
