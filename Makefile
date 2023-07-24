# Copyright Croitoru Constantin-Bogdan Grupa 314CA 2022-2023

# compiler setup
CC=gcc
CFLAGS=-Wall -Wextra -std=c99

# define targets
TARGETS= my_octave

build: $(TARGETS)

octave: my_octave.c
	$(CC) $(CFLAGS) my_octave.c -lm -o my_octave

pack:
	zip -FSr 314CA_CroitoruConstantin-Bogdan_Tema2.zip README Makefile *.c *.h

clean:
	rm -f $(TARGETS)

.PHONY: pack clean
