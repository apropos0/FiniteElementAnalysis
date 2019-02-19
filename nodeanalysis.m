Pt = input('Problem type=');
n = input('Number of Elements,n = ');
E = input('Elastic Modulus in row matrix, E = ');
A = input('Area in row matrix, A = ');
L = input('Length in a row matrix, L = ');
F = input('Nodal Forces in a row matrix, F = ');
i = 1;
while(1)
    k(i) = A(i)*E(i)/L(i);
    if i >= n, break, end
    i = i+1;
end
switch Pt
    case 1
        C = zeros(n,n);
        for i=1:n %Pre-Processing
            if i < n
                C(i,i+1) = -k(i+1);
                C(i,i) = k(i+1)+k(i);
                C(i+1,i) = -k(i+1);
            else
                C(i,i) = k(i);
            end
        end
        
           U = inv(C) * F;
            for i=1:n
                if i == 1
                    S(i) = (E(i)/L(i)) * U(i);
                else
                    S(i) = (E(i)/L(i)) * (U(i) - U(i-1));
                end
            end

            
    case 2
            C = zeros(n,n);
             for i=1:n-1 %Pre-Processing
            if i < n
                C(i,i+1) = -k(i+1);
                C(i,i) = k(i+1)+k(i);
                C(i+1,i) = -k(i+1);
            else
                C(i,i) = k(i)+k(i+1);
            end
        end
        U = inv(C) * F;
        for j=1:n
            if j == 1
                S(j) = (E(j) * U(j)/L(j));
            elseif(j>1 && j<n)
                S(j) = (E(i) * (U(j) - U(j-1)/L(j)));
            else
                S(j) = (E(j) * -U(j-1)/L(j)); 
            end
        end
end
