----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 15:49:28
-- Design Name: 
-- Module Name: tb_d_ff_arst - Behavioral
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

entity tb_d_ff_rst is
--  Port ( );
end tb_d_ff_rst;

architecture Behavioral of tb_d_ff_rst is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;

    signal s_rst        : std_logic;
    signal s_d          : std_logic;
    
    signal s_q          : std_logic;
    signal s_q_bar      : std_logic;

begin

    uut_d_ff_rst : entity work.d_ff_rst
        port map(
            clk  => s_clk_100MHz,
            rst => s_rst,
            d => s_d,
            q => s_q,
            q_bar => s_q_bar
        );
        
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
        
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 28 ns;
        
        -- Reset activated
        s_rst <= '1';
        wait for 53 ns;

        s_rst <= '0';
        wait for 640 ns;
        
        s_rst <= '1';


        wait;
    end process p_reset_gen;
    
    ---------------------------------------------  
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_d <= '0';
        
        wait for 14 ns;
        s_d <= '1';
        wait for 50 ns;
        s_d <= '0';
        
        wait for 6 ns;
        --assert ()
        --report "";
        
        wait for 4 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        
        
        report "Stimulus process finished" severity note;    
    end process p_stimulus;

end Behavioral;
