# Noktra

**Noktra** is an experimental embedded robotics framework with a custom compiler and virtual machine for writing programmable, script-driven behavior for physical robots. Designed for real-world learning, it emphasizes secure communication, modular hardware integration, and low-level firmware development.

## Features

- Modular firmware with support for UART, SPI, I2C, and GPIO
- Wired and wireless telemetry system with encryption support
- Sensor and motor integration for real-time control and feedback
- A custom stack-based VM for executing bytecode programs
- A Rust-based compiler for the Noktra DSL

## Getting Started

To get started, see the [Getting Started Guide (TODO)](docs/getting_started.md).

If you want to dive into the architecture and design, see the [Design Document](docs/design_doc.md).

## Repository Structure

```
/firmware/ - C code for embedded drivers and runtime
/compiler/ - Rust-based compiler for the Noktra DSL
/cli/ - Rust CLI for uploading code, reading telemetry
/docs/ - Design documents, usage guides, architecture notes
```

## Roadmap

See the [project roadmap (TODO)](docs/design_doc.md#roadmap) for planned features and milestones.

## License

MIT License
