# === Project Configuration ===
TARGET       := firmware
BUILD_DIR    := build
MCU          := cortex-m4
CHIP_DEF     := STM32F446xx
OPENOCD := openocd
OPENOCD_INTERFACE := interface/stlink.cfg
OPENOCD_TARGET := target/stm32f4x.cfg
FLASH_ADDRESS := 0x08000000

# === Paths ===
SRCDIRS      := src startup
INCDIRS      := inc \
                third_party/STM32CubeF4/Drivers/CMSIS/Core/Include \
                third_party/STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Include
LINKER_SCRIPT := linker.ld

# === Toolchain ===
CC      := arm-none-eabi-gcc
LD      := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
OBJDUMP := arm-none-eabi-objdump
SIZE    := arm-none-eabi-size

# === Flags ===
CFLAGS  := -Wall -Wextra -Werror -mcpu=$(MCU) -mthumb -std=c11 -Os -ffunction-sections -fdata-sections
CFLAGS  += $(patsubst %, -I%, $(INCDIRS)) -D$(CHIP_DEF)
LDFLAGS := -T$(LINKER_SCRIPT) -nostartfiles -Wl,--gc-sections -Wl,-Map=$(BUILD_DIR)/$(TARGET).map

# === File Lists ===
C_SOURCES := $(shell find $(SRCDIRS) -name '*.c')
ASM_SOURCES := $(shell find $(SRCDIRS) -name '*.s')
OBJECTS := $(addprefix $(BUILD_DIR)/, $(C_SOURCES:.c=.o) $(ASM_SOURCES:.s=.o))

# === Targets ===
.PHONY: all clean flash

all: $(BUILD_DIR)/$(TARGET).elf

# Flash
flash: $(BUILD_DIR)/$(TARGET).bin
	$(OPENOCD) -f $(OPENOCD_INTERFACE) -f $(OPENOCD_TARGET) -c "program $(BUILD_DIR)/$(TARGET).bin $(FLASH_ADDRESS) verify reset exit"

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O binary $< $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS)
	@mkdir -p $(dir $@)
	$(LD) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $@
	$(OBJCOPY) -O binary $@ $(BUILD_DIR)/$(TARGET).bin
	$(OBJCOPY) -O ihex   $@ $(BUILD_DIR)/$(TARGET).hex
	$(SIZE) $@

# Compile C
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile ASM
$(BUILD_DIR)/%.o: %.s
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean
clean:
	rm -rf $(BUILD_DIR)
