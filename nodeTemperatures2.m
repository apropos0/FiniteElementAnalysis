%LINEAR CONDUCTION TEMPS @BOTH ENDS KNOWN
n = input('Number of elements, n=');
A = input('Area in a Row, A=');
L = input('Length in a Row, L='); %In a row refers to in matrix row
KTh = input('KTh in a row, KTh=');
To = input('T0 =');
TN = input('TN=');
i=1;
while(1)
    k(i)= A(i)*KTh(i)/L(i);
    if i>=n, break, end
    i = i + 1;
end

%CREATION OF CONDENSED MATRIX
C = zeros(n-1,n-1);
Q = zeros(1, n-1);
for i=1:n-1
    if i<n-1
        C(i, i+1)= -k(i+1);
        C(i, i) = k(i) + k(i+1);
        C(i+1, i) = -k(i+1);
        Q(1, 1) = k(1)*To;
        C(n-1, n-1) = k(n-1) + k(n);
    else
        k(i, i) =k(i);
        Q(1, i) = k(n)*TN;
    end
end
disp(C)
T= inv(C)* Q'