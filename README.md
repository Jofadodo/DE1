# Digital electronics 1

## Labs
**Autor:**  
*Jozef Fašanga*  
*220812*

[DE1 GitHub repository](https://github.com/tomas-fryza/Digital-electronics-1)


**Table**
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 |  |
| 0 | 0 | 1 |  |
| 0 | 1 | 0 |  |
| 0 | 1 | 1 |  |
| 1 | 0 | 0 |  |
| 1 | 0 | 1 |  |
| 1 | 1 | 0 |  |
| 1 | 1 | 1 |  |


**Lists**
- firs line
- second line
- last line of unordered list

1. firs line
2. second line
3. last line of ordered list

**Source code**
```vhdl

------------------------------------------------------------------------
--
-- Testbench for basic gates circuit.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_gates is
    -- Entity of testbench is always empty
end entity tb_gates;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_gates is

    -- Local signals
    signal s_a   		  : std_logic;
    signal s_b   		  : std_logic;
    signal s_c            : std_logic;
    
    signal s_f_oroginal   : std_logic;
    
    signal s_f_by_nand    : std_logic;
    signal s_f_by_nor     : std_logic;
    
    signal s_f_dist_1a	  : std_logic;
    signal s_f_dist_1b	  : std_logic;
    signal s_f_dist_2a	  : std_logic;
    signal s_f_dist_2b	  : std_logic;
    
begin
    -- Connecting testbench signals with gates entity (Unit Under Test)
    uut_gates : entity work.gates
        port map(
            a_i   		 => s_a,
            b_i   		 => s_b,
            c_i   		 => s_c,
            
            f_original   => s_f_oroginal,
            
            f_by_nand    => s_f_by_nand,
            f_by_nor     => s_f_by_nor,
            
            f_dist_1a    => s_f_dist_1a,
			f_dist_1b    => s_f_dist_1b,
			f_dist_2a    => s_f_dist_2a,
			f_dist_2b    => s_f_dist_2b
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
    	s_c <= '0';
        s_b <= '0';             
        s_a <= '0';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '0';
        s_a <= '1';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '1';
        s_a <= '0';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '1';
        s_a <= '1';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '0';             
        s_a <= '0';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '0';
        s_a <= '1';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '1';
        s_a <= '0';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '1';
        s_a <= '1';
        wait for 100 ns;
        wait;
        

    end process p_stimulus;

end architecture testbench;

```
