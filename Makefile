# Straight forward Makefile to compile all examples in a row

# If cross-compiling, you may wish to set the following environment variable 
# to the root location of your 'sdk'
# SDKSTAGE=/home/foo/raspberrypi

#if CPU architecture = RaspberryPi 1/Zero
ifeq ($(shell uname -m),armv6l)

CFLAGS+=-Os -mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -mtune=arm1176jzf-s -w

CFLAGSDBG=-w

#if CPU architecture = Rasp 2/3 Family
else ifeq ($(shell uname -m),armv7l)
	#if CPU = Raspberry 3
	ifeq ($(shell lscpu | grep Model: | cut -c24),4)
		CFLAGS+=-Os -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53 -w

		CFLAGSDBG=-w

	#this is for Raspberry 2
	else
		CFLAGS+=-Os -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mtune=cortex-a7 -w
		CFLAGSDBG=-w
	endif

#if else (this is for any PC)
else

CFLAGS+=-O2 -march=native -mtune=native -w

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

#data for CH04_10 example
CH04SRC10=./src/ch04/10_stringf/stringf.c
CH04DST10=./bin/CH04_10_Stringf

#data for CH04_11 example
CH04SRC11=./src/ch04/11_intconv/intconv.c
CH04DST11=./bin/CH04_11_Intconv

#data for CH04_12 example
CH04SRC12=./src/ch04/12_floatconv/floatconv.c
CH04DST12=./bin/CH04_12_Floatconv

#data for CH04_13 example
CH04SRC13=./src/ch04/13_printval/printval.c
CH04DST13=./bin/CH04_13_Printval

#data for CH04_14 example
CH04SRC14=./src/ch04/14_longstrg/longstrg.c
CH04DST14=./bin/CH04_14_Longstrg

#data for CH04_15 example
CH04SRC15=./src/ch04/15_input/input.c
CH04DST15=./bin/CH04_15_Input

#data for CH04_16 example
CH04SRC16=./src/ch04/16_varwid/varwid.c
CH04DST16=./bin/CH04_16_Varwid

#data for CH04_17 example
CH04SRC17=./src/ch04/17_skip2/skip2.c
CH04DST17=./bin/CH04_17_Skip2

#data for CH05_01 example
CH05SRC01=./src/ch05/01_shoes1/shoes1.c
CH05DST01=./bin/CH05_01_Shoes1

#data for CH05_02 example
CH05SRC02=./src/ch05/02_shoes2/shoes2.c
CH05DST02=./bin/CH05_02_Shoes2

#data for CH05_03 example
CH05SRC03=./src/ch05/03_golf/golf.c
CH05DST03=./bin/CH05_03_Golf

#data for CH05_04 example
CH05SRC04=./src/ch05/04_squares/squares.c
CH05DST04=./bin/CH05_04_Squares

#data for CH05_05 example
CH05SRC05=./src/ch05/05_wheat/wheat.c
CH05DST05=./bin/CH05_05_Wheat

#data for CH05_06 example
CH05SRC06=./src/ch05/06_divide/divide.c
CH05DST06=./bin/CH05_06_Divide

#data for CH05_07 example
CH05SRC07=./src/ch05/07_rules/rules.c
CH05DST07=./bin/CH05_07_Rules

#data for CH05_08 example
CH05SRC08=./src/ch05/08_sizeof/sizeof.c
CH05DST08=./bin/CH05_08_Sizeof

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
		./ch04/09_flags/flags \
		./ch04/10_stringf/stringf \
		./ch04/11_intconv/intconv \
		./ch04/12_floatconv/floatconv \
		./ch04/13_printval/printval \
		./ch04/14_longstrg/longstrg \
		./ch04/15_input/input \
		./ch04/16_varwid/varwid \
		./ch04/17_skip2/skip2 \
		./ch05/01_shoes1/shoes1 \
		./ch05/02_shoes2/shoes2 \
		./ch05/03_golf/golf \
		./ch05/04_squares/squares \
		./ch05/05_wheat/wheat \
		./ch05/06_divide/divide \
		./ch05/07_rules/rules \
		./ch05/08_sizeof/sizeof

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
		./ch04/09_flags/flags_dbg \
		./ch04/10_stringf/stringf_dbg \
		./ch04/11_intconv/intconv_dbg \
		./ch04/12_floatconv/floatconv_dbg \
		./ch04/13_printval/printval_dbg \
		./ch04/14_longstrg/longstrg_dbg \
		./ch04/15_input/input_dbg \
		./ch04/16_varwid/varwid_dbg \
		./ch04/17_skip2/skip2_dbg \
		./ch05/01_shoes1/shoes1_dbg \
		./ch05/02_shoes2/shoes2_dbg \
		./ch05/03_golf/golf_dbg \
		./ch05/04_squares/squares_dbg \
		./ch05/05_wheat/wheat_dbg \
		./ch05/06_divide/divide_dbg \
		./ch05/07_rules/rules_dbg \
		./ch05/08_sizeof/sizeof_dbg

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

./ch04/10_stringf/stringf: ${CH04SRC10}
	gcc -s $(CFLAGS) ${CH04SRC10} -o ${CH04DST10} 

./ch04/10_stringf/stringf_dbg: ${CH04SRC10}
	tcc -g ${CH04SRC10} -o ${CH04DST10}_dbg ${CFLAGSDBG} 

./ch04/11_intconv/intconv: ${CH04SRC11}
	gcc -s $(CFLAGS) ${CH04SRC11} -o ${CH04DST11} 

./ch04/11_intconv/intconv_dbg: ${CH04SRC11}
	tcc -g ${CH04SRC11} -o ${CH04DST11}_dbg ${CFLAGSDBG} 

./ch04/12_floatconv/floatconv: ${CH04SRC12}
	gcc -s $(CFLAGS) ${CH04SRC12} -o ${CH04DST12} 

./ch04/12_floatconv/floatconv_dbg: ${CH04SRC12}
	tcc -g ${CH04SRC12} -o ${CH04DST12}_dbg ${CFLAGSDBG} 

./ch04/13_printval/printval: ${CH04SRC13}
	gcc -s $(CFLAGS) ${CH04SRC13} -o ${CH04DST13} 

./ch04/13_printval/printval_dbg: ${CH04SRC13}
	tcc -g ${CH04SRC13} -o ${CH04DST13}_dbg ${CFLAGSDBG} 

./ch04/14_longstrg/longstrg: ${CH04SRC14}
	gcc -s $(CFLAGS) ${CH04SRC14} -o ${CH04DST14} 

./ch04/14_longstrg/longstrg_dbg: ${CH04SRC14}
	tcc -g ${CH04SRC14} -o ${CH04DST14}_dbg ${CFLAGSDBG} 

./ch04/15_input/input: ${CH04SRC15}
	gcc -s $(CFLAGS) ${CH04SRC15} -o ${CH04DST15} 

./ch04/15_input/input_dbg: ${CH04SRC15}
	tcc -g ${CH04SRC15} -o ${CH04DST15}_dbg ${CFLAGSDBG} 

./ch04/16_varwid/varwid: ${CH04SRC16}
	gcc -s $(CFLAGS) ${CH04SRC16} -o ${CH04DST16} 

./ch04/16_varwid/varwid_dbg: ${CH04SRC16}
	tcc -g ${CH04SRC16} -o ${CH04DST16}_dbg ${CFLAGSDBG} 

./ch04/17_skip2/skip2: ${CH04SRC17}
	gcc -s $(CFLAGS) ${CH04SRC17} -o ${CH04DST17} 

./ch04/17_skip2/skip2_dbg: ${CH04SRC17}
	tcc -g ${CH04SRC17} -o ${CH04DST17}_dbg ${CFLAGSDBG} 

./ch05/01_shoes1/shoes1: ${CH05SRC01}
	gcc -s $(CFLAGS) ${CH05SRC01} -o ${CH05DST01} 

./ch05/01_shoes1/shoes1_dbg: ${CH05SRC01}
	tcc -g ${CH05SRC01} -o ${CH05DST01}_dbg ${CFLAGSDBG} 

./ch05/02_shoes2/shoes2: ${CH05SRC02}
	gcc -s $(CFLAGS) ${CH05SRC02} -o ${CH05DST02} 

./ch05/02_shoes2/shoes2_dbg: ${CH05SRC02}
	tcc -g ${CH05SRC02} -o ${CH05DST02}_dbg ${CFLAGSDBG} 

./ch05/03_golf/golf: ${CH05SRC03}
	gcc -s $(CFLAGS) ${CH05SRC03} -o ${CH05DST03} 

./ch05/03_golf/golf_dbg: ${CH05SRC03}
	tcc -g ${CH05SRC03} -o ${CH05DST03}_dbg ${CFLAGSDBG} 

./ch05/04_squares/squares: ${CH05SRC04}
	gcc -s $(CFLAGS) ${CH05SRC04} -o ${CH05DST04} 

./ch05/04_squares/squares_dbg: ${CH05SRC04}
	tcc -g ${CH05SRC04} -o ${CH05DST04}_dbg ${CFLAGSDBG} 

./ch05/05_wheat/wheat: ${CH05SRC05}
	gcc -s $(CFLAGS) ${CH05SRC05} -o ${CH05DST05} 

./ch05/05_wheat/wheat_dbg: ${CH05SRC05}
	tcc -g ${CH05SRC05} -o ${CH05DST05}_dbg ${CFLAGSDBG} 

./ch05/06_divide/divide: ${CH05SRC06}
	gcc -s $(CFLAGS) ${CH05SRC06} -o ${CH05DST06} 

./ch05/06_divide/divide_dbg: ${CH05SRC06}
	tcc -g ${CH05SRC06} -o ${CH05DST06}_dbg ${CFLAGSDBG}

./ch05/07_rules/rules: ${CH05SRC07}
	gcc -s $(CFLAGS) ${CH05SRC07} -o ${CH05DST07} 

./ch05/07_rules/rules_dbg: ${CH05SRC07}
	tcc -g ${CH05SRC07} -o ${CH05DST07}_dbg ${CFLAGSDBG}

./ch05/08_sizeof/sizeof: ${CH05SRC08}
	gcc -s $(CFLAGS) ${CH05SRC08} -o ${CH05DST08} 

./ch05/08_sizeof/sizeof_dbg: ${CH05SRC08}
	tcc -g ${CH05SRC08} -o ${CH05DST08}_dbg ${CFLAGSDBG}
