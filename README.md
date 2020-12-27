# TinyEMU-tests
Tests for emulating risc-v 32 code using TinyEMU

# Risc-V Notes
ESP32-C3 supports base RV32I instructions plus the M and C extensions.  The M extension adds 
support for hardware multiplication and division, the C extension adds support for compressed 
instructions (16-bit instructions).

Instruction with all zeros is illegal, as is an istruction with all ones.

Instructions are always stored little endian (least-significant-byte first in memory)

32 'X' registers (32-bits each)
x0    - hardwired to zero
x1-31 - general purpose registers


# Compiler notes
I had to add the options -nostartfiles and -nnostdlib to the linker in order to prevent the 
addition of `_start()` etc into the binary
