# 🚦 Traffic Signal Controller using FSM – Verilog RTL

A **Finite State Machine (FSM)** based **Traffic Signal Controller** designed using **Verilog RTL** to simulate intelligent traffic management at a two-road intersection: **Main Highway** and **Country Road**. This project is implemented, tested, and verified on **EDA Playground**.

---

## 📘 Specifications

- The **Main Highway** gets priority and stays green by default.
- A **sensor input X** detects if a vehicle is waiting on the **Country Road**.
  - `X = 1`: Vehicle waiting
  - `X = 0`: No vehicle
- When a vehicle is detected (`X = 1`), the signal transitions to allow the Country Road to turn green after a controlled delay.
- After allowing the Country Road to pass, the system returns to giving green to the Main Highway.
- The transition between states simulates yellow lights and delay using intermediate FSM states.
- The system is designed using **Moore FSM** and tested on **EDA Playground** using Verilog HDL.

---

## 🧠 Signal Light Encoding

| Signal   | Encoding (2-bit) |
|----------|------------------|
| Red      | `00`             |
| Yellow   | `01`             |
| Green    | `10`             |

---

## 🔁 FSM State Table with Output Encodings

| Binary | State | Highway Signal | Country Signal | Output Encoded (Hwy, Cntry) |
|--------|-------|----------------|----------------|------------------------------|
| `000`  | S0    | Green (10)     | Red (00)       | `10 00`                      |
| `001`  | S1    | Yellow (01)    | Red (00)       | `01 00`                      |
| `010`  | S2    | Red (00)       | Green (10)     | `00 10`                      |
| `011`  | S3    | Red (00)       | Yellow (01)    | `00 01`                      |
| `100`  | S4    | Red (00)       | Red (00)       | `00 00`                      |

📝 These state encodings match your handwritten design and help map FSM states to hardware outputs clearly.

---

## 🔄 FSM State Transitions

| Current State | Input X | Next State |
|---------------|---------|------------|
| S0            | 0       | S0         |
| S0            | 1       | S1         |
| S1            | -       | S2         |
| S2            | -       | S3         |
| S3            | -       | S4         |
| S4            | -       | S0         |

---

## 📈 FSM State Diagram

![FSM Diagram](./Screenshot%202025-07-20%20212115.png)

This diagram illustrates the transition flow between FSM states based on the presence (`X=1`) or absence (`X=0`) of a vehicle on the Country Road.

---

## 🛠️ Tools Used

- **EDA Playground** – Online Verilog Simulator
- **Verilog HDL (RTL)** – FSM logic implementation
- **GTKWave** – For waveform output (optional)

---

## 🧪 Simulation Overview

The FSM Verilog code was simulated on **EDA Playground** using a custom testbench. All state transitions and output signal conditions were verified using standard test vectors with sensor input `X`.

---

## 🚀 Future Improvements

- Add pedestrian crossing logic
- Extend to a 4-way intersection
- Implement real sensor interfacing on FPGA boards

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
