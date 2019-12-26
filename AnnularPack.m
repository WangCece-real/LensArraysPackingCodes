%clear all;
r=500;   %Íâ½ÓÔ²°ë¾
%a=r/sin(2*pi/5);
%a=4*r/sqrt(10+2*sqrt(5));
t = [pi/2,pi/2+2*pi/5];
ua = 1/sin(2*pi/5) ;
a=r*ua;
h=r*(1-(2-ua^2)/2);
Ri=r*(sqrt(4-ua^2)*ua/2);
vert=[a/(2*sin(pi/5))*cos(t'),a/(2*sin(pi/5))*sin(t'),r*(2-ua^2)*ones(2,1)/2];
vert=[0 0 r;vert];

poin=zeros(45,3);
poin(1,:)=vert(1,:);
stepx=(vert(2,:)-vert(1,:))/8;
stepy=(vert(3,:)-vert(2,:))/8;
k=1;
for i=1:8;
         k=k+1;
    poin(k,:)=poin(k-i,:)+stepx;
    
    for j=1:i;
        k=k+1;
        poin(k,:)=poin(k-1,:)+stepy;
       
    end
end
yp=sqrt(r^2./(1+(poin(:,1)./poin(:,2)).^2+(poin(:,3)./poin(:,2)).^2));
xp=poin(:,1)./poin(:,2).*yp;
zp=poin(:,3)./poin(:,2).*yp;
spoin=[xp';yp';zp']';
spoin(1,1)=0;
spoin(1,2)=0;
spoin(1,3)=r;
%figure(1);
% scatter3(poin(:,1),poin(:,2),poin(:,3));
% hold on;
% scatter3(spoin(:,1),spoin(:,2),spoin(:,3));
%hold on;


x=vert(3,:)/8-(vert(2,:)+vert(1,:))/16;
y=vert(2,:)/8-(vert(1,:)+vert(3,:))/16;
z=vert(1,:)/8-(vert(3,:)+vert(2,:))/16;

otric=zeros(45,3);
%tric=zeros(45,3);
opdi=zeros(45,3);
chol=zeros(1,45);
otric(1,:)=[0 0 8];
stepi=[0 1 -1];
stepj=[1 -1 0];
k=1;
for i=1:8;
         k=k+1;
    otric(k,:)=otric(k-i,:)+stepi;
    
    for j=1:i;
        k=k+1;
        otric(k,:)=otric(k-1,:)+stepj;
       
    end
end
tric=otric/8;

cratio2=0.37;
minc2=20*r/500;
jj=0;
trend=zeros(1,11);
for A2=0.134:0.0001:0.135
 %A2=0; 
 jj=jj+1;
 tric1=tric-A2*tric.^2;
  for i=1:45
opdi(i,1)=8*tric1(i,1)/sum(tric1(i,:));
opdi(i,2)=8*tric1(i,2)/sum(tric1(i,:));
opdi(i,3)=8*tric1(i,3)/sum(tric1(i,:));
  end
  
  opdi=opdi-otric;
  

opoin=poin+opdi(:,1)*x+opdi(:,2)*y+opdi(:,3)*z;

oyp=sqrt(r^2./(1+(opoin(:,1)./opoin(:,2)).^2+(opoin(:,3)./opoin(:,2)).^2));
oxp=opoin(:,1)./opoin(:,2).*oyp;
ozp=opoin(:,3)./opoin(:,2).*oyp;
ospoin=[oxp';oyp';ozp']';
ospoin(1,1)=0;
ospoin(1,2)=0;
ospoin(1,3)=r;

%scatter3(opoin(:,1),opoin(:,2),opoin(:,3),'filled','r');
%hold on;
 

k=0;
n=0;
for i=1:8
    n=n+1;
   for j=1:i
    k=k+1;
    n=n+1;
    chol(k)=sum((ospoin(n+1,:)-ospoin(n,:)).^2);
   end
end
minc=chol(1);
for i=2:1:36
    if minc>chol(i)
        minc=chol(i);
    end
end
maxc=chol(1);
for i=2:1:36
    if maxc<chol(i)
        maxc=chol(i);
    end
end
minc=sqrt(minc)/2;
trend(1,jj)=minc;
maxc=sqrt(maxc)/2;

cratio1=(maxc-minc)/minc;
 if cratio1<cratio2
     cratio2=cratio1;
     continue
% % if minc>minc2
% %      minc2=minc;
% %      continue
 else
     A2=A2-0.0001;
    break
 end
    
 end

% plot(trend);

tric1=tric-A2*tric.^2;
  for i=1:45
opdi(i,1)=8*tric1(i,1)/sum(tric1(i,:));
opdi(i,2)=8*tric1(i,2)/sum(tric1(i,:));
opdi(i,3)=8*tric1(i,3)/sum(tric1(i,:));
  end
  
  opdi=opdi-otric;
  

opoin=poin+opdi(:,1)*x+opdi(:,2)*y+opdi(:,3)*z;

oyp=sqrt(r^2./(1+(opoin(:,1)./opoin(:,2)).^2+(opoin(:,3)./opoin(:,2)).^2));
oxp=opoin(:,1)./opoin(:,2).*oyp;
ozp=opoin(:,3)./opoin(:,2).*oyp;
ospoin=[oxp';oyp';ozp']';
ospoin(1,1)=0;
ospoin(1,2)=0;
ospoin(1,3)=r;

% for theta=0:2*pi/5:8*pi/5;
%        % theta=0;
%         trans=[cos(theta),-sin(theta),0;
%          sin(theta),cos(theta),0;
%           0,0,1];
%       ospoinf=(trans*ospoin')';
% scatter3(ospoinf(:,1),ospoinf(:,2),ospoinf(:,3),'filled','r');
% hold on;
%  end


k=0;
n=0;
mip=1;
map=1;
for i=1:8
    n=n+1;
   for j=1:i
    k=k+1;
    n=n+1;
    chol(k)=sum((ospoin(n+1,:)-ospoin(n,:)).^2);
   end
end
minc=chol(1);
for i=2:1:36
    if minc>chol(i)
        minc=chol(i);
        mip=i;
    end
end
maxc=chol(1);
for i=2:1:36
    if maxc<chol(i)
        maxc=chol(i);
        map=i;
    end
end
minc=sqrt(minc)/2
maxc=sqrt(maxc)/2
thetani=2*asin(maxc/r);

cratio1=(maxc-minc)/minc;
holeR=sqrt((r-sqrt(r^2-minc^2))^2+minc^2);


%scatter3(spoin(:,1),spoin(:,2),spoin(:,3));
%hold on;
%scatter3(ospoin(:,1),ospoin(:,2),ospoin(:,3),'r');
%hold on;
 A2
 cratio1
 mip;
 map;
 
%%%%%%%%%%%%%%¶Ô¸÷¸ö×ø±êµã½øÐÐ±àºÅ%%%%%%%%%%%%%%%
%¹²·ÖÎªA,B,C,D,EÎå¸öÃæ
%AÃæµã×ø±ê
Asp=zeros(36,3);
n=0;
m=0;
for i=1:8
    n=n+2;
    m=m+1;
    Asp(m,:)=ospoin(n,:);
    
    for j=1:i-1
        m=m+1;
        n=n+1;
        Asp(m,:)=ospoin(n,:);
       
    end
end
Asp;


theta=2*pi/5;    %AÃæÐý×ªµÃµ½ÆäËü¸÷ÃæµÄµã×ø±ê
trans=[cos(theta),-sin(theta),0;
    sin(theta),cos(theta),0;
    0,0,1];


%BÃæµã×ø±ê
Bsp=zeros(36,3);
for i=1:36
    Bsp(i,:)=(trans*Asp(i,:)')';
end
Bsp;

%CÃæµã×ø±ê
Csp=zeros(36,3);
for i=1:36
    Csp(i,:)=(trans*Bsp(i,:)')';
end
Csp;

%DÃæµã×ø±ê
Dsp=zeros(36,3);
for i=1:36
    Dsp(i,:)=(trans*Csp(i,:)')';
end
Dsp;

%EÃæµã×ø±ê
Esp=zeros(36,3);
for i=1:36
    Esp(i,:)=(trans*Dsp(i,:)')';
end
Crosp=[0 0 500;Asp;Bsp;Csp;Dsp;Esp];

ca=1-1/(2*sin(2*pi/5)^2);
sa=sqrt(1-ca^2);
RotaZ=[cos(pi/5),sin(pi/5),0;-sin(pi/5),cos(pi/5),0;0,0,1];
RotaX=[1 0 0;0 ca sa;0 -sa ca];
CropR=(RotaX*RotaZ*Crosp')';

AsR=(RotaX*RotaZ*Asp')';
BsR=(RotaX*RotaZ*Bsp')';
CsR=(RotaX*RotaZ*Csp')';
DsR=(RotaX*RotaZ*Dsp')';

Abelt=[BsR(1,:);BsR(3,:);BsR(6,:);BsR(10,:);BsR(15,:);BsR(21,:);BsR(28,:);BsR(36,:);...
    CsR(1,:);CsR(2,:);CsR(3,:);CsR(4,:);CsR(5,:);CsR(7,:);CsR(8,:);CsR(11,:);CsR(12,:);CsR(16,:);...
    CsR(17,:);CsR(22,:);CsR(23,:);CsR(29,:);CsR(30,:)];
 Abelt=[Abelt;AsR(3,:);BsR(2,:);BsR(5,:);BsR(9,:);BsR(14,:);BsR(20,:);BsR(27,:);BsR(35,:);...
     DsR(2,:);CsR(6,:);CsR(9,:);CsR(13,:);CsR(18,:);CsR(24,:);CsR(31,:)];

Bbelt=(trans*Abelt')';
Cbelt=(trans*Bbelt')';
Dbelt=(trans*Cbelt')';
Ebelt=(trans*Dbelt')';

Ring=[Abelt;Bbelt;Cbelt;Dbelt;Ebelt];




figure(1)
DrawHole(Ring,r,holeR);
%ImagePack(ospoin,r,holeR);

%Hexmount(Asp,r,holeR);
%Flatpack(poin,r);
%figure(1)
%MicroCamepack(Asp,opoin,r,holeR);
%FOVpack(Asp,opoin,r,holeR);
axis off;

 