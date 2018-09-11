module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,            // Output intermediate complemented inputs
  output nB,
  output nAandnB,    // Single bit output, (~A)*(~B)
  output AorB,          // Output intermediate complemented inputs
  output nAorB,      // Single bit output, (~(A+B))
  output nAornB,     // Single bit output, (~A)+(~B)
  output AandB,         // Output intermediate complemented inputs
  output nAandB     // Single bit output, (~(A*B))
);

  wire nA;
  wire nB;
  wire AorB;
  wire AandB;

  not Ainv(nA, A);  		// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  or  orgate(AorB, A, B);  	// OR gate produces AorB from A and B
  and andgate(AandB, A, B);  	// AND gate produces AandB from A and B
  not inv(nAorB, AorB);		// Inverter is named inv, takes signal AorB as input and produces signal nAorB
  not inv(nAandB, AandB);	// Inverter is named inv, takes signal AandB as input and produces signal nAandB
  and andgate(nAandnB, nA, nB); // AND gate produces nAandnB from nA and nB
  or orgate(nAornB, nA, nB); 	// OR gate produces nAornB from nA and nB

endmodule

