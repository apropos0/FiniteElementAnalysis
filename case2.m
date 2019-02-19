NS = input('number of sections, NS= ');
%NS = 1(only one section); NS=2(Problems with 2 sections);

switch NS
case 1
    a1 = input('Lower limit, a= ');
    b1 = input('Lower limit, b= ');
    n1 = input('Number of interval, n1= ');
    h1 = (b1 - a1)/n1;
    x1 = a1:h1:b1;
    SFM = input('square of 1st moment, SFM= ');
    U = (1/(2*E*I)) * (TRAPEI(SFM, n1, h1));
    
    
case 2
    a1 = input('Lower limit, a1= ');
    b1 = input('Lower limit, b1= ');
    n1 = input('Number of interval, n1= ');
    a2 = input('Lower limit, a2= ');
    b2 = input('Lower limit, b2= ');
    n2 = input('Number of interval, n2= ');
    h1 = (b1 - a1)/n1;
    h2 = (b2 - a2)/n2;
    x1 = a1:h1:b1;
    x2 = a2:h2:b2;
    SFM = input('square of 1st moment, SFM= ');
    SSM = input('square of 2nd moment, SSM= ');
    U = (1/(2*E*I)) * (TRAPEI(SFM, n1, h1)+(TRAPEI(SSM, n2, h2)));
end