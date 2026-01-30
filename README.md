# EHB205 - Logic Design HW3: VHDL Adders

This project contains the VHDL implementations for **Homework 3 (Part 2)** of the EHB205 Introduction to Logic Design course. The designs focus on binary adders using **Dataflow** and **Structural** modeling in OneWare Studio.

## 📂 Project Structure

### 1. Half Adder (HA)
* **File:** `HalfAdder.vhd`
* **Testbench:** `tb_HalfAdder.vhd`
* **Description:** Adds two 1-bit inputs (`a`, `b`).
* **Modeling Style:** Dataflow (using XOR and AND gates).

### 2. Full Adder (FA)
* **File:** `FullAdder.vhd`
* **Testbench:** `tb_FullAdder.vhd`
* **Description:** Adds three 1-bit inputs (`a`, `b`, and `carry_in`).
* **Modeling Style:** Dataflow.

### 3. 4-Bit Ripple Carry Adder (RCA)
* **File:** `RippleCarryAdder.vhd`
* **Testbench:** `tb_RippleCarryAdder.vhd`
* **Description:** Adds two 4-bit integers (`A`, `B`) to produce a 5-bit output.
* **Design:** Uses **Structural modeling** to connect **1 Half Adder** (for the LSB) and **3 Full Adders** in a carry-chain configuration.

## 🚀 How to Run
1.  Open **OneWare Studio**.
2.  Import the design (`.vhd`) and testbench (`tb_*.vhd`) files.
3.  Select the testbench file and click **Run Simulation**.
4.  View the **Waveform** to verify the logic.

## 🛠 Tools Used
* **Language:** VHDL (IEEE Standard)
* **IDE:** OneWare Studio
