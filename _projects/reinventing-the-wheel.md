---
layout: page
title: Reinventing the Wheel
permalink: /projects/reinventing-the-wheel/
description: A hardware simulation platform for computer architecture research, making processor, memory, and I/O behavior observable from gates to program execution.
img: assets/img/reinventing-the-wheel.svg
importance: 1
category: systems
github: https://github.com/arnold518/reinventing-the-wheel
---

[Source code](https://github.com/arnold518/reinventing-the-wheel) · [Documentation](https://arnold518.github.io/reinventing-the-wheel/) · [Open the simulator](https://arnold518.github.io/reinventing-the-wheel/simulator/)

## Make program execution observable

**CircuitSim** is the main implementation of Reinventing the Wheel: a hardware simulation platform that makes the internal behavior of CPUs, memory systems, and I/O devices observable, from individual logic gates to complete systems executing programs.

An instruction moving through a pipeline, a stalled memory request, and a program writing a displayed frame can be followed through the components and signals that produce them. The goal is to connect this visibility with a platform for computer architecture research: configurable systems, explicit timing models, and repeatable experiments.

## What the project covers

| Area                       | Implemented capabilities                                                                                                                                                                          |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Arithmetic and logic       | Configurable 8-, 16-, and 32-bit ALUs, ripple and parallel-prefix adders, shifts, comparisons, and registers.                                                                                     |
| Memory technologies        | Flip-flop, SRAM, DRAM, ROM, and NOR-flash models, with storage structures, controllers, transaction protocols, and technology-specific timing.                                                    |
| Memory hierarchies         | Separate and shared instruction/data memory arrangements, L1/L2 caches, configurable associativity and replacement, write buffers, and write-through/write-back policies.                         |
| RISC-V processors          | A single-cycle RV32I core, a baseline five-stage pipeline, an advanced pipeline with forwarding, hazard handling, and branch prediction, and an RV32IM pipeline with multiplication and division. |
| Device I/O                 | Memory-mapped routing, framebuffer storage, button/input queues, timers, and console output, with configurable display geometry and queue sizes.                                                  |
| Programs and visualization | Compiled C guest programs, scripted game workloads, circuit inspection, and recorded display/input views through native and WebAssembly execution.                                                |

## Timing is part of the model

The C++20 engine schedules wire updates and component evaluations in simulation time. Signals carry four-state values: 0, 1, unknown, and high impedance. Gate propagation and memory/device timing determine when outputs change and when a processor can safely capture them.

Graph-based analysis of the assembled circuit computes settling bounds and safe clock periods, accounting for setup, hold, and pulse-width constraints. These are conservative bounds under the selected timing contracts. Configurable timing profiles supply gate delays and memory intervals, so experiments can compare simulated cycles and modeled execution time under explicit assumptions.

## Choose the level of detail

Components can provide two simulation fidelities:

- **Structural models** expose the smaller components and wires that implement a circuit.
- **Behavioral models** evaluate a component more compactly while retaining its external interface and timing contract.

A build profile selects the implementation for each component, allowing detailed circuits and compact models to coexist in one system. Structural implementations establish the design; compact forms make larger experiments practical.

Delay tables derived from gate-level circuits carry input-to-output timing into the compact models. This connects simulation speed to the underlying hardware model. Component equivalence checks and independent instruction/device reference models support comparisons across implementations.

## From compiled C to device activity

The RV32IM device platform executes compiled C programs on the simulated processor. Display writes, button events, timer reads, and console output travel through the simulated memory-mapped devices. The game logic runs on that processor, and the viewer presents the resulting hardware and device state.

The current game programs include **2048, Sokoban, Snake, Pong, and Tetris**, with deterministic input fixtures and recorded output. A Pong rally can be replayed in the circuit visualizer alongside its display/input state and retained pin/wire values. The current game workflow uses scripted execution and recorded playback; live input sessions are a planned next stage.

## A platform for architecture experiments

The configurable hardware and timing models support controlled questions such as:

- How do forwarding, pipeline stalls, and branch prediction change execution behavior?
- How do cache organization, replacement policy, and buffered or write-back stores affect a program?
- How do memory technology and access patterns change latency and modeled execution time?

The same workload can be compared across processor designs, memory arrangements, and component fidelities. Results remain tied to the program, configuration, timing profile, and reference checks used for that experiment.

## Current work and future directions

_Development snapshot: October 2026._

Recent work generalized component widths and configuration, added the RV32IM device platform, and connected recorded game activity to the circuit visualizer. Current work continues on component interfaces and broader integrated game validation, including native/WebAssembly comparisons and performance measurements.

The next device milestone is persistent interactive sessions with live input, bounded execution, pause/reset, and replay. Longer-term directions include **AI accelerators** and **general-purpose GPUs**, extending the same emphasis on visible computation, memory movement, and timing. AI accelerator work follows the game milestone; the GPU direction remains a longer-term goal. Multicore systems and persistent storage are additional exploratory extensions.
