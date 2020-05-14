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
	export LD_LIBRARY_PATH=$(REPLIB)/$(LIBRAIRIE)
	mv $(REPLIB)/$(LIBRAIRIE) /usr/lib
	ldconfig
	$(CC) -o $(BIN)/$(EXE).exe $(SRC)/$(SOURCE).c  $(REPLIB)/$(LIBRAIRIE)

clean:
	rm bin/*
