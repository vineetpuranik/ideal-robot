#!/bin/bash

# Tower of Hanoi Demonstration in Bash
# This script solves the Tower of Hanoi puzzle using recursion.
# It demonstrates recursive problem-solving by breaking down the problem
# into smaller subproblems.

# Number of disks (default 3, can be passed as argument)
n=3
if [ $# -gt 0 ]; then
    n=$1
fi

# Pegs represented as arrays (0-indexed, bottom to top)
declare -a peg1 peg2 peg3

# Initialize peg1 with disks (1 is smallest, n is largest)
for ((i=n; i>=1; i--)); do
    peg1+=($i)
done

# Display function: simple text representation of pegs
display() {
    echo "Current state:"
    echo "Peg 1: ${peg1[*]}"
    echo "Peg 2: ${peg2[*]}"
    echo "Peg 3: ${peg3[*]}"
    echo
}

# Recursive function to move disks
# Parameters: from_peg, aux_peg, to_peg, num_disks
move_disks() {
    local from=$1
    local aux=$2
    local to=$3
    local num=$4

    if [ $num -eq 1 ]; then
        # Base case: move single disk
        # This is the non-recursive part, directly moving the disk
        eval "disk=\${${from}[0]}"
        eval "${from}=(\"\${${from}[@]:1}\")"
        eval "${to}=($disk \"\${${to}[@]}\")"
        echo "Move disk $disk from $from to $to"
        display
        return
    fi

    # Recursive case: move n-1 disks to auxiliary peg
    # This demonstrates recursion: calling the same function with smaller problem
    move_disks $from $to $aux $((num-1))

    # Move the bottom disk to target peg
    move_disks $from $aux $to 1

    # Move the n-1 disks from auxiliary to target peg
    # Another recursive call
    move_disks $aux $from $to $((num-1))
}

echo "Tower of Hanoi with $n disks"
echo "Initial state:"
display

# Start the recursive solution
move_disks peg1 peg2 peg3 $n

echo "Puzzle solved!"
