# Noktra Design Document

**Author**: Travis Bubb  
**License**: MIT  
**Last Updated**: June 16, 2025  

---

## Overview

**Noktra** is a modular robotics and compiler project that aims to deliver a programmable embedded system with a custom DSL, focusing on practical embedded systems development. The goal is to build this project incrementally, using each milestone to gain real-world experience in low-level hardware interaction, communication protocols, security, and compiler design.

This document outlines the full project lifecycle, from bare-metal firmware and sensor integration to secure telemetry, wireless control, and a fully custom virtual machine powered by user-written scripts.

## Goals

- Gain hands-on embedded experience by writing low-level drivers using UART, I2C, SPI, PWM, and GPIO.
- Build a wired and wireless telemetry system between the robot and a host PC, starting simple and adding security over time.
- Integrate motors and sensors to create an autonomous-capable robot.
- Design and implement a domain-specific scripting language, compiler, and runtime for robotic task automation.

## Phase 1: Embedded Fundamentals and Wired Telemetry

### Objectives

- Establish basic communication between the MCU and the host machine via UART.
- Write drivers in C for reading from sensors (e.g. temperature, ultrasonic, IMU) using I2C and SPI.
- Implement GPIO-based components (LEDs, buttons, etc.) for feedback and control.
- Build a simple C-based runtime to read sensor values and transmit structured data over UART.
- Develop a command-line telemetry viewer in Rust to receive and display real-time data.

### Deliverables

- C firmware that interfaces with at least 3 types of sensors via different protocols.
- Basic CLI tool for telemetry over USB/serial.
- Structured telemetry packet format.
- Logging interface on the MCU for debugging.

## Phase 2: Wireless Communication

### Objectives

- Transition from wired UART communication to wireless protocols (e.g. Wi-Fi or BLE).
- Implement wireless telemetry with reconnect, error handling, and basic reliability features.
- Establish a simple custom protocol or leverage existing ones (e.g. MQTT-lite).
- Build a wireless telemetry viewer and logger on the host side.

### Deliverables

- Wireless transport layer in the firmware.
- Host-side telemetry CLI with live wireless updates.
- Tools to switch between wired and wireless modes.
- Robust reconnection and basic fault-tolerance features.

## Phase 3: Secure Communication Layer

### Objectives

- Introduce encryption and data integrity checks (e.g. AES + HMAC or CRC).
- Design a handshake mechanism for identity verification and key exchange.
- Harden telemetry protocol against tampering and replay attacks.
- Provide debugging tools for packet inspection and security testing.

### Deliverables

- Encrypted transport with configurable keys and protocols.
- Secure telemetry CLI with decrypted output and structured views.
- Configuration utilities for identity, keys, and protocol settings.
- Updated firmware supporting secure mode toggle and fallback.

## Phase 4: Motor Control and Autonomous Behavior

### Objectives

- Implement drivers for DC motors or stepper motors with PWM control.
- Add a motor controller interface to the runtime.
- Integrate proximity and IMU sensors for basic obstacle detection.
- Implement control logic for autonomous movement routines.

### Deliverables

- C firmware capable of responding to sensor input and actuating motors.
- Realtime control interface over telemetry CLI.
- Motion test scripts and obstacle avoidance logic.
- Runtime hooks for movement commands and sensor events.

## Phase 5: Custom Compiler and Virtual Machine

### Objectives

- Design a stack-based bytecode format for controlling the robot.
- Implement a custom virtual machine in C that executes this bytecode.
- Build a Rust-based compiler for a simple DSL that compiles into the VM bytecode.
- Add support for loops, conditionals, function calls, and hardware access bindings.
- Connect DSL functions to firmware hooks for movement and sensing.

### Deliverables

- DSL grammar and compiler implemented in Rust.
- Bytecode VM implemented in embedded C.
- Runtime firmware that connects bytecode operations to physical actions.
- CLI interface for compiling, uploading, and running DSL programs on the robot.

## Future Directions

- OTA firmware updates and remote diagnostics.
- Web-based control panel for robot.

## Contributions

All contributions are welcome, especially those in the following areas:

- Embedded driver development for additional hardware platforms.
- Improvements to the CLI and telemetry tooling.
- DSL feature proposals, grammar improvements, and optimizations.
- Compiler enhancements.
- Documentation, examples, and test programs for new features.

If you're interested in contributing, please open an issue or reach out via GitHub Discussions.

## License

This project will be licensed under the MIT License unless otherwise noted.

