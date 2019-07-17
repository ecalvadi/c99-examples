# c99-examples

This repository contains many examples of C programming with the Standar C99, I use standar C99 for fast compile in slow devices like a Raspberry Pi 1/Zero with the Tiny C Compiler. All examples are compiled with a simple `make` command in any GNU/Linux.

If you need to compile this examples with GCC and all optimizations for each device you need to type `make release`, obiously is more slow than a simple `make` command.

## How to build the examples

To build the examples the following packages are required on GNU/Linux PC:

 - gcc
 - make
 - build-essential (in debian based distros)
 - tcc (fast compiler)
 - git

~~~
sudo apt install tcc git build-essential make gcc
~~~

In case to build on Raspberry Pi (1,2,3), only need the following packages:

 - tcc
 - git

~~~
sudo apt install tcc git
~~~

Now build with the following instructions:

### 1.-Get the source

Clone the Git repository with:

~~~
git clone https://github.com/ecalvadi/c99-examples.git
~~~

### 2.-Build

Enter to the new folder and compile:

~~~
cd c99-examples/
make
~~~

For build an optimized binary run (Generally takes more time to build).

~~~
make release
~~~

The binary are saved on "bin" folder. To run type in the console the following example:

~~~
./binary_to_run
~~~

## Chapters

This repository are divided in Chapters (`chxx`), the chapters are:

Ch01 - Gettin Started

Ch02 - Introducction

Ch03 - Data

Ch04 - Strings and Input/Output

Ch05 - Operators, expressions, statements

Ch06 - Looping (Control statements)

... more soon.

Please, send me an email to improve this repository: hector@eclipsedpixel.com 
