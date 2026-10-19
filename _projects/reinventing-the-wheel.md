---
layout: page
title: Reinventing the Wheel
permalink: /projects/reinventing-the-wheel/
description: A digital logic simulator that builds a computer from gates to RV32I processors, with interactive circuit examples and timing experiments.
img: assets/img/reinventing-the-wheel.svg
importance: 1
category: systems
github: https://github.com/arnold518/reinventing-the-wheel
---

[Source code](https://github.com/arnold518/reinventing-the-wheel) · [Documentation](https://arnold518.github.io/reinventing-the-wheel/) · [Open the simulator](https://arnold518.github.io/reinventing-the-wheel/simulator/)

## From gates to processors

**CircuitSim** explores how a computer is built from smaller components. Logic gates form arithmetic circuits, arithmetic circuits become an ALU, memory cells become complete memory devices, and these building blocks come together in RV32I processors.

The project connects executable circuit models with documentation of each component's interface, behavior, structure, and timing. Interactive examples let readers inspect and run the circuits discussed in the documentation.

## What the project covers

- **Arithmetic and logic:** an 8-bit ALU with adders, logical operations, shifts, comparisons, and flags.
- **Memory systems:** storage cells, SRAM, DRAM, ROM, and NOR flash, together with transaction protocols, controllers, and timing models.
- **RV32I processors:** a single-cycle core, a baseline five-stage pipeline, and an advanced pipeline with forwarding, load-use hazard handling, and branch prediction.
- **Experiments:** comparisons of processor designs, timing profiles, and component behavior.

Larger components have structural implementations built from smaller parts. Many also have faster behavioral forms checked against those structures. This connects the details of a circuit with experiments that would otherwise take much longer to simulate.

## Explore

Start with the [interactive simulator](https://arnold518.github.io/reinventing-the-wheel/simulator/), or browse the [source repository](https://github.com/arnold518/reinventing-the-wheel) for the simulator and its documentation.
