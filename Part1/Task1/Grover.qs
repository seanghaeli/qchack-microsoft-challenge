// namespace GroversTutorial {
//     open Microsoft.Quantum.Canon;
//     open Microsoft.Quantum.Intrinsic;
//     open Microsoft.Quantum.Measurement;
//     open Microsoft.Quantum.Math;
//     open Microsoft.Quantum.Convert;
//     open Microsoft.Quantum.Arithmetic;
//     open Microsoft.Quantum.Arrays;
//     open Microsoft.Quantum.Preparation;

//     operation MarkDivisor (
//     dividend : Int,
//     divisorRegister : Qubit[],
//     target : Qubit  
// ) : Unit is Adj + Ctl {
//     // Calculate the bit-size of the dividend.
//     let size = BitSizeI(dividend);
//     // Allocate two new qubit registers for the dividend and the result.
//     use dividendQubits = Qubit[size];
//     use resultQubits = Qubit[size];
//     // Create new LittleEndian instances from the registers to use DivideI
//     let xs = LittleEndian(dividendQubits);
//     let ys = LittleEndian(divisorRegister);
//     let result = LittleEndian(resultQubits);

//     // Start a within-apply statement to perform the operation.
//     within {
//         // Encode the dividend in the register.
//         ApplyXorInPlace(dividend, xs);
//         // Apply the division operation.
//         DivideI(xs, ys, result);
//         // Flip all the qubits from the remainder.
//         ApplyToEachA(X, xs!);
//     } apply {
//         // Apply a controlled NOT over the flipped remainder.
//         Controlled X(xs!, target);
//         floor// The target flips if and only if the remainder is 0.
//     }
// }