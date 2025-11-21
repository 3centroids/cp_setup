#!/usr/bin/env bash
# Usage: run-tests.sh file
# Expects a folder <FILE>-tests/ with *.in and corresponding *.out files

set -e

FILE="${1:-$(ls -t *.cpp | head -n1)}"
FILE="${FILE%.cpp}"
TESTDIR="${FILE}-tests"

if [ ! -f "$FILE" ]; then
    echo "File $FILE not found."
    exit 1
fi

if [ ! -d "$TESTDIR" ]; then
    echo "Test directory $TESTDIR not found."
    exit 1
fi

for INFILE in "$TESTDIR"/*.in; do
    [ -e "$INFILE" ] || continue
    OUTFILE="${INFILE%.in}.out"
    if [ ! -f "$OUTFILE" ]; then
        echo "(no .out file, skipping diff)"
        ./"$FILE" < "$INFILE"
    else
        ./"$FILE" < "$INFILE" > tmp.out
        if diff -b -q tmp.out "$OUTFILE" >/dev/null; then
            echo "OK $(basename "$INFILE" .in)"
        else
            echo "WA $(basename "$INFILE" .in)"
            diff "$OUTFILE" tmp.out
        fi
        rm -f tmp.out
    fi
done
