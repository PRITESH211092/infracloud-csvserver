#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 start_index end_index"
    exit 1
fi

start_index=$1
end_index=$2

# Generate the inputFile with the index and random numbers
for i in $(seq $start_index $end_index); do
    echo "$i, $((RANDOM % 100 + 1))"
done > inputFile

