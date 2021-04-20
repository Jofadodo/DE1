------------------------------------------------------------------------
--
-- Driver for 4-digit 7-segment display.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for display driver
------------------------------------------------------------------------
entity driver_7seg_4digits is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;

        dp_i    : in  std_logic_vector(4 - 1 downto 0);

        dp_o    : out std_logic;

        seg_o   : out std_logic_vector(7 - 1 downto 0);

        dig_o   : out std_logic_vector(4 - 1 downto 0);
        
        decimal : in integer range 0 to 999
    );
end entity driver_7seg_4digits;

------------------------------------------------------------------------
-- popis...
------------------------------------------------------------------------
architecture Behavioral of driver_7seg_4digits is

    signal s_en  : std_logic;

    signal s_cnt : std_logic_vector(2 - 1 downto 0);

    signal s_hex : integer range 0 to 9999;
    
    signal s_decimal : integer range 0 to 9999;
    
    signal buff     : integer:=0;
    signal tousands : integer:=0;
    signal hundreds : integer:=0;
    signal decimals : integer:=0;
    signal ones     : integer:=0;
    
    signal s_data0_i : integer range 0 to 9999;
    signal s_data1_i : integer range 0 to 9999;
    signal s_data2_i : integer range 0 to 9999;
    signal s_data3_i : integer range 0 to 9999;

begin
    s_decimal <= decimal;

    hex2seg : entity work.hex_7seg
        port map(
            hex_i => s_hex,
            seg_o => seg_o
        );

    p_mux_dec : process(clk, s_decimal)    
    begin

        if(s_decimal > (buff + 1000)) then 
            buff <= buff + 1000;
            tousands <= tousands + 1;
        elsif(s_decimal > (buff + 100)) then 
            buff <= buff + 100;
            hundreds <= hundreds + 1;
        elsif(s_decimal > (buff + 10)) then 
            buff <= buff + 10;
            decimals <= decimals + 1;
        elsif(s_decimal >= (buff + 1)) then 
            buff <= buff + 1;
            ones <= ones + 1;
        end if;


        
        if(s_decimal = buff) then
            s_data3_i <= tousands;
            s_data2_i <= hundreds;
            s_data1_i <= decimals;
            s_data0_i <= ones;
        end if;
        
    end process p_mux_dec;
    
    
    p_mux : process(s_cnt, dp_i)
    begin
        case s_cnt is
            when "11" =>
                s_hex <= s_data3_i;
                dp_o  <= dp_i(3);
                dig_o <= "0111";

            when "10" =>
                s_hex <= s_data2_i;
                dp_o  <= dp_i(2);
                dig_o <= "1011";

            when "01" =>
                s_hex <= s_data1_i;
                dp_o  <= dp_i(1);
                dig_o <= "1101";

            when others =>
                s_hex <= s_data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
        end case;
    end process p_mux;

end architecture Behavioral;
