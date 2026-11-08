# Mecool KM5 (Mecool HM8 clone, S905X, raw NAND, 1 GiB DDR3 single rank)
#
# bl2.sign, bl30.enc and bl31.enc are the box's own blobs, extracted with
# "gxlimg -e" from the vendor bootloader in NAND (BL2 built Dec 21 2016).
# The BL2 carries the box's DDR settings (720 MHz); the p212 BL2 runs this
# RAM at 912 MHz and fails its address bus test. bl30.enc includes BL301.
# They are used as they are: only BL33 (mainline U-Boot) is encrypted here.

O ?= .
TMP ?= .
BL33 ?=

UNAME_M := $(shell uname -m)
ifneq ($(UNAME_M),x86_64)
	QEMU = qemu-x86_64 -L /usr/x86_64-linux-gnu/
endif

.PHONY: all clean distclean
all: ${O}/u-boot.bin

clean:
	rm -f ${TMP}/bl33.bin.enc

distclean: clean
	rm -f ${O}/u-boot.bin ${O}/u-boot.bin.sd.bin ${O}/u-boot.bin.usb.bl2 ${O}/u-boot.bin.usb.tpl

${TMP}/bl33.bin.enc: ${BL33}
	${QEMU} ./aml_encrypt_gxl --bl3enc --input ${BL33} --output ${TMP}/bl33.bin.enc

# also writes u-boot.bin.sd.bin (512 bytes of padding + u-boot.bin) and the
# u-boot.bin.usb.bl2/.tpl pair next to u-boot.bin
${O}/u-boot.bin: bl2.sign bl30.enc bl31.enc ${TMP}/bl33.bin.enc
	${QEMU} ./aml_encrypt_gxl --bootmk --output ${O}/u-boot.bin \
		--bl2 bl2.sign --bl30 bl30.enc \
		--bl31 bl31.enc --bl33 ${TMP}/bl33.bin.enc
