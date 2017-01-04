CC=gcc
CFLAGS=-c
EXECUTABLE=hw
PREFIX=/bin
OS=$(shell uname -o)
FILEEXT=c

# Windows MinGW
ifeq ($(OS),Msys)
	CFLAGS += -mwindows
	EXECUTABLE :=$(EXECUTABLE).exe
endif

# OSX
ifeq ($(OS),Darwin)
	CC=clang++
	FILEEXT=cpp
	CFLAGS += -std=c++11 -stdlib=libc++ -Weverything
endif

# Linux is default compiling using GCC

all: executable

install:
	cp bin/$(EXECUTABLE) $(PREFIX)

detect:
	echo $(shell uname -o)

executable: bin/ build/ build/main.o
	$(CC) -o bin/$(EXECUTABLE) build/main.o;

bin/:
	mkdir bin

build/:
	mkdir build

build/main.o: main.$(FILEEXT)
	$(CC) $(CFLAGS) -o build/main.o main.$(FILEEXT)

clean:
	@rm -dvfr build
	@rm -dvfr bin
