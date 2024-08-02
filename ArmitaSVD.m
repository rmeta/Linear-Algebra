%Armita Tehranchi 810898050
function [U,S,V]=ArmitaSVD(A)
[V1,D1]=eig(A*A');
[V2,D2]=eig(A'*A);


V1=flip(V1,2);
D1=flip(flip(D1,2));

V2=flip(V2,2);
D2=flip(flip(D2,2));

%normalizing
for i=1:size(V1,2)
    V1(:,i)=V1(:,i)./norm(V1(:,i),2);
end
for i=1:size(V2,2)
    V2(:,i)=V2(:,i)./norm(V2(:,i),2);
end

V=[];
U=[];
if size(D1,1)>=size(D2,1)
    U=V1;
    for i=1:size(D2,1)
        vi=1/sqrt(D1(i,i))*A'*U(:,i);
        V=[V,vi];
    end
    S=[sqrt(D2);zeros([size(D1,1)-size(D2,1),size(D2,1)])];
else
    V=V2;
    for i=1:size(D1,1)
        ui=1/sqrt(D2(i,i))*A*V(:,i);
        U=[U,ui];
    end
    S=[sqrt(D1),zeros([size(D1,1),size(D2,1)-size(D1,1)])];
end
end

