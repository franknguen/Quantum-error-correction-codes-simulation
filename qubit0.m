function q=qubit0(n)
if n==1
    q=[1;0];
else
    q=kron(qubit0(n-1),qubit0(1));
end