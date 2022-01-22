BINDIR = bin
TESTDIR = test
INCDIR = inc
OBJDIR = obj
SRCDIR = src
CLEANTARGETS = $(OBJDIR)/*.o, $(BINDIR)/*.exe, $(TESTDIR)/*.exe


ALLOBJS = $(foreach obj,$(OBJ),text)
OUTNAME = assembler.exe

CC = gcc
CFLAGS = -Wall -ansi -pedantic -I$(INCDIR)

release: $(OBJDIR)/main.o
	$(CC) $(CFLAGS) $^ -o $(BINDIR)/$(OUTNAME)

debug: $(OBJDIR)/main.o
	$(CC) $(CFLAGS) $^ -o $(TESTDIR)/$(OUTNAME)

$(OBJDIR)/main.o: $(SRCDIR)/main.c
	$(CC) $(CFLAGS) -c $^ -o $@

clean:
	powershell del $(CLEANTARGETS)