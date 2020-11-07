function I= identify(n)
I=zeros(n);
for i=1:n
    I(i,i)=1;
end