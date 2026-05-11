# Tower of Hanoi Demonstration

This bash script demonstrates the classic Tower of Hanoi puzzle solved using recursion.

## Features
- Recursive solution to Tower of Hanoi
- Simple text-based graphics showing peg states
- Configurable number of disks
- Step-by-step move display

## How to Test
1. Ensure you have bash installed (most Linux systems do).
2. Make the script executable: `chmod +x toh.sh`
3. Run the script with default 3 disks: `./toh.sh` or `bash toh.sh`
4. Test with different disk counts: `./toh.sh 4` (note: moves = 2^n - 1, so 4 disks = 15 moves)
5. Verify the output shows correct moves and final solved state (all disks on peg 3).

## Example Output
For 3 disks, expect 7 moves with disks moving from peg 1 to peg 3.
