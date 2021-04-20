----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2021 18:07:26
-- Design Name: 
-- Module Name: hall - Behavioral
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

entity hall is
    port(
            clk     : in  std_logic;
            reset   : in  std_logic;
            run     : out std_logic;
            number  : out integer
        );
end hall;

architecture Behavioral of hall is

    signal s_runtime : integer;

begin

    time_stop : entity work.clock_enable
        port map(

    
            runtime => s_runtime,
            clk     => clk,
            reset   => reset,
            run     => run
        );

end Behavioral;
