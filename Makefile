VERSION = 0.1

CC      = gcc
LIBS    = -lm -lxcb -lxcb-icccm -lxcb-ewmh -lcairo
CFLAGS  = -g -std=c99 -pedantic -Wall -Wextra -I$(PREFIX)/include
LDFLAGS = -L$(PREFIX)/lib

PREFIX    ?= /usr/local
BINPREFIX = $(PREFIX)/bin

SRC = ewmhstatus.c

OBJ = $(SRC:.c=.o)

all: options clean ewmhstatus

options:
	@echo "ewmhstatus build options:"
	@echo "CC      = $(CC)"
	@echo "CFLAGS  = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "LIBS    = $(LIBS)"
	@echo "PREFIX  = $(PREFIX)"

.c.o:
	@echo "CC $<"
	@$(CC) $(CFLAGS) -DVERSION=\"$(VERSION)\" -c -o $@ $<

ewmhstatus:   $(OBJ)
	@echo CC -o $@
	@$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)
clean:
	@echo "cleaning"
	@rm -f $(OBJ) ewmhstatus

install: all
	@echo "installing executable files to $(DESTDIR)$(BINPREFIX)"
	@mkdir -p "$(DESTDIR)$(BINPREFIX)"
	@cp ewmhstatus "$(DESTDIR)$(BINPREFIX)"
	@chmod 755 "$(DESTDIR)$(BINPREFIX)"/ewmhstatus

uninstall:
	@echo "removing executable files from $(DESTDIR)$(BINPREFIX)"
	@rm -f $(DESTDIR)$(BINPREFIX)/ewmhstatus

.PHONY: all options clean install uninstall
