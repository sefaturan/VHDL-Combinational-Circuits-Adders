library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Half Adder Entity
entity HalfAdder is
    Port ( a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : out STD_LOGIC_VECTOR (1 downto 0)); -- c(0) Sum, c(1) Carry
end HalfAdder;

-- Dataflow Modeling
architecture Dataflow of HalfAdder is
begin
    -- c(0) toplam biti (Sum)
    c(0) <= a xor b;
    
    -- c(1) elde biti (Carry)
    c(1) <= a and b;
end Dataflow;