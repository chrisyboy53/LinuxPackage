CC=gcc
CFLAGS=-c
EXECUTABLE=hw
PREFIX=/bin
OS=$(shell uname -o)

ifeq ($(OS),Msys)
	CFLAGS += -mwindows
	EXECUTABLE +=.exe
endif

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

build/main.o: main.c
	$(CC) $(CFLAGS) -o build/main.o main.c

clean:
	@rm -dvfr build
	@rm -dvfr bin
