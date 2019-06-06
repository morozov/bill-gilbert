boot.tap: boot.bas
	bas2tap -sboot -a10 boot.bas boot.tap

boot.bas: src/boot.bas boot.bin logo.bin
# Replace the placeholder with the machine codes with bytes represented as {XX}
	sed "s/__CODE__/$(shell hexdump -ve '1/1 "{%02x}"' boot.bin logo.bin)/" src/boot.bas > boot.bas

boot.bin: src/boot.asm
	pasmo --bin src/boot.asm boot.bin

logo.bin: src/logo.asm
	pasmo --bin src/logo.asm logo.bin

clean:
	rm -f \
        *.bas \
		*.bin \
		*.tap
