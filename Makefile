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

debug: $(OBJDIR)/main.o $(OBJDIR)/parser.o $(OBJDIR)/logging.o
	$(CC) $(CFLAGS) $^ -o $(TESTDIR)/$(OUTNAME)

release: $(OBJDIR)/main.o $(OBJDIR)/parser.o $(OBJDIR)/logging.o
	$(CC) $(CFLAGS) $^ -o $(BINDIR)/$(OUTNAME)

$(OBJDIR)/main.o: $(SRCDIR)/main.c
	$(CC) $(CFLAGS) -c $^ -o $@

$(OBJDIR)/parser.o: $(SRCDIR)/parser.c
	$(CC) $(CFLAGS) -c $^ -o $@

$(OBJDIR)/logging.o: $(SRCDIR)/logging.c
	$(CC) $(CFLAGS) -c $^ -o $@

clean:
	powershell del $(CLEANTARGETS)