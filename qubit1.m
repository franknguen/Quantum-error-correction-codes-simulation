function q=qubit1(n)
if n==1
    q=[0;1];
else
    q=kron(qubit1(n-1),qubit1(1));
end