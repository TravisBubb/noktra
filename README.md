# Noktra: Secure Embedded Telemetry Shell

**Noktra** is an embedded telemetry shell designed for microcontrollers deployed in constrained or remote environments. Its goal is to provide secure, low-level diagnostics and control over UART, with built-in support for encrypted communication, integrity checks, and safe over-the-air (OTA) updates.

> _This project is currently in active design. Firmware development will begin once hardware is received._

---

## Project Goals

- **Secure Diagnostics**: Provide a command-line-style interface over UART with authenticated, encrypted communication.
- **Reliability**: Ensure data integrity using checksums (CRC) and fault-tolerant update mechanisms.
- **Maintainability**: Support remote OTA firmware updates with dual-bank flashing and rollback protection.
- **Minimal Footprint**: Keep the shell lightweight and efficient for memory- and compute-constrained devices.
- **Extensibility**: Design a modular packet protocol and command interface to allow future expansions or application-specific commands.

---

## Planned Features

- UART-based CLI with structured command set
- AES-encrypted payloads (AES-128/256, depending on footprint analysis)
- CRC32 for message integrity
- Handshake/authentication protocol on session start
- Dual-bank OTA update support with boot flag and rollback logic
- Configurable command whitelist and privilege levels
- Minimal logging via serial debug output

---

## Target Platform

- STM32F4 series (ARM Cortex-M4)
- Toolchain: `arm-none-eabi-gcc`
- Build system: `Make`
- Host interface: UART (with optional USB-CDC fallback)

---

## Tech Stack

- **Language**: C
- **Platform**: STM32F4
- **Build**: Make + arm-none-eabi toolchain

---

## Use Cases

- Field diagnostics and configuration for embedded devices
- Secure remote control in sensor networks or IoT gateways
- Firmware update management in physically inaccessible deployments
- Educational exploration of secure low-level systems

---

## Author

**Travis Bubb**  
[github.com/TravisBubb](https://github.com/TravisBubb)  
[linkedin.com/in/travisbubb](https://linkedin.com/in/travisbubb)
