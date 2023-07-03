# CROSS_COMPILE can be defined as aarch64-none-linux-gnu- for cross compilation. Leave empty for native compilation

CC=$(CROSS_COMPILE)gcc
CFLAGS=-Wall \
		-Werror \
		-g
TARGET=writer

all : $(TARGET)

.PHONY: default
default : all

$(TARGET) : $(TARGET).c
	$(CC) $^ $(CFLAGS) -o $@ 

.PHONY: clean
clean : 
	rm -f $(TARGET).o $(TARGET)