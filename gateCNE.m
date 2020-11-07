function G1=gateCNE(n)
G1=identify(2^n);
for k=2^(n-2):(2^(n-1)-1)
    G1(2*k+1,2*k+2)=1;
    G1(2*k+2,2*k+1)=1;
    G1(2*k+1,2*k+1)=0;
    G1(2*k+2,2*k+2)=0;
end
