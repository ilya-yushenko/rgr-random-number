COMPILER := gcc

CFLAGS := -Wall -Wextra
DEBUG_FLAGS := -g

LDLIBS :=

LIB_PATH :=

TARGET := guess_number

OBJS := main.o guess_number.o random_number.o

ifeq ($(COMPILER),clang)
    CC := clang
else
    CC := gcc
endif

.PHONY: all clean clean_no_dlib check

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET) $(LDLIBS) $(LIB_PATH)

%.o: %.c
	$(CC) $(CFLAGS) $(DEBUG_FLAGS) -c $< -o $@

check:
	perl checkpatch.pl --no-tree -f *.c *.h

clean:
	rm -f $(OBJS) $(TARGET) result.tmp

clean_no_dlib:
	rm -f $(OBJS) $(TARGET) result.tmp

link_dynamic:
	$(eval LDLIBS := -l<library_name>)
	$(eval LIB_PATH := -L<path_to_library>)

debug:
	$(eval DEBUG_FLAGS := -g)

nodebug:
	$(eval DEBUG_FLAGS :=)

