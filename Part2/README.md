# Matching Database Using Grover's Algorithm

The following repo contains a proposed matchmaking tool where given a set of inputs, it would return an output representing matched values from an unsorted database.

## Problem Overview

If P_k=C_k, we want output to flip. This can be represented by a CNOT (same as XOR) gate that then gets X’d.

This circuit checks whether P_k == C_k and stores the output to O_k. To check each clause, we repeat this circuit for each pairing in preference_list and store the output to a new bit.

