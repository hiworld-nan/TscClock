CC = g++

Source = $(wildcard ./*.cpp)
Object = $(patsubst %.cpp, %.o, $(Source))

CFlags = -Wall -std=c++2b -m64
OFlags = -Ofast -march=native
LDFlags = -v

CurrDir = ./
IncludeDir = -I./$(CurrDir)

all: tc

$(Object):%.o: %.cpp
	$(CC) $(CFlags) $(OFlags) $(IncludeDir) -c $< -o $@

tc: $(Object)
	$(CC) -o $@ $^ $(LDFlags)
	$(shell [ ! -d ./bin ] && mkdir -p ./bin )
	mv $@ ./bin

.PHONY: clean
clean:
	-rm -f ./bin/tc $(Object)
