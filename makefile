CC=gcc
CFLAGS=-mwindows -c
EXECUTABLE=hw.exe
PREFIX=/bin

all: executable

install:
	cp bin/$(EXECUTABLE) $(PREFIX)

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