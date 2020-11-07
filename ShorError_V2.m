clear;
clc;
fprintf('Running...\n');
%Creat GATE:
gate2CN=[ 1 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0;
        0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 0 1;
        0 0 0 0 0 0 1 0;
        0 0 0 0 0 1 0 0;
        0 0 0 0 1 0 0 0];
gate2CT=[ 1 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0;
        0 0 0 0 0 0 0 1;
        0 0 0 0 1 0 0 0;
        0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 1 0;
        0 0 0 1 0 0 0 0;
        ];
%-----------------------
gate1=kron(gateCNE(4),identify(2^5));
gate2=kron(gateCNE(7),identify(2^2));
H=hadamard(1);
tem1=kron(H,identify(2^2));
tem2=kron(tem1,tem1);
gate3=kron(tem2,tem1);
tem1=kron(gate2CN,gate2CN);
gate4=kron(tem1,gate2CN);
gate5=gate4;
tem=kron(gate2CT,gate2CT);
gate6=kron(tem,gate2CT);
gate7=gate3;
gate8=gate2;
gate9=gate1;
gate10=kron(gate2CTE,eye(2^2));
%-----------------------
%Creat ERRORS:
Ygate=[0 -i;
       i 0];
Error0=eye(2^9);

Error1=kron(-i*Ygate,eye(2^8));

tem=kron(eye(2^1),-i*Ygate);
Error2=kron(tem,eye(2^7));

tem=kron(eye(2^2),-i*Ygate);
Error3=kron(tem,eye(2^6));

tem=kron(eye(2^3),-i*Ygate);
Error4=kron(tem,eye(2^5));

tem=kron(eye(2^4),-i*Ygate);
Error5=kron(tem,eye(2^4));

tem=kron(eye(2^5),-i*Ygate);
Error6=kron(tem,eye(2^3));

tem=kron(eye(2^6),-i*Ygate);
Error7=kron(tem,eye(2^2));

tem=kron(eye(2^7),-i*Ygate);
Error8=kron(tem,eye(2^1));

Error9=kron(eye(2^8),-i*Ygate);
%-----------------------
%Setup qubit input:
q_zero=qubit0(1);
q_one=qubit1(1);
q1=(3/5)*q_zero+(4/5)*q_one;
q2=qubit0(8);
%-----------------------
%Init
Phi1=kron(q1,q2);
Phi2=gate1*Phi1;
Phi3=gate2*Phi2;
Phi4=gate3*Phi3;
Phi5=gate4*Phi4;
%Applying Error
Phi6=Error0*Phi5;
%-----------------------
Phi7=gate5*Phi6;
Phi8=gate6*Phi7;
Phi9=gate7*Phi8;
Phi10=gate8*Phi9;
Phi11=gate9*Phi10;
Phi12=gate10*Phi11;

%-----------------------
final=[];
[m,n]=size(Phi12);
for i=1:m
    %if Phi7(i,n) ~= 0
    if Phi12(i,n) >= eps
        final=[final;Phi12(i,n)];
    end
end
fprintf('Finished!\n');