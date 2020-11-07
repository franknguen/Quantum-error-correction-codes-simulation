function H = hadamard(n)
if n==1
    H=[1 1;1 -1]/sqrt(2);
else
    H=kron(hadamard(n-1),hadamard(1));
end