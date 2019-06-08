# Cracked by Bill Gilbert ©1988

Every person on Earth who owned a ZX Spectrum back in 1990's must have seen this logo.

<p align="center">
    <img src="https://raw.githubusercontent.com/morozov/bill-gilbert/master/screen.png" width="640" height="480" alt="Cracked by Bill Gilbert">
</p>

At those times, I was curious how exactly this logo was implemented but I didn't have neither skills nor tools to figure that out. Luckily, the machine code of the release of [MASK III: VENOM Strikes Back](https://vk.com/wall-140772215_3135) by Bill Gilbert wasn't obfuscated, so I was able to disassemble and document it. Additionally, I optimized the size of the program a little bit.

## Build dependencies

1. [Pasmo](http://pasmo.speccy.org/), a portable Z80 cross assembler.
2. [bas2tap](https://github.com/speccyorg/bas2tap), a utility for compiling BASIC.

## Usage

1. Run `make`.
3. Use the resulting `boot.tap` in your favorite emulator.
