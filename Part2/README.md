# Matching Database Using Grover's Algorithm

The following repo contains a proposed matchmaking tool where given a set of inputs, it would return an output with values that are a perfect match from an unsorted database.

## Problem Overview

We construct an array of preferences that each user has. Such paramaters could include height, gender, eye color, and perhaps more subjective preferences such as lifestyle based on crowd-consensus. Each preference would have an associated rule. For example, the rule for height preference might be height>180cm. We can call our preferences and their associated rules our "preference_list".

What then occurs is that a potential matcher compares their own characteristics with the preferences of each user and sorts for alignment using Grover's Algorithm. Implementing this algorithm speeds up the searching process leading to faster matches from a larger unsorted database.

If P<sub>k</sub>=C<sub>k</sub>, we want the output to flip. This can be represented by a CNOT gate with an X gate following. Below is the code for this implementation:

<code>
inputs = Qubits[N]; // Array of N qubits, N being the number of preferences
output = Qubit(); // Single output qub
Controlled X(inputs, output);
ApplyToEachA(X, inputs);
</code>

This circuit checks whether P<sub>k</sub> == C<sub>k</sub> is satisfied and stores the result as a boolean value. After checking each clause, if all the pairings of the preferences match the characteristics, we have f(x) = 1 and store the output, |1⟩, to the output qubit.

### Create separate registers to name bits
<code>

preference_list = Qubits[N]; // Array of N qubits, N being the number of preferences

### Use XOR and X gate to check each clause
i = 0
for clause in clause_list{}
    XOR(clause[0], clause[1], clause_qubits[i]);
    Controlled X(inputs, output);
    i += 1;
}
</code>

The final state of the bits p1, p2, p3, p4 will only all be 1 in the case that there is a perfect match with the characteristics of the user such that P<sub>1</sub> == C<sub>1</sub>, P<sub>2</sub> == C<sub>2</sub>, ... P<sub>n</sub> == C<sub>n</sub> for n defined comparison attributes. At this point, we have defined the problem as a Grover Search, and since we are marking our output correctly, we can be confident that the Grover Search will give us a perfect match whenever one occurs at a faster rate than what could occur classically. 