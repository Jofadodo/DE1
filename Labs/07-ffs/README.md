# Digital electronics 1 - 07 flip flops

## Latches and Flip-flops

**Truth table**  
*D-latch*
| **D** | **Qn** | **Q(n+1)** | **Comments** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | Rising edge |
| 0 | 1 | 0 | Rising edge |
| 1 | 0 | 1 | Rising edge |
| 1 | 1 | 1 | Rising edge |  

*JK-latch*
| **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
| :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 0 | No change |
| 0 | 0 | 1 | 1 | No change |
| 0 | 1 | 0 | 0 | Reset |
| 0 | 1 | 1 | 0 | Reset |
| 1 | 0 | 0 | 1 | Set |
| 1 | 0 | 1 | 1 | Set |
| 1 | 1 | 0 | 1 | Invertor |
| 1 | 1 | 1 | 0 | Invertor | 

*T-latch*
| **T** | **Qn** | **Q(n+1)** | **Comments** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | Memory |
| 0 | 1 | 1 | Memory |
| 1 | 0 | 1 | Invertor |
| 1 | 1 | 0 | Invertor |

<hr>

**Source code of process `p_d_latch`**
```vhdl
p_d_latch : process (en, arst, d)
    begin
    
        if (arst = '1') then
            q <= '0';
            q_bar <= '1';
            
        elsif (en = '1') then
            q <= d;
            q_bar <= not(d);
            
        end if;
        
    end process p_d_latch;
```

**Source code of reset process**
```vhdl
p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 40 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 150 ns;

        s_arst <= '0';
        wait;
    end process p_reset_gen;
```

**Source code of stimulus process**
```vhdl
p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_d <= '0';
        s_en <= '0';
        
        assert (s_q = '0')
        report "s_q = 0" severity error;
        
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
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        
        s_en <= '1';
        
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
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 100 ns;
        s_d <= '1';
        
        s_en <= '0';
        
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
```

**Simulated waveforms of d_latch**  
![waveform](images/dlatch.jpg)

<hr>

**Source code of reset process**
```vhdl
p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 40 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 150 ns;

        s_arst <= '0';
        wait;
    end process p_reset_gen;
```