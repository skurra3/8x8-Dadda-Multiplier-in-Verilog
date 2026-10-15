# 8x8-Dadda-Multiplier-in-Verilog
This project presents the design and implementation of an 8x8 Dadda multiplier. The multiplier first generates 64 partial products using AND gates and then reduces them through multiple compression stages with the use of Half and Full adders. The Dadda reduction method reduces the partial product matrix while limiting the number of adders used in the design. The column heights reduce until two rows are left and then added using a ripple carry adder. The design is implemented structurally on Verilog. A testbench with several inputs was used to simulate verify the correct operation of the circuit. 


