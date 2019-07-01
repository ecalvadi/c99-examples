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

#data for CH02_01 example
CH02SRC01=./src/ch02/01_simple_computer/simple_computer.c
CH02DST01=./bin/CH02_01_Simple_Computer
CH02DST01DBG=./bin/CH02_01_Simple_Computer_dbg

#data for CH02_02 example
CH02SRC02=./src/ch02/02_fathoms_to_feet/fathoms_to_feet.c
CH02DST02=./bin/CH02_02_Fathoms_to_feet
CH02DST02DBG=./bin/CH02_02_Fathoms_to_feet_dbg

#data for CH02_03 example
CH02SRC03=./src/ch02/03_two_func/two_func.c
CH02DST03=./bin/CH02_03_Two_Func
CH02DST03DBG=./bin/CH02_03_Two_Func_dbg

#data for CH02_04 example
CH02SRC04=./src/ch02/04_squared_cube/squared_cube.c
CH02DST04=./bin/CH02_04_Squared_Cube
CH02DST04DBG=./bin/CH02_04_Squared_Cube_dbg

#data for CH03_01 example
CH03SRC01=./src/ch03/01_platinium/platinium.c
CH03DST01=./bin/CH03_01_Platinium
CH03DST01DBG=./bin/CH03_01_Platinium_dbg

#data for CH03_02 example
CH03SRC02=./src/ch03/02_print1/print1.c
CH03DST02=./bin/CH03_02_Print1
CH03DST02DBG=./bin/CH03_02_Print1_dbg

#data for CH03_03 example
CH03SRC03=./src/ch03/03_bases/bases.c
CH03DST03=./bin/CH03_03_Bases
CH03DST03DBG=./bin/CH03_03_Bases_dbg

#data for CH03_04 example
CH03SRC04=./src/ch03/04_toobig/toobig.c
CH03DST04=./bin/CH03_04_Toobig
CH03DST04DBG=./bin/CH03_04_Toobig_dbg

#data for CH03_05 example
CH03SRC05=./src/ch03/05_integers/integers.c
CH03DST05=./bin/CH03_05_Integers
CH03DST05DBG=./bin/CH03_05_Integers_dbg

#data for CH03_06 example
CH03SRC06=./src/ch03/06_charcode/charcode.c
CH03DST06=./bin/CH03_06_Charcode
CH03DST06DBG=./bin/CH03_06_Charcode_dbg

#data for CH03_07 example
CH03SRC07=./src/ch03/07_altnames/altnames.c
CH03DST07=./bin/CH03_07_Altnames
CH03DST07DBG=./bin/CH03_07_Altnames_dbg

#data for CH03_08 example
CH03SRC08=./src/ch03/08_showfloat/showfloat.c
CH03DST08=./bin/CH03_08_Showfloat
CH03DST08DBG=./bin/CH03_08_Showfloat_dbg


default: debug

all: release

release: ./ch01/01_hello_world/hello_world \
		./ch01/02_cats/cats \
		./ch02/01_simple_computer/simple_computer \
		./ch02/02_fathoms_to_feet/fathoms_to_feet \
		./ch02/03_two_func/two_func \
		./ch02/04_squared_cube/squared_cube \
		./ch03/01_platinium/platinium \
		./ch03/02_print1/print1 \
		./ch03/03_bases/bases \
		./ch03/04_toobig/toobig \
		./ch03/05_integers/integers \
		./ch03/06_charcode/charcode \
		./ch03/07_altnames/altnames \
		./ch03/08_showfloat/showfloat

debug: ./ch01/01_hello_world/hello_world_dbg \
		./ch01/02_cats/cats_dbg \
		./ch02/01_simple_computer/simple_computer_dbg \
		./ch02/02_fathoms_to_feet/fathoms_to_feet_dbg \
		./ch02/03_two_func/two_func_dbg \
		./ch02/04_squared_cube/squared_cube_dbg \
		./ch03/01_platinium/platinium_dbg \
		./ch03/02_print1/print1_dbg \
		./ch03/03_bases/bases_dbg \
		./ch03/04_toobig/toobig_dbg \
		./ch03/05_integers/integers_dbg \
		./ch03/06_charcode/charcode_dbg \
		./ch03/07_altnames/altnames_dbg \
		./ch03/08_showfloat/showfloat_dbg

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

./ch02/01_simple_computer/simple_computer: ${CH02SRC01}
	gcc -s $(CFLAGS) ${CH02SRC01} -o ${CH02DST01} 

./ch02/01_simple_computer/simple_computer_dbg: ${CH02SRC01}
	tcc -g ${CH02SRC01} -o ${CH02DST01DBG} ${CFLAGSDBG} 

./ch02/02_fathoms_to_feet/fathoms_to_feet: ${CH02SRC02}
	gcc -s $(CFLAGS) ${CH02SRC02} -o ${CH02DST02} 

./ch02/02_fathoms_to_feet/fathoms_to_feet_dbg: ${CH02SRC02}
	tcc -g ${CH02SRC02} -o ${CH02DST02DBG} ${CFLAGSDBG} 

./ch02/03_two_func/two_func: ${CH02SRC03}
	gcc -s $(CFLAGS) ${CH02SRC03} -o ${CH02DST03} 

./ch02/03_two_func/two_func_dbg: ${CH02SRC03}
	tcc -g ${CH02SRC03} -o ${CH02DST03DBG} ${CFLAGSDBG} 

./ch02/04_squared_cube/squared_cube: ${CH02SRC04}
	gcc -s $(CFLAGS) ${CH02SRC04} -o ${CH02DST04} 

./ch02/04_squared_cube/squared_cube_dbg: ${CH02SRC04}
	tcc -g ${CH02SRC04} -o ${CH02DST04DBG} ${CFLAGSDBG} 

./ch03/01_platinium/platinium: ${CH03SRC01}
	gcc -s $(CFLAGS) ${CH03SRC01} -o ${CH03DST01} 

./ch03/01_platinium/platinium_dbg: ${CH03SRC01}
	tcc -g ${CH03SRC01} -o ${CH03DST01DBG} ${CFLAGSDBG} 

./ch03/02_print1/print1: ${CH03SRC02}
	gcc -s $(CFLAGS) ${CH03SRC02} -o ${CH03DST02} 

./ch03/02_print1/print1_dbg: ${CH03SRC02}
	tcc -g ${CH03SRC02} -o ${CH03DST02DBG} ${CFLAGSDBG} 

./ch03/03_bases/bases: ${CH03SRC03}
	gcc -s $(CFLAGS) ${CH03SRC03} -o ${CH03DST03} 

./ch03/03_bases/bases_dbg: ${CH03SRC03}
	tcc -g ${CH03SRC03} -o ${CH03DST03DBG} ${CFLAGSDBG} 

./ch03/04_toobig/toobig: ${CH03SRC04}
	gcc -s $(CFLAGS) ${CH03SRC04} -o ${CH03DST04} 

./ch03/04_toobig/toobig_dbg: ${CH03SRC04}
	tcc -g ${CH03SRC04} -o ${CH03DST04DBG} ${CFLAGSDBG} 

./ch03/05_integers/integers: ${CH03SRC05}
	gcc -s $(CFLAGS) ${CH03SRC05} -o ${CH03DST05} 

./ch03/05_integers/integers_dbg: ${CH03SRC05}
	tcc -g ${CH03SRC05} -o ${CH03DST05DBG} ${CFLAGSDBG} 

./ch03/06_charcode/charcode: ${CH03SRC06}
	gcc -s $(CFLAGS) ${CH03SRC06} -o ${CH03DST06} 

./ch03/06_charcode/charcode_dbg: ${CH03SRC06}
	tcc -g ${CH03SRC06} -o ${CH03DST06DBG} ${CFLAGSDBG} 

./ch03/07_altnames/altnames: ${CH03SRC07}
	gcc -s $(CFLAGS) ${CH03SRC07} -o ${CH03DST07} 

./ch03/07_altnames/altnames_dbg: ${CH03SRC07}
	tcc -g ${CH03SRC07} -o ${CH03DST07DBG} ${CFLAGSDBG} 

./ch03/08_showfloat/showfloat: ${CH03SRC08}
	gcc -s $(CFLAGS) ${CH03SRC08} -o ${CH03DST08} 

./ch03/08_showfloat/showfloat_dbg: ${CH03SRC08}
	tcc -g ${CH03SRC08} -o ${CH03DST08DBG} ${CFLAGSDBG} 


