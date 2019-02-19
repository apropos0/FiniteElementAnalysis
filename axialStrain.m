%Axial strain energy analysis
n = input('number of members, n= ');
F = input('F in a row matrix, F= ');
A = input('A in a row matrix, A= ');
L = input('L in a row matrix, L= ');
E = input('E in a row matrix, E= ');
U = 0;
i = 1;
while(1)
    U = U + (F(i)^2)*L(i)/(2*E(i)*A(i));
    if i>=n, break, end
    i = i + 1;
end
disp('Strain Energy')
disp(U)