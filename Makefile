bill-gilbert.trd: boot.$$B logo.$$C
	$(eval TMPFILE=$(shell tempfile))

	createtrd $(TMPFILE)
	hobeta2trd boot.\$$B $(TMPFILE)
	hobeta2trd logo.\$$C $(TMPFILE)

	mv $(TMPFILE) bill-gilbert.trd

boot.$$B: boot.000
	0tohob boot.000

boot.000: boot.tap
	tapto0 -f boot.tap

boot.tap: boot.bas
	bas2tap -sboot -a10 boot.bas boot.tap

logo.$$C: logo.000
	0tohob logo.000

logo.000: logo.bin
	binto0 logo.bin 3 50000

logo.bin: logo.asm
	pasmo --bin logo.asm logo.bin

clean:
	rm -f \
		*.\$$B \
		*.\$$C \
		*.000 \
		*.bin \
		*.tap \
		*.trd
