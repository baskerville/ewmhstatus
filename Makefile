VERSION = 0.01

CC      = gcc
LIBS    = `pkg-config --libs xcb xcb-icccm xcb-ewmh cairo`
CFLAGS  = -g -std=c99 -pedantic -Wall -Wextra
LDFLAGS = $(LIBS)

PREFIX    ?= /usr/local
BINPREFIX = $(PREFIX)/bin

SRC = ewmhstatus.c

OBJ = $(SRC:.c=.o)

all: options ewmhstatus

options:
	@echo "ewmhstatus build options:"
	@echo "CC      = $(CC)"
	@echo "CFLAGS  = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "PREFIX  = $(PREFIX)"

.c.o:
	@echo "CC $<"
	@$(CC) $(CFLAGS) -DVERSION=\"$(VERSION)\" -c -o $@ $<

ewmhstatus:   $(OBJ)
	@echo CC -o $@
	@$(CC) -o $@ $(OBJ) $(LDFLAGS)
clean:
	@echo "cleaning"
	@rm -f $(OBJ) ewmhstatus

install: all
	@echo "installing executable files to $(DESTDIR)$(BINPREFIX)"
	@install -D -m 755 ewmhstatus $(DESTDIR)$(BINPREFIX)/ewmhstatus

uninstall:
	@echo "removing executable files from $(DESTDIR)$(BINPREFIX)"
	@rm -f $(DESTDIR)$(BINPREFIX)/ewmhstatus

.PHONY: all options clean install uninstall
