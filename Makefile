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

# Run with input from <FILE>.in if present
run: $(FILE)
	@if [ -f $(FILE).in ]; then ./$(FILE) < $(FILE).in; \
	else ./$(FILE); fi

# Run without input even if input file exists
run-noin: $(FILE)
	./$(FILE)

# Multi-test runner: folder f-tests/ with .in files
test: $(FILE)
	@if [ -d $(FILE)-tests ]; then \
		for t in $(FILE)-tests/*.in; do \
			echo "== $$t =="; \
			./$(FILE) < $$t; \
		done \
	else \
		echo "No $(FILE)-tests/ directory"; \
	fi

clean:
	rm -f $(patsubst %.cpp,%,$(wildcard *.cpp))

.PHONY: all run run-noin test clean
