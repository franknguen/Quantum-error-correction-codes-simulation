clear;
clc;
%Creat GATE:
fprintf('Running...\n');
gate2CN=[ 1 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0;
        0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 0 1;
        0 0 0 0 0 0 1 0;
        0 0 0 0 0 1 0 0;
        0 0 0 0 1 0 0 0];
%Correct Gate:
gate2CT=[ 1 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0;
        0 0 0 0 0 0 0 1;
        0 0 0 0 1 0 0 0;
        0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 1 0;
        0 0 0 1 0 0 0 0;
        ];
H=hadamard(3);
%-----------------------
%Creat ERRORS:
Zgate=[ 1 0;
        0 -1];    
Error0=eye(2^3);
    
Error1=kron(Zgate,eye(2));
Error1=kron(Error1,eye(2));

Error2=kron(eye(2),Zgate);
Error2=kron(Error2,eye(2));

Error3=kron(eye(2),eye(2));
Error3=kron(Error3,Zgate);
%-----------------------
%Setup qubit input:
q_zero=qubit0(1);
q_one=qubit1(1);
q1=(3/5)*q_zero+(4/5)*q_one;
q2=qubit0(2);
%-----------------------
%Init
Phi1=kron(q1,q2);
Phi2=gate2CN*Phi1;
Phi3=H*Phi2;
%Applying Error
Phi4=Error3*Phi3;
%-------------
Phi5=H*Phi4;
%Decode
Phi6=gate2CN*Phi5;
Phi7=gate2CT*Phi6;
%-------------
final=[];
[m,n]=size(Phi7);
for i=1:m
    %if Phi7(i,n) ~= 0
    if Phi7(i,n) >= eps
        final=[final Phi7(i,n)];
    end
end
fprintf('Finished!\n');
