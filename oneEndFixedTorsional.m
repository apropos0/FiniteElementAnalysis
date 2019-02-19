%FEA FOR TORSIONAL, ONE END FIXED (CASE 3)
n = input('Number of elements, n = ');
G = input('G = ');
di = input('di = ');
do = input('do = ');
L = input('L = ');
T = input('Nodal Torque, T = ');
i = 1;
while(1)
    J(i) = (pi/32)*(do(i)^4 - di(i)^4);
    k(i) = G(i)*J(i)/L(i);
    if i>= n 
        break 
        c(i,i) = k(i)+k(i+1);
    end
    i = i+1;
end
c = zeros(n,n);
for i = 1:n
    if i<n
        c(i,i+1) = -k(i+1);
        c(i+1,i) = -k(i+1);
    else
        c(i,i) = k(i);
    end
end
PHI = inv(c) * T;
disp('PHI')
disp([PHI])
for j=1:n
    if j==1
        S(j) = G(j)*do(j)/(2*L(j))*PHI(j);
    else
        S(j) = G(j)*do(j)/(2*L(j))*(PHI(j) - PHI(j-1));
    end
end
disp('Shear Stress')
disp([S])
