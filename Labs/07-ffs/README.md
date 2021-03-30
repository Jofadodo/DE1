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