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

#data for CH01_02 example
CH01SRC02=./src/ch01/02_cats/cats.c
CH01DST02=./bin/CH01_02_Cats

#data for CH02_01 example
CH02SRC01=./src/ch02/01_simple_computer/simple_computer.c
CH02DST01=./bin/CH02_01_Simple_Computer

#data for CH02_02 example
CH02SRC02=./src/ch02/02_fathoms_to_feet/fathoms_to_feet.c
CH02DST02=./bin/CH02_02_Fathoms_to_feet

#data for CH02_03 example
CH02SRC03=./src/ch02/03_two_func/two_func.c
CH02DST03=./bin/CH02_03_Two_Func

#data for CH02_04 example
CH02SRC04=./src/ch02/04_squared_cube/squared_cube.c
CH02DST04=./bin/CH02_04_Squared_Cube

#data for CH03_01 example
CH03SRC01=./src/ch03/01_platinium/platinium.c
CH03DST01=./bin/CH03_01_Platinium

#data for CH03_02 example
CH03SRC02=./src/ch03/02_print1/print1.c
CH03DST02=./bin/CH03_02_Print1

#data for CH03_03 example
CH03SRC03=./src/ch03/03_bases/bases.c
CH03DST03=./bin/CH03_03_Bases

#data for CH03_04 example
CH03SRC04=./src/ch03/04_toobig/toobig.c
CH03DST04=./bin/CH03_04_Toobig

#data for CH03_05 example
CH03SRC05=./src/ch03/05_integers/integers.c
CH03DST05=./bin/CH03_05_Integers

#data for CH03_06 example
CH03SRC06=./src/ch03/06_charcode/charcode.c
CH03DST06=./bin/CH03_06_Charcode

#data for CH03_07 example
CH03SRC07=./src/ch03/07_altnames/altnames.c
CH03DST07=./bin/CH03_07_Altnames

#data for CH03_08 example
CH03SRC08=./src/ch03/08_showfloat/showfloat.c
CH03DST08=./bin/CH03_08_Showfloat

#data for CH03_09 example
CH03SRC09=./src/ch03/09_floaterr/floaterr.c
CH03DST09=./bin/CH03_09_Floaterr

#data for CH03_10 example
CH03SRC10=./src/ch03/10_typesize/typesize.c
CH03DST10=./bin/CH03_10_Typesize

#data for CH03_11 example
CH03SRC11=./src/ch03/11_badcount/badcount.c
CH03DST11=./bin/CH03_11_Badcount

#data for CH03_12 example
CH03SRC12=./src/ch03/12_escape/escape.c
CH03DST12=./bin/CH03_12_Escape

#data for CH04_01 example
CH04SRC01=./src/ch04/01_talkback/talkback.c
CH04DST01=./bin/CH04_01_Talkback

#data for CH04_02 example
CH04SRC02=./src/ch04/02_praisel/praisel.c
CH04DST02=./bin/CH04_02_Praisel

#data for CH04_03 example
CH04SRC03=./src/ch04/03_praise2/praise2.c
CH04DST03=./bin/CH04_03_Praise2

#data for CH04_04 example
CH04SRC04=./src/ch04/04_pizza/pizza.c
CH04DST04=./bin/CH04_04_Pizza

#data for CH04_05 example
CH04SRC05=./src/ch04/05_defines/defines.c
CH04DST05=./bin/CH04_05_Defines

#data for CH04_06 example
CH04SRC06=./src/ch04/06_printout/printout.c
CH04DST06=./bin/CH04_06_Printout

#data for CH04_07 example
CH04SRC07=./src/ch04/07_width/width.c
CH04DST07=./bin/CH04_07_Width

#data for CH04_08 example
CH04SRC08=./src/ch04/08_floats/floats.c
CH04DST08=./bin/CH04_08_Floats

#data for CH04_09 example
CH04SRC09=./src/ch04/09_flags/flags.c
CH04DST09=./bin/CH04_09_Flags


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
		./ch03/08_showfloat/showfloat \
		./ch03/09_floaterr/floaterr \
		./ch03/10_typesize/typesize \
		./ch03/11_badcount/badcount \
		./ch03/12_escape/escape \
		./ch04/01_talkback/talkback \
		./ch04/02_praisel/praisel \
		./ch04/03_praise2/praise2 \
		./ch04/04_pizza/pizza \
		./ch04/05_defines/defines \
		./ch04/06_printout/printout \
		./ch04/07_width/width \
		./ch04/08_floats/floats \
		./ch04/09_flags/flags

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
		./ch03/08_showfloat/showfloat_dbg \
		./ch03/09_floaterr/floaterr_dbg \
		./ch03/10_typesize/typesize_dbg \
		./ch03/11_badcount/badcount_dbg \
		./ch03/12_escape/escape_dbg \
		./ch04/01_talkback/talkback_dbg \
		./ch04/02_praisel/praisel_dbg \
		./ch04/03_praise2/praise2_dbg \
		./ch04/04_pizza/pizza_dbg \
		./ch04/05_defines/defines_dbg \
		./ch04/06_printout/printout_dbg \
		./ch04/07_width/width_dbg \
		./ch04/08_floats/floats_dbg \
		./ch04/09_flags/flags_dbg

clean:
	find . -name "CH??_*" | xargs rm -f 

./ch01/01_hello_world/hello_world: ${CH01SRC01}
	gcc -s $(CFLAGS) ${CH01SRC01} -o ${CH01DST01} 

./ch01/01_hello_world/hello_world_dbg: ${CH01SRC01}
	tcc -g ${CH01SRC01} -o ${CH01DST01}_dbg ${CFLAGSDBG} 

./ch01/02_cats/cats: ${CH01SRC02}
	gcc -s $(CFLAGS) ${CH01SRC02} -o ${CH01DST02} 

./ch01/02_cats/cats_dbg: ${CH01SRC02}
	tcc -g ${CH01SRC02} -o ${CH01DST02}_dbg ${CFLAGSDBG} 

./ch02/01_simple_computer/simple_computer: ${CH02SRC01}
	gcc -s $(CFLAGS) ${CH02SRC01} -o ${CH02DST01} 

./ch02/01_simple_computer/simple_computer_dbg: ${CH02SRC01}
	tcc -g ${CH02SRC01} -o ${CH02DST01}_dbg ${CFLAGSDBG} 

./ch02/02_fathoms_to_feet/fathoms_to_feet: ${CH02SRC02}
	gcc -s $(CFLAGS) ${CH02SRC02} -o ${CH02DST02} 

./ch02/02_fathoms_to_feet/fathoms_to_feet_dbg: ${CH02SRC02}
	tcc -g ${CH02SRC02} -o ${CH02DST02}_dbg ${CFLAGSDBG} 

./ch02/03_two_func/two_func: ${CH02SRC03}
	gcc -s $(CFLAGS) ${CH02SRC03} -o ${CH02DST03} 

./ch02/03_two_func/two_func_dbg: ${CH02SRC03}
	tcc -g ${CH02SRC03} -o ${CH02DST03}_dbg ${CFLAGSDBG} 

./ch02/04_squared_cube/squared_cube: ${CH02SRC04}
	gcc -s $(CFLAGS) ${CH02SRC04} -o ${CH02DST04} 

./ch02/04_squared_cube/squared_cube_dbg: ${CH02SRC04}
	tcc -g ${CH02SRC04} -o ${CH02DST04}_dbg ${CFLAGSDBG} 

./ch03/01_platinium/platinium: ${CH03SRC01}
	gcc -s $(CFLAGS) ${CH03SRC01} -o ${CH03DST01} 

./ch03/01_platinium/platinium_dbg: ${CH03SRC01}
	tcc -g ${CH03SRC01} -o ${CH03DST01}_dbg ${CFLAGSDBG} 

./ch03/02_print1/print1: ${CH03SRC02}
	gcc -s $(CFLAGS) ${CH03SRC02} -o ${CH03DST02} 

./ch03/02_print1/print1_dbg: ${CH03SRC02}
	tcc -g ${CH03SRC02} -o ${CH03DST02}_dbg ${CFLAGSDBG} 

./ch03/03_bases/bases: ${CH03SRC03}
	gcc -s $(CFLAGS) ${CH03SRC03} -o ${CH03DST03} 

./ch03/03_bases/bases_dbg: ${CH03SRC03}
	tcc -g ${CH03SRC03} -o ${CH03DST03}_dbg ${CFLAGSDBG} 

./ch03/04_toobig/toobig: ${CH03SRC04}
	gcc -s $(CFLAGS) ${CH03SRC04} -o ${CH03DST04} 

./ch03/04_toobig/toobig_dbg: ${CH03SRC04}
	tcc -g ${CH03SRC04} -o ${CH03DST04}_dbg ${CFLAGSDBG} 

./ch03/05_integers/integers: ${CH03SRC05}
	gcc -s $(CFLAGS) ${CH03SRC05} -o ${CH03DST05} 

./ch03/05_integers/integers_dbg: ${CH03SRC05}
	tcc -g ${CH03SRC05} -o ${CH03DST05}_dbg ${CFLAGSDBG} 

./ch03/06_charcode/charcode: ${CH03SRC06}
	gcc -s $(CFLAGS) ${CH03SRC06} -o ${CH03DST06} 

./ch03/06_charcode/charcode_dbg: ${CH03SRC06}
	tcc -g ${CH03SRC06} -o ${CH03DST06}_dbg ${CFLAGSDBG} 

./ch03/07_altnames/altnames: ${CH03SRC07}
	gcc -s $(CFLAGS) ${CH03SRC07} -o ${CH03DST07} 

./ch03/07_altnames/altnames_dbg: ${CH03SRC07}
	tcc -g ${CH03SRC07} -o ${CH03DST07}_dbg ${CFLAGSDBG} 

./ch03/08_showfloat/showfloat: ${CH03SRC08}
	gcc -s $(CFLAGS) ${CH03SRC08} -o ${CH03DST08} 

./ch03/08_showfloat/showfloat_dbg: ${CH03SRC08}
	tcc -g ${CH03SRC08} -o ${CH03DST08}_dbg ${CFLAGSDBG} 

./ch03/09_floaterr/floaterr: ${CH03SRC09}
	gcc -s $(CFLAGS) ${CH03SRC09} -o ${CH03DST09} 

./ch03/09_floaterr/floaterr_dbg: ${CH03SRC09}
	tcc -g ${CH03SRC09} -o ${CH03DST09}_dbg ${CFLAGSDBG} 

./ch03/10_typesize/typesize: ${CH03SRC10}
	gcc -s $(CFLAGS) ${CH03SRC10} -o ${CH03DST10} 

./ch03/10_typesize/typesize_dbg: ${CH03SRC10}
	tcc -g ${CH03SRC10} -o ${CH03DST10}_dbg ${CFLAGSDBG} 

./ch03/11_badcount/badcount: ${CH03SRC11}
	gcc -s $(CFLAGS) ${CH03SRC11} -o ${CH03DST11} 

./ch03/11_badcount/badcount_dbg: ${CH03SRC11}
	tcc -g ${CH03SRC11} -o ${CH03DST11}_dbg ${CFLAGSDBG} 

./ch03/12_escape/escape: ${CH03SRC12}
	gcc -s $(CFLAGS) ${CH03SRC12} -o ${CH03DST12} 

./ch03/12_escape/escape_dbg: ${CH03SRC12}
	tcc -g ${CH03SRC12} -o ${CH03DST12}_dbg ${CFLAGSDBG} 

./ch04/01_talkback/talkback: ${CH04SRC01}
	gcc -s $(CFLAGS) ${CH04SRC01} -o ${CH04DST01} 

./ch04/01_talkback/talkback_dbg: ${CH04SRC01}
	tcc -g ${CH04SRC01} -o ${CH04DST01}_dbg ${CFLAGSDBG} 

./ch04/02_praisel/praisel: ${CH04SRC02}
	gcc -s $(CFLAGS) ${CH04SRC02} -o ${CH04DST02} 

./ch04/02_praisel/praisel_dbg: ${CH04SRC02}
	tcc -g ${CH04SRC02} -o ${CH04DST02}_dbg ${CFLAGSDBG} 

./ch04/03_praise2/praise2: ${CH04SRC03}
	gcc -s $(CFLAGS) ${CH04SRC03} -o ${CH04DST03} 

./ch04/03_praise2/praise2_dbg: ${CH04SRC03}
	tcc -g ${CH04SRC03} -o ${CH04DST03}_dbg ${CFLAGSDBG} 

./ch04/04_pizza/pizza: ${CH04SRC04}
	gcc -s $(CFLAGS) ${CH04SRC04} -o ${CH04DST04} 

./ch04/04_pizza/pizza_dbg: ${CH04SRC04}
	tcc -g ${CH04SRC04} -o ${CH04DST04}_dbg ${CFLAGSDBG} 

./ch04/05_defines/defines: ${CH04SRC05}
	gcc -s $(CFLAGS) ${CH04SRC05} -o ${CH04DST05} 

./ch04/05_defines/defines_dbg: ${CH04SRC05}
	tcc -g ${CH04SRC05} -o ${CH04DST05}_dbg ${CFLAGSDBG} 

./ch04/06_printout/printout: ${CH04SRC06}
	gcc -s $(CFLAGS) ${CH04SRC06} -o ${CH04DST06} 

./ch04/06_printout/printout_dbg: ${CH04SRC06}
	tcc -g ${CH04SRC06} -o ${CH04DST06}_dbg ${CFLAGSDBG} 

./ch04/07_width/width: ${CH04SRC07}
	gcc -s $(CFLAGS) ${CH04SRC07} -o ${CH04DST07} 

./ch04/07_width/width_dbg: ${CH04SRC07}
	tcc -g ${CH04SRC07} -o ${CH04DST07}_dbg ${CFLAGSDBG} 

./ch04/08_floats/floats: ${CH04SRC08}
	gcc -s $(CFLAGS) ${CH04SRC08} -o ${CH04DST08} 

./ch04/08_floats/floats_dbg: ${CH04SRC08}
	tcc -g ${CH04SRC08} -o ${CH04DST08}_dbg ${CFLAGSDBG} 

./ch04/09_flags/flags: ${CH04SRC09}
	gcc -s $(CFLAGS) ${CH04SRC09} -o ${CH04DST09} 

./ch04/09_flags/flags_dbg: ${CH04SRC09}
	tcc -g ${CH04SRC09} -o ${CH04DST09}_dbg ${CFLAGSDBG} 


