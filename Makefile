# Makefile to build simple_window.dll and test_simple_window.exe
CC = gcc
CFLAGS = -Wall -shared -o
TARGET_DLL = simple_window.dll
TARGET_TEST = test_simple_window.exe
OBJS_DLL = simple_window.o
OBJS_TEST = test_simple_window.o

all: $(TARGET_DLL) $(TARGET_TEST)

$(TARGET_DLL): $(OBJS_DLL)
	$(CC) $(CFLAGS) $(TARGET_DLL) $(OBJS_DLL) -lgdi32

$(TARGET_TEST): $(OBJS_TEST)
	$(CC) -o $(TARGET_TEST) $(OBJS_TEST)

simple_window.o: simple_window.c
	$(CC) -c simple_window.c

test_simple_window.o: test_simple_window.c
	$(CC) -c test_simple_window.c

clean:
	del $(OBJS_DLL) $(OBJS_TEST) $(TARGET_DLL) $(TARGET_TEST)

