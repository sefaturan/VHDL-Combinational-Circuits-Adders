library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Full Adder Entity
entity FullAdder is
    Port ( a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : in  STD_LOGIC; -- Carry In
        d : out STD_LOGIC_VECTOR (1 downto 0)); -- d(0) Sum, d(1) Carry Out
end FullAdder;

-- Dataflow Modeling
architecture Dataflow of FullAdder is
begin
    -- d(0) toplam biti (Sum) = a XOR b XOR c
    d(0) <= a xor b xor c;
    
    -- d(1) elde biti (Carry Out) = (a AND b) OR (c AND (a XOR b))
    d(1) <= (a and b) or (c and (a xor b));
end Dataflow;