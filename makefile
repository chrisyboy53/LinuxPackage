CC=gcc
CFLAGS=-c
EXECUTABLE=hw.exe
PREFIX=/bin
OS=$(shell uname -o)

ifeq ($(OS),Msys)
	CFLAGS += -mwindows
endif

all: executable

install:
	cp bin/$(EXECUTABLE) $(PREFIX)

detect:
	echo $(shell uname -s)

executable: bin/ build/ build/main.o
	$(CC) -o bin/$(EXECUTABLE) build/main.o;

bin/:
	mkdir bin

build/:
	mkdir build

build/main.o: main.c
	$(CC) $(CFLAGS) -o build/main.o main.c

clean:
	@rm -dvfr build
	@rm -dvfr bin
