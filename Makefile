# Straight forward Makefile to compile all examples in a row

# If cross-compiling, you may wish to set the following environment variable 
# to the root location of your 'sdk'
# SDKSTAGE=/home/foo/raspberrypi

#if CPU architecture = RaspberryPi 1/Zero
ifeq ($(shell uname -m),armv6l)

CFLAGS+=-Os -mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -mtune=arm1176jzf-s 

CFLAGSDBG=-w

#if CPU architecture = Rasp 2/3 Family
else ifeq ($(shell uname -m),armv7l)
	#if CPU = Raspberry 3
	ifeq ($(shell lscpu | grep Model: | cut -c24),4)
		CFLAGS+=-Os -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53 

		CFLAGSDBG=-w

	#this is for Raspberry 2
	else
		CFLAGS+=-Os -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mtune=cortex-a7 
		CFLAGSDBG=-w
	endif

#if else (this is for any PC)
else

CFLAGS+=-O2 -march=native -mtune=native 

CFLAGSDBG= 

endif

CH01SRC01=./src/ch01/01_hello_world/hello_world.c
CH01DST01=./bin/CH01_01_Hello_World
CH01DST01DBG=./bin/CH01_01_Hello_World_dbg

default: debug

all: release

release: ./ch01/01_hello_world/hello_world 

debug: ./ch01/01_hello_world/hello_world_dbg 

clean:
	find . -name "CH??_*" | xargs rm -f 

./ch01/01_hello_world/hello_world: ${CH01SRC01}
	gcc -s $(CFLAGS) ${CH01SRC01} -o ${CH01DST01} 

./ch01/01_hello_world/hello_world_dbg: ${CH01SRC01}
	tcc -g ${CH01SRC01} -o ${CH01DST01DBG} ${CFLAGSDBG} 

