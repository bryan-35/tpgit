# Définition du compilateur
CC = gcc

# definition des options de compilation pour obtenir un fichier .o
PRODUCTFLAGS = -c

# Définition des librairies
REPLIB = lib
LIBRAIRIE = libkomo.so

# Définition des répertoires
    # Sources
SRC = src
    # Binaires
BIN = bin

# Définition des fichiers
    # .c
SOURCE = main
    # .exe
EXE = main

main:
	gcc -c src/main.c -o bin/main.o
	gcc -c -fPIC src/source1.c -o bin/source1.o
	gcc -c -fPIC src/source2.c -o bin/source2.o
	gcc -shared bin/source1.o bin/source2.o -o lib/libkomo.so
	export LD_LIBRARY_PATH=$(REPLIB)/$(LIBRAIRIE)
	echo $(PWD)/$(REPLIB) >> /etc/ld.so.conf
	cp $(REPLIB)/$(LIBRAIRIE) /usr/lib
	ldconfig
	$(CC) -o $(BIN)/$(EXE).exe $(SRC)/$(SOURCE).c  $(REPLIB)/$(LIBRAIRIE)

clean:
	rm bin/*
