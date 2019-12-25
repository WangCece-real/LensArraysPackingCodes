r=100;   %Radius of the sphere
a= 2*r/(sqrt(3)/2+2*sqrt(0.75-0.25*cot(pi/5)^2));  %chord length of the circumscribed polygon
t = [0,2*pi/5];
h = sqrt(0.75-0.25*cot(pi/5)^2)*a;
vert=[a/(2*sin(pi/5))*cos(t'),a/(2*sin(pi/5))*sin(t'),a*sqrt(3)*ones(2,1)/4];
vert=[0 0 h+a*sqrt(3)/4;vert];
poin=zeros(55,3);
poin(1,:)=vert(1,:);
stepx=(vert(2,:)-vert(1,:))/9;
stepy=(vert(3,:)-vert(2,:))/9;
k=1;
for i=1:9;
         k=k+1;
    poin(k,:)=poin(k-i,:)+stepx;
    
    for j=1:i;
        k=k+1;
        poin(k,:)=poin(k-1,:)+stepy;
       
    end
end
xp=sqrt(r^2./(1+(poin(:,2)./poin(:,1)).^2+(poin(:,3)./poin(:,1)).^2));
yp=poin(:,2)./poin(:,1).*xp;
zp=poin(:,3)./poin(:,1).*xp;
spoin=[xp';yp';zp']';
spoin(1,1)=0;
spoin(1,2)=0;
spoin(1,3)=r;

%scatter3(poin(:,1),poin(:,2),poin(:,3));
%hold on;
scatter3(spoin(:,1),spoin(:,2),spoin(:,3));
hold on;

x=vert(3,:)/9-(vert(2,:)+vert(1,:))/18;
y=vert(2,:)/9-(vert(1,:)+vert(3,:))/18;
z=vert(1,:)/9-(vert(3,:)+vert(2,:))/18;

opoin=poin+opdi(:,1)*x+opdi(:,2)*y+opdi(:,3)*z;

oxp=sqrt(r^2./(1+(opoin(:,2)./opoin(:,1)).^2+(opoin(:,3)./opoin(:,1)).^2));
oyp=opoin(:,2)./opoin(:,1).*oxp;
ozp=opoin(:,3)./opoin(:,1).*oxp;
ospoin=[oxp';oyp';ozp']';
ospoin(1,1)=0;
ospoin(1,2)=0;
ospoin(1,3)=r;

%scatter3(opoin(:,1),opoin(:,2),opoin(:,3),'filled','r');
%hold on;
scatter3(ospoin(:,1),ospoin(:,2),ospoin(:,3),'filled','r');

%AÃæµã×ø±ê
Asp=zeros(45,2);
n=0;
m=0;
for i=1:9
    n=n+2;
    m=m+1;
    Asp(m,1)=ospoin(n,1);
    Asp(m,2)=ospoin(n,2);
    for j=1:i-1
        m=m+1;
        n=n+1;
        Asp(m,1)=ospoin(n,1);
        Asp(m,2)=ospoin(n,2);
    end
end
Asp
    









