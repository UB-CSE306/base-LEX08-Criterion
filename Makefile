# OS identification from: https://stackoverflow.com/questions/714100/os-detecting-makefile
OS := $(shell uname -s)

ifeq ($(OS), Darwin) 
  CUNIT_PATH_PREFIX = /usr/local/Cellar/cunit/2.1-3/
  CUNIT_DIRECTORY = cunit
endif
ifeq ($(OS), Linux) 
  CUNIT_PATH_PREFIX = /util/CUnit/
  CUNIT_DIRECTORY = CUnit/
endif

CC = gcc
DEBUG = -g
CFLAGS = -Wall -std=c11 $(DEBUG)


program.o: program.c
	$(CC) -c $(CFLAGS) program.c


runner.o: runner.c
	$(CC) -c $(CFLAGS) runner.c

runner: program.o runner.o
	$(CC) $(CFLAGS) -o runner program.o runner.o


test.o: test.c
	$(CC) -c $(CFLAGS) -I $(CUNIT_PATH_PREFIX)include/$(CUNIT_DIRECTORY) test.c

tests: program.o test.o
	$(CC) $(CFLAGS) -L $(CUNIT_PATH_PREFIX)lib -I $(CUNIT_PATH_PREFIX)include/$(CUNIT_DIRECTORY) -o tests program.o test.o -lcunit


.PHONY: clean
clean:
	rm -rf *~ *.o program tests runner *.dSYM
