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

CH01SRC01=./src/ch01/01_hello_world/hello_world.c
CH01DST01=./bin/CH01_01_Hello_World

CH01SRC02=./src/ch01/02_cats/cats.c
CH01DST02=./bin/CH01_02_Cats

CH02SRC01=./src/ch02/01_simple_computer/simple_computer.c
CH02DST01=./bin/CH02_01_Simple_Computer

CH02SRC02=./src/ch02/02_fathoms_to_feet/fathoms_to_feet.c
CH02DST02=./bin/CH02_02_Fathoms_to_feet

CH02SRC03=./src/ch02/03_two_func/two_func.c
CH02DST03=./bin/CH02_03_Two_Func

CH02SRC04=./src/ch02/04_squared_cube/squared_cube.c
CH02DST04=./bin/CH02_04_Squared_Cube

CH03SRC01=./src/ch03/01_platinium/platinium.c
CH03DST01=./bin/CH03_01_Platinium

CH03SRC02=./src/ch03/02_print1/print1.c
CH03DST02=./bin/CH03_02_Print1

CH03SRC03=./src/ch03/03_bases/bases.c
CH03DST03=./bin/CH03_03_Bases

CH03SRC04=./src/ch03/04_toobig/toobig.c
CH03DST04=./bin/CH03_04_Toobig

CH03SRC05=./src/ch03/05_integers/integers.c
CH03DST05=./bin/CH03_05_Integers

CH03SRC06=./src/ch03/06_charcode/charcode.c
CH03DST06=./bin/CH03_06_Charcode

CH03SRC07=./src/ch03/07_altnames/altnames.c
CH03DST07=./bin/CH03_07_Altnames

CH03SRC08=./src/ch03/08_showfloat/showfloat.c
CH03DST08=./bin/CH03_08_Showfloat

CH03SRC09=./src/ch03/09_floaterr/floaterr.c
CH03DST09=./bin/CH03_09_Floaterr

CH03SRC10=./src/ch03/10_typesize/typesize.c
CH03DST10=./bin/CH03_10_Typesize

CH03SRC11=./src/ch03/11_badcount/badcount.c
CH03DST11=./bin/CH03_11_Badcount

CH03SRC12=./src/ch03/12_escape/escape.c
CH03DST12=./bin/CH03_12_Escape

CH04SRC01=./src/ch04/01_talkback/talkback.c
CH04DST01=./bin/CH04_01_Talkback

CH04SRC02=./src/ch04/02_praisel/praisel.c
CH04DST02=./bin/CH04_02_Praisel

CH04SRC03=./src/ch04/03_praise2/praise2.c
CH04DST03=./bin/CH04_03_Praise2

CH04SRC04=./src/ch04/04_pizza/pizza.c
CH04DST04=./bin/CH04_04_Pizza

CH04SRC05=./src/ch04/05_defines/defines.c
CH04DST05=./bin/CH04_05_Defines

CH04SRC06=./src/ch04/06_printout/printout.c
CH04DST06=./bin/CH04_06_Printout

CH04SRC07=./src/ch04/07_width/width.c
CH04DST07=./bin/CH04_07_Width

CH04SRC08=./src/ch04/08_floats/floats.c
CH04DST08=./bin/CH04_08_Floats

CH04SRC09=./src/ch04/09_flags/flags.c
CH04DST09=./bin/CH04_09_Flags

CH04SRC10=./src/ch04/10_stringf/stringf.c
CH04DST10=./bin/CH04_10_Stringf

CH04SRC11=./src/ch04/11_intconv/intconv.c
CH04DST11=./bin/CH04_11_Intconv

CH04SRC12=./src/ch04/12_floatconv/floatconv.c
CH04DST12=./bin/CH04_12_Floatconv

CH04SRC13=./src/ch04/13_printval/printval.c
CH04DST13=./bin/CH04_13_Printval

CH04SRC14=./src/ch04/14_longstrg/longstrg.c
CH04DST14=./bin/CH04_14_Longstrg

CH04SRC15=./src/ch04/15_input/input.c
CH04DST15=./bin/CH04_15_Input

CH04SRC16=./src/ch04/16_varwid/varwid.c
CH04DST16=./bin/CH04_16_Varwid

CH04SRC17=./src/ch04/17_skip2/skip2.c
CH04DST17=./bin/CH04_17_Skip2

CH05SRC01=./src/ch05/01_shoes1/shoes1.c
CH05DST01=./bin/CH05_01_Shoes1

CH05SRC02=./src/ch05/02_shoes2/shoes2.c
CH05DST02=./bin/CH05_02_Shoes2

CH05SRC03=./src/ch05/03_golf/golf.c
CH05DST03=./bin/CH05_03_Golf

CH05SRC04=./src/ch05/04_squares/squares.c
CH05DST04=./bin/CH05_04_Squares

CH05SRC05=./src/ch05/05_wheat/wheat.c
CH05DST05=./bin/CH05_05_Wheat

CH05SRC06=./src/ch05/06_divide/divide.c
CH05DST06=./bin/CH05_06_Divide

CH05SRC07=./src/ch05/07_rules/rules.c
CH05DST07=./bin/CH05_07_Rules

CH05SRC08=./src/ch05/08_sizeof/sizeof.c
CH05DST08=./bin/CH05_08_Sizeof

CH05SRC09=./src/ch05/09_minsec/minsec.c
CH05DST09=./bin/CH05_09_Minsec

CH05SRC09=./src/ch05/09_minsec/minsec.c
CH05DST09=./bin/CH05_09_Minsec

CH05SRC10=./src/ch05/10_addone/addone.c
CH05DST10=./bin/CH05_10_Addone

CH05SRC11=./src/ch05/11_postpre/postpre.c
CH05DST11=./bin/CH05_11_Postpre

CH05SRC12=./src/ch05/12_bottles/bottles.c
CH05DST12=./bin/CH05_12_Bottles

CH05SRC13=./src/ch05/13_addemup/addemup.c
CH05DST13=./bin/CH05_13_Addemup

CH05SRC14=./src/ch05/14_convert/convert.c
CH05DST14=./bin/CH05_14_Convert

CH05SRC15=./src/ch05/15_pound/pound.c
CH05DST15=./bin/CH05_15_Pound

CH05SRC16=./src/ch05/16_running/running.c
CH05DST16=./bin/CH05_16_Running

CH06SRC01=./src/ch06/01_summing/summing.c
CH06DST01=./bin/CH06_01_Summing

CH06SRC01_2=./src/ch06/01_summing/summing_short.c
CH06DST01_2=./bin/CH06_01_Summing_short

CH06SRC02=./src/ch06/02_when/when.c
CH06DST02=./bin/CH06_02_When

CH06SRC03=./src/ch06/03_while1/while1.c
CH06DST03=./bin/CH06_03_While1

CH06SRC04=./src/ch06/04_while2/while2.c
CH06DST04=./bin/CH06_04_While2

CH06SRC05=./src/ch06/05_cmpflt/cmpflt.c
CH06DST05=./bin/CH06_05_Cmpflt

CH06SRC06=./src/ch06/06_truefalse/truefalse.c
CH06DST06=./bin/CH06_06_Truefalse

CH06SRC07=./src/ch06/07_truth/truth.c
CH06DST07=./bin/CH06_07_Truth

CH06SRC08=./src/ch06/08_trouble/trouble.c
CH06DST08=./bin/CH06_08_Trouble


default: debug

all: release

release: ch01_rel \
		 ch02_rel \
		 ch03_rel \
		 ch04_rel \
		 ch05_rel \
		 ch06_rel

debug:  ch01 \
		ch02 \
		ch03 \
		ch04 \
		ch05 \
		ch06

clean:
	find . -name "CH??_*" | xargs rm -f 

ch01_rel:
	gcc -s $(CFLAGS) ${CH01SRC01} -o ${CH01DST01}
	gcc -s $(CFLAGS) ${CH01SRC02} -o ${CH01DST02} 

ch01:
	tcc -g ${CH01SRC01} -o ${CH01DST01}_dbg ${CFLAGSDBG} 
	tcc -g ${CH01SRC02} -o ${CH01DST02}_dbg ${CFLAGSDBG}

ch02_rel:
	gcc -s $(CFLAGS) ${CH02SRC01} -o ${CH02DST01}
	gcc -s $(CFLAGS) ${CH02SRC02} -o ${CH02DST02}
	gcc -s $(CFLAGS) ${CH02SRC03} -o ${CH02DST03}
	gcc -s $(CFLAGS) ${CH02SRC04} -o ${CH02DST04}

ch02:
	tcc -g ${CH02SRC01} -o ${CH02DST01}_dbg ${CFLAGSDBG}
	tcc -g ${CH02SRC02} -o ${CH02DST02}_dbg ${CFLAGSDBG}
	tcc -g ${CH02SRC03} -o ${CH02DST03}_dbg ${CFLAGSDBG}
	tcc -g ${CH02SRC04} -o ${CH02DST04}_dbg ${CFLAGSDBG}

ch03_rel:
	gcc -s $(CFLAGS) ${CH03SRC01} -o ${CH03DST01}
	gcc -s $(CFLAGS) ${CH03SRC02} -o ${CH03DST02}
	gcc -s $(CFLAGS) ${CH03SRC03} -o ${CH03DST03}
	gcc -s $(CFLAGS) ${CH03SRC04} -o ${CH03DST04}
	gcc -s $(CFLAGS) ${CH03SRC05} -o ${CH03DST05}
	gcc -s $(CFLAGS) ${CH03SRC06} -o ${CH03DST06}
	gcc -s $(CFLAGS) ${CH03SRC07} -o ${CH03DST07}
	gcc -s $(CFLAGS) ${CH03SRC08} -o ${CH03DST08}
	gcc -s $(CFLAGS) ${CH03SRC09} -o ${CH03DST09}
	gcc -s $(CFLAGS) ${CH03SRC10} -o ${CH03DST10}
	gcc -s $(CFLAGS) ${CH03SRC11} -o ${CH03DST11}
	gcc -s $(CFLAGS) ${CH03SRC12} -o ${CH03DST12}

ch03:
	tcc -g ${CH03SRC01} -o ${CH03DST01}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC02} -o ${CH03DST02}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC03} -o ${CH03DST03}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC04} -o ${CH03DST04}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC05} -o ${CH03DST05}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC06} -o ${CH03DST06}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC07} -o ${CH03DST07}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC08} -o ${CH03DST08}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC09} -o ${CH03DST09}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC10} -o ${CH03DST10}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC11} -o ${CH03DST11}_dbg ${CFLAGSDBG}
	tcc -g ${CH03SRC12} -o ${CH03DST12}_dbg ${CFLAGSDBG}

ch04_rel:
	gcc -s $(CFLAGS) ${CH04SRC01} -o ${CH04DST01}
	gcc -s $(CFLAGS) ${CH04SRC02} -o ${CH04DST02}
	gcc -s $(CFLAGS) ${CH04SRC03} -o ${CH04DST03}
	gcc -s $(CFLAGS) ${CH04SRC04} -o ${CH04DST04}
	gcc -s $(CFLAGS) ${CH04SRC05} -o ${CH04DST05}
	gcc -s $(CFLAGS) ${CH04SRC06} -o ${CH04DST06}
	gcc -s $(CFLAGS) ${CH04SRC07} -o ${CH04DST07}
	gcc -s $(CFLAGS) ${CH04SRC08} -o ${CH04DST08}
	gcc -s $(CFLAGS) ${CH04SRC09} -o ${CH04DST09}
	gcc -s $(CFLAGS) ${CH04SRC10} -o ${CH04DST10}
	gcc -s $(CFLAGS) ${CH04SRC11} -o ${CH04DST11}
	gcc -s $(CFLAGS) ${CH04SRC12} -o ${CH04DST12}
	gcc -s $(CFLAGS) ${CH04SRC13} -o ${CH04DST13}
	gcc -s $(CFLAGS) ${CH04SRC14} -o ${CH04DST14}
	gcc -s $(CFLAGS) ${CH04SRC15} -o ${CH04DST15}
	gcc -s $(CFLAGS) ${CH04SRC16} -o ${CH04DST16}
	gcc -s $(CFLAGS) ${CH04SRC17} -o ${CH04DST17}

ch04:
	tcc -g ${CH04SRC01} -o ${CH04DST01}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC02} -o ${CH04DST02}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC03} -o ${CH04DST03}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC04} -o ${CH04DST04}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC05} -o ${CH04DST05}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC06} -o ${CH04DST06}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC07} -o ${CH04DST07}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC08} -o ${CH04DST08}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC09} -o ${CH04DST09}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC10} -o ${CH04DST10}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC11} -o ${CH04DST11}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC12} -o ${CH04DST12}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC13} -o ${CH04DST13}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC14} -o ${CH04DST14}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC15} -o ${CH04DST15}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC16} -o ${CH04DST16}_dbg ${CFLAGSDBG}
	tcc -g ${CH04SRC17} -o ${CH04DST17}_dbg ${CFLAGSDBG}

ch05_rel:
	gcc -s $(CFLAGS) ${CH05SRC01} -o ${CH05DST01}
	gcc -s $(CFLAGS) ${CH05SRC02} -o ${CH05DST02}
	gcc -s $(CFLAGS) ${CH05SRC03} -o ${CH05DST03}
	gcc -s $(CFLAGS) ${CH05SRC04} -o ${CH05DST04}
	gcc -s $(CFLAGS) ${CH05SRC05} -o ${CH05DST05}
	gcc -s $(CFLAGS) ${CH05SRC06} -o ${CH05DST06}
	gcc -s $(CFLAGS) ${CH05SRC07} -o ${CH05DST07}
	gcc -s $(CFLAGS) ${CH05SRC08} -o ${CH05DST08}
	gcc -s $(CFLAGS) ${CH05SRC09} -o ${CH05DST09}
	gcc -s $(CFLAGS) ${CH05SRC10} -o ${CH05DST10}
	gcc -s $(CFLAGS) ${CH05SRC11} -o ${CH05DST11}
	gcc -s $(CFLAGS) ${CH05SRC12} -o ${CH05DST12}
	gcc -s $(CFLAGS) ${CH05SRC13} -o ${CH05DST13}
	gcc -s $(CFLAGS) ${CH05SRC14} -o ${CH05DST14}
	gcc -s $(CFLAGS) ${CH05SRC15} -o ${CH05DST15}
	gcc -s $(CFLAGS) ${CH05SRC16} -o ${CH05DST16}

ch05:
	tcc -g ${CH05SRC01} -o ${CH05DST01}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC02} -o ${CH05DST02}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC03} -o ${CH05DST03}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC04} -o ${CH05DST04}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC05} -o ${CH05DST05}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC06} -o ${CH05DST06}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC07} -o ${CH05DST07}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC08} -o ${CH05DST08}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC09} -o ${CH05DST09}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC10} -o ${CH05DST10}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC11} -o ${CH05DST11}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC12} -o ${CH05DST12}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC13} -o ${CH05DST13}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC14} -o ${CH05DST14}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC15} -o ${CH05DST15}_dbg ${CFLAGSDBG}
	tcc -g ${CH05SRC16} -o ${CH05DST16}_dbg ${CFLAGSDBG}

ch06_rel:
	gcc -s $(CFLAGS) ${CH06SRC01} -o ${CH06DST01}
	gcc -s $(CFLAGS) ${CH06SRC01_2} -o ${CH06DST01_2}
	gcc -s $(CFLAGS) ${CH06SRC02} -o ${CH06DST02}
	gcc -s $(CFLAGS) ${CH06SRC03} -o ${CH06DST03}
	gcc -s $(CFLAGS) ${CH06SRC04} -o ${CH06DST04}
	gcc -s $(CFLAGS) ${CH06SRC05} -o ${CH06DST05}
	gcc -s $(CFLAGS) ${CH06SRC06} -o ${CH06DST06}
	gcc -s $(CFLAGS) ${CH06SRC07} -o ${CH06DST07}
	gcc -s $(CFLAGS) ${CH06SRC08} -o ${CH06DST08}

ch06:
	tcc -g ${CH06SRC01} -o ${CH06DST01}_dbg ${CFLAGSDBG}
	tcc -g ${CH06SRC01_2} -o ${CH06DST01_2}_dbg ${CFLAGSDBG}
	tcc -g ${CH06SRC02} -o ${CH06DST02}_dbg ${CFLAGSDBG}
	tcc -g ${CH06SRC03} -o ${CH06DST03}_dbg ${CFLAGSDBG}
	tcc -g ${CH06SRC04} -o ${CH06DST04}_dbg ${CFLAGSDBG}
	tcc -g ${CH06SRC05} -o ${CH06DST05}_dbg ${CFLAGSDBG} -lm
	tcc -g ${CH06SRC06} -o ${CH06DST06}_dbg ${CFLAGSDBG} 
	tcc -g ${CH06SRC07} -o ${CH06DST07}_dbg ${CFLAGSDBG} 
	tcc -g ${CH06SRC08} -o ${CH06DST08}_dbg ${CFLAGSDBG} 

