# Macro definitions for "standard" language compilations
#  
#   First, define special compilation flags. These may change when
#   we're done testing and debugging.
CPPFLAGS=-g -DDEBUG
#  
#   The following is "boilerplate" to set up the standard compilation
#   commands:
.SUFFIXES:
.SUFFIXES: .cpp .c .cpp .h .o
.c.o: ; gcc $(CPPFLAGS) -c $*.c
.cpp.o: ; g++ $(CPPFLAGS) -c $*.cpp
#  
#  Targets:
#  
all: progA progB

clean:
	rm progA progB *.o

progA: utilities.o progA1.o progA2.o
	g++ $(CPPFLAGS) utilities.o progA1.o progA2.o
	mv a.out progA

progB: utilities.o progB1.o
	g++ $(CPPFLAGS) utilities.o progB1.o
	mv a.out progB

utilities.o: utilities.cpp utilities.h

progA1.o: progA1.cpp utilities.h progA1.h

progA2.o: progA2.cpp utilities.h progA1.h

progB1.o: progB1.cpp
