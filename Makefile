SRC += main.c
INC += include
#DEBUG := -g

CC := riscv64-elf-gcc -march=rv32imc -mabi=ilp32
EMU := temu 
EMU_FLAGS := -m 1 -ctrlc

CFLAGS := $(DEBUG) -I$(INC) --std=c99 -Wall -Os 
LDFLAGS := #-nostdlib -nostartfiles

.PHONY: clean run

SRC_OBJ := $(SRC:.c=.o)

.c.o: 
	$(CC) -c $(CFLAGS) $< -o $@

test: $(SRC_OBJ) Makefile
	$(CC) $(CFLAGS) $(SRC_OBJ) $(LDFLAGS) -o test

all: test Makefile

run: test
	$(EMU) $(EMU_FLAGS) test.cfg 

clean: 
	rm -f $(SRC_OBJ) test 
