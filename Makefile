CXX := g++
CXXFLAGS := -std=c++23 -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align

# Debug mode: LOCAL=1
ifeq ($(DBG),1)
	CXXFLAGS += -DLOCAL=1
endif

# Most recently modified .cpp file
LAST := $(shell ls -t *.cpp | head -n 1)
FILE := $(LAST:.cpp=)

# Default: build the last edited file
all: $(FILE)

# Pattern rule: build any single-file program
%: %.cpp
	$(CXX) $< -o $@ $(CXXFLAGS)

clean:
	rm -f $(patsubst %.cpp,%,$(wildcard *.cpp))

.PHONY: all clean
