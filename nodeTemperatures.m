%TEMP @ONE END & HEAT @ THE OTHER END
n = input('Number of elements, n=');
A = input('Area in a Row, A=');
L = input('Length in a Row, L='); %In a row refers to in matrix row
KTh = input('KTh in a row, KTh=');
To = input('T0 =');
QN = input('QN=');
i=1;
while(1)
    K(i)= A(i)*KTh(i)/L(i);
    if i>=n, break, end
    i = i + 1;
end

%CREATION OF CONDENSED MATRIX
C = zeros(n,n);
Q = zeros(1, n);
for i=1:n;
    if i<n
        C(i, i+1)=-K(i+1);
        C(i, i) = K(i) + K(i+1);
        C(i+1, i) = -K(i+1);
        Q(1, 1) = K(1)*To;
    else
        K(i, i) =K(i);
        Q(1, i) = QN;
    end
end

T= inv(K)*Q'