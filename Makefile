### If you wish to use extra libraries (math.h for instance),
### add their flags here (-lm in our case) in the "LIBS" variable.

LIBS = -lm

###
CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Wmissing-declarations
CFLAGS += -DUNITY_SUPPORT_64 -DUNITY_OUTPUT_COLOR

ASANFLAGS  = -fsanitize=address
ASANFLAGS += -fno-common
ASANFLAGS += -fno-omit-frame-pointer

.PHONY: build
build: srcs

.PHONY: clean
clean:
	rm -rf *.o *.out *.out.dSYM

srcs: ./*.c ./*.h
	@echo Compiling $@
	@$(CC) $(CFLAGS) ./*.c -o daytimetcpcli $(LIBS)


