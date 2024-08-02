%Armita Tehranchi 810898050
function y=compress(x,k)
[U,S,V]=ArmitaSVD(x);
m1=size(U,1);n1=size(V,1);
m2=fix(m1*k/100);n2=fix(n1*k/100);
y=U(:,1:m2) * S(1:m2,1:n2) * V(:,1:n2)';
end

