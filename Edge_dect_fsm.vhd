----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.07.2022 16:21:40
-- Design Name: 
-- Module Name: Edge_dect - Behavioral
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

entity Edge_dect_fsm is
  Port (clk, rst : in std_logic;   -- clock and reset as input
        Din : in std_logic;        -- data in 
        Dout : out std_logic );    -- data out
end Edge_dect_fsm;

architecture Behavioral of Edge_dect_fsm is
type state is (s1, s2);     -- state machine
signal cs,ns : state;       -- cs--> current state , ns ---> next state
signal D_reg : std_logic :='0';
begin
process(clk)     
begin
    if rst = '1' then       -- asyn rst high
        cs <= s1;
    elsif rising_edge(clk) then   -- check state at rising edge of clk
        cs <= ns;
    end if;
end process;

process(cs, Din)      -- in sensytivity list all inputs 
begin
    case cs is
        when s1 =>  if din = '0' then
                        D_reg <= '0';
                        ns <= s1;
                    else
                        D_reg <= '1';
                        ns <= s2;
                    end if;
        when s2 => if din ='1' then
                        D_reg <= '0';
                        ns <= s2;
                   else 
                        D_reg <= '0';
                        ns <= s1;
                   end if;
    end case;
end process;
Dout <= D_reg;
end Behavioral;
