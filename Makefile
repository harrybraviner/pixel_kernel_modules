ifneq ($(KERNELRELEASE),)
obj-m := chromeos_laptop.o atmel_mxt_ts.o
else
KDIR ?= /lib/modules/`uname -r`/build

all: chromeos_laptop atmel_mxt_ts

chromeos_laptop: chromeos_laptop.c
	$(MAKE) -C $(KDIR) M=$$PWD

atmel_mxt_ts: atmel_mxt_ts.c
	$(MAKE) -C $(KDIR) M=$$PWD

clean:
	rm -f chromeos_laptop *.o *.ko modules.order Module.symvers *.mod.c
endif
