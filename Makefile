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

#Data for CH01_01 example
CH01SRC01=./src/ch01/01_hello_world/hello_world.c
CH01DST01=./bin/CH01_01_Hello_World
CH01DST01DBG=./bin/CH01_01_Hello_World_dbg

#data for CH01_02 example
CH01SRC02=./src/ch01/02_cats/cats.c
CH01DST02=./bin/CH01_02_Cats
CH01DST02DBG=./bin/CH01_02_Cats_dbg

#data for CH01_02 example
CH02SRC01=./src/ch02/01_simple_computer/simple_computer.c
CH02DST01=./bin/CH02_01_Simple_Computer
CH02DST01DBG=./bin/CH02_01_Simple_Computer_dbg


default: debug

all: release

release: ./ch01/01_hello_world/hello_world \
		./ch01/02_cats/cats \
		./ch02/01_simple_computer/simple_computer


debug: ./ch01/01_hello_world/hello_world_dbg \
		./ch01/02_cats/cats_dbg \
		./ch02/01_simple_computer/simple_computer_dbg


clean:
	find . -name "CH??_*" | xargs rm -f 

./ch01/01_hello_world/hello_world: ${CH01SRC01}
	gcc -s $(CFLAGS) ${CH01SRC01} -o ${CH01DST01} 

./ch01/01_hello_world/hello_world_dbg: ${CH01SRC01}
	tcc -g ${CH01SRC01} -o ${CH01DST01DBG} ${CFLAGSDBG} 

./ch01/02_cats/cats: ${CH01SRC02}
	gcc -s $(CFLAGS) ${CH01SRC02} -o ${CH01DST02} 

./ch01/02_cats/cats_dbg: ${CH01SRC02}
	tcc -g ${CH01SRC02} -o ${CH01DST02DBG} ${CFLAGSDBG} 

./ch01/01_simple_computer/simple_computer: ${CH02SRC01}
	gcc -s $(CFLAGS) ${CH02SRC01} -o ${CH02DST01} 

./ch01/01_simple_computer/simple_computer_dbg: ${CH02SRC01}
	tcc -g ${CH02SRC01} -o ${CH02DST01DBG} ${CFLAGSDBG} 

