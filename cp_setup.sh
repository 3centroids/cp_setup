#!/usr/bin/env bash

# Usage: make_problem.sh problem-name [num-tests]
# Example: make_problem.sh f 3
# If num-tests is omitted, defaults to 0

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <problem-name> [num-tests]"
    exit 1
fi

NAME="$1"
NUM_TESTS="${2:-0}"  # default to 0 if not provided

# Create problem source if it doesn't exist
if [ -f "$NAME.cpp" ]; then
    echo "$NAME.cpp already exists"
else
    touch "$NAME.cpp"
    echo "Created $NAME.cpp"
fi

# Create input file if not present
if [ ! -f "$NAME.in" ]; then
    touch "$NAME.in"
    echo "Created $NAME.in"
fi

# Create tests if requested
if [ "$NUM_TESTS" -gt 0 ]; then
    TESTDIR="${NAME}-tests"
    mkdir -p "$TESTDIR"
    for ((i=1; i<=NUM_TESTS; i++)); do
        TEST_IN="$TESTDIR/$i.in"
        if [ ! -f "$TEST_IN" ]; then
            touch "$TEST_IN"
        fi
        TEST_OUT="$TESTDIR/$i.out"
        if [ ! -f "$TEST_OUT" ]; then
            touch "$TEST_OUT"
        fi
    done
    echo "Created $NUM_TESTS test files in $TESTDIR/"
fi
