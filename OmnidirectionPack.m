
[M,N]=size(Ring);
Rad=norm(Ring(1,:));

hc2=zeros(101,3);
hc=zeros(101,3);
 % holr=0.88*300*sqrt(2*(1-cos(0.0716/2)));
  
   holr=minc;
  
   
   dis=sqrt((Rad+50)^2-holr^2);
   dis2=sqrt(Rad^2-holr^2);
  
   
%    thet=pi/2;
%    rota=[cos(thet),0,-sin(thet);0,1,0;sin(thet),0,cos(thet)];
%    pod=(rota*coord1')';
%    podo=(rota*coord11')';
   
pod=Ring;
podo=Ring*(Rad+50)/Rad;

   [x,y,z]=sphere(400);
   
for m=1:M
    
    k=0:2*pi/100:2*pi;
        hc2(:,1)=holr*cos(k);
        hc2(:,2)=holr*sin(k);
        hc2(:,3)=0;
        
        hc(:,1)=holr*cos(k);
        hc(:,2)=holr*sin(k);
        hc(:,3)=0;
        
         
    sigma=1e-2;
    if pod(m,3)>=0
    beta=-asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    else
      beta=asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=-asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
        
    hc2=(rotaX*rotaY*hc2')';
    hc=(rotaX*rotaY*hc')';
   
    rad2=pod(m,:)*dis2/Rad;
    rad=podo(m,:)*dis/(Rad+50);
    hc2=hc2+rad2;
    hc=hc+rad;
   
    patch(hc2(:,1),hc2(:,2),hc2(:,3),'c');
    patch(hc(:,1),hc(:,2),hc(:,3),'r');
    hold on;
    cx=[hc(:,1)';hc2(:,1)'];
    cy=[hc(:,2)';hc2(:,2)'];
    cz=[hc(:,3)';hc2(:,3)'];
    
    surf(cx,cy,cz,'LineStyle','none','EdgeColor','none','Facecolor',[0 0.5 0.5]);
    
    hold on;
end 
surf(0.3*Rad*x,0.3*Rad*y,0.3*Rad*z,'EdgeColor','none','LineStyle','none','Facealpha',0.9,'Facecolor',[0 0.5 0.7]);
surf(0.6*Rad*x,0.6*Rad*y,0.6*Rad*z,'EdgeColor','none','LineStyle','none','Facealpha',0.7,'Facecolor',[0 0.5 0.5]);

ver2=cross(vert(4,:)-vert(3,:),vert(3,:)-vert(1,:));
ver2=ver2/norm(ver2);

    sigma=1e-2;
    if ver2(1,3)>=0
    beta=-asin(ver2(1,1));
    if abs(cos(beta))>sigma
    alfa=asin(ver2(1,2)/cos(beta));
    else
        alfa=0;
    end
    else
      beta=asin(ver2(1,1));
    if abs(cos(beta))>sigma
    alfa=-asin(ver2(1,2)/cos(beta));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
    
pod=-(rotaX*rotaY*Ring')';
podo=-(rotaX*rotaY*Ring')'*(Rad+50)/Rad;

trs=2*(Rad+60)*(vert(2,:)-vert(1,:))/norm(vert(2,:)-vert(1,:));

    
for m=1:M
    
    k=0:2*pi/100:2*pi;
        hc2(:,1)=holr*cos(k);
        hc2(:,2)=holr*sin(k);
        hc2(:,3)=0;
        
        hc(:,1)=holr*cos(k);
        hc(:,2)=holr*sin(k);
        hc(:,3)=0;
        
         
    sigma=1e-2;
    if pod(m,3)>=0
    beta=-asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    else
      beta=asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=-asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
        
    hc2=(rotaX*rotaY*hc2')';
    hc=(rotaX*rotaY*hc')';
   
    rad2=pod(m,:)*dis2/Rad;
    rad=podo(m,:)*dis/(Rad+50);
    
    hc2=hc2+rad2+trs;
    hc=hc+rad+trs;
    
    patch(hc2(:,1),hc2(:,2),hc2(:,3),'c');
    patch(hc(:,1),hc(:,2),hc(:,3),'g');
    hold on;
    cx=[hc(:,1)';hc2(:,1)'];
    cy=[hc(:,2)';hc2(:,2)'];
    cz=[hc(:,3)';hc2(:,3)'];
    
    surf(cx,cy,cz,'LineStyle','none','EdgeColor','none','Facecolor',[0 0.5 0.5]);
    
    hold on;
end 
surf(0.3*Rad*x+trs(1,1),0.3*Rad*y+trs(1,2),0.3*Rad*z+trs(1,3),'EdgeColor','none','LineStyle','none','Facealpha',0.9,'Facecolor',[0 0.5 0.7]);
surf(0.6*Rad*x+trs(1,1),0.6*Rad*y+trs(1,2),0.6*Rad*z+trs(1,3),'EdgeColor','none','LineStyle','none','Facealpha',0.7,'Facecolor',[0 0.5 0.5]);

ver3=cross(vert(4,:)-vert(2,:),vert(1,:)-vert(4,:));
ver3=ver3/norm(ver3);

    sigma=1e-2;
    if ver3(1,3)>=0
    beta=-asin(ver3(1,1));
    if abs(cos(beta))>sigma
    alfa=asin(ver3(1,2)/cos(beta));
    else
        alfa=0;
    end
    else
      beta=asin(ver3(1,1));
    if abs(cos(beta))>sigma
    alfa=-asin(ver3(1,2)/cos(beta));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
    
pod=-(rotaX*rotaY*Ring')';
podo=-(rotaX*rotaY*Ring')'*(Rad+50)/Rad;

trs=2*(Rad+60)*(vert(3,:)-vert(1,:))/norm(vert(3,:)-vert(1,:));

    
for m=1:M
    
    k=0:2*pi/100:2*pi;
        hc2(:,1)=holr*cos(k);
        hc2(:,2)=holr*sin(k);
        hc2(:,3)=0;
        
        hc(:,1)=holr*cos(k);
        hc(:,2)=holr*sin(k);
        hc(:,3)=0;
        
         
    sigma=1e-2;
    if pod(m,3)>=0
    beta=-asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    else
      beta=asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=-asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
        
    hc2=(rotaX*rotaY*hc2')';
    hc=(rotaX*rotaY*hc')';
   
    rad2=pod(m,:)*dis2/Rad;
    rad=podo(m,:)*dis/(Rad+50);
    
    hc2=hc2+rad2+trs;
    hc=hc+rad+trs;
    
    patch(hc2(:,1),hc2(:,2),hc2(:,3),'c');
    patch(hc(:,1),hc(:,2),hc(:,3),'b');
    hold on;
    cx=[hc(:,1)';hc2(:,1)'];
    cy=[hc(:,2)';hc2(:,2)'];
    cz=[hc(:,3)';hc2(:,3)'];
    
    surf(cx,cy,cz,'LineStyle','none','EdgeColor','none','Facecolor',[0 0.5 0.5]);
    
    hold on;
end 
surf(0.3*Rad*x+trs(1,1),0.3*Rad*y+trs(1,2),0.3*Rad*z+trs(1,3),'EdgeColor','none','LineStyle','none','Facealpha',0.9,'Facecolor',[0 0.5 0.7]);
surf(0.6*Rad*x+trs(1,1),0.6*Rad*y+trs(1,2),0.6*Rad*z+trs(1,3),'EdgeColor','none','LineStyle','none','Facealpha',0.7,'Facecolor',[0 0.5 0.5]);

ver4=cross(vert(2,:)-vert(3,:),vert(3,:)-vert(1,:));
ver4=ver4/norm(ver4);

    sigma=1e-2;
    if ver4(1,3)>=0
    beta=-asin(ver4(1,1));
    if abs(cos(beta))>sigma
    alfa=asin(ver4(1,2)/cos(beta));
    else
        alfa=0;
    end
    else
      beta=asin(ver4(1,1));
    if abs(cos(beta))>sigma
    alfa=-asin(ver4(1,2)/cos(beta));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
    
pod=-(rotaX*rotaY*Ring')';
podo=-(rotaX*rotaY*Ring')'*(Rad+50)/Rad;

trs=2*(Rad+60)*(vert(4,:)-vert(1,:))/norm(vert(4,:)-vert(1,:));

    
for m=1:M
    
    k=0:2*pi/100:2*pi;
        hc2(:,1)=holr*cos(k);
        hc2(:,2)=holr*sin(k);
        hc2(:,3)=0;
        
        hc(:,1)=holr*cos(k);
        hc(:,2)=holr*sin(k);
        hc(:,3)=0;
        
         
    sigma=1e-2;
    if pod(m,3)>=0
    beta=-asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    else
      beta=asin(pod(m,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=-asin(pod(m,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
        
    hc2=(rotaX*rotaY*hc2')';
    hc=(rotaX*rotaY*hc')';
   
    rad2=pod(m,:)*dis2/Rad;
    rad=podo(m,:)*dis/(Rad+50);
    
    hc2=hc2+rad2+trs;
    hc=hc+rad+trs;
    
    patch(hc2(:,1),hc2(:,2),hc2(:,3),'c');
    patch(hc(:,1),hc(:,2),hc(:,3),'m');
    hold on;
    cx=[hc(:,1)';hc2(:,1)'];
    cy=[hc(:,2)';hc2(:,2)'];
    cz=[hc(:,3)';hc2(:,3)'];
    
    surf(cx,cy,cz,'LineStyle','none','EdgeColor','none','Facecolor',[0 0.5 0.5]);
    
    hold on;
end 
surf(0.3*Rad*x+trs(1,1),0.3*Rad*y+trs(1,2),0.3*Rad*z+trs(1,3),'EdgeColor','none','LineStyle','none','Facealpha',0.9,'Facecolor',[0 0.5 0.7]);
surf(0.6*Rad*x+trs(1,1),0.6*Rad*y+trs(1,2),0.6*Rad*z+trs(1,3),'EdgeColor','none','LineStyle','none','Facealpha',0.7,'Facecolor',[0 0.5 0.5]);

view([45 -45 180]);   
axis equal; 

light('Posi',[10000 10000 10000]);
lightangle(45,45);     
lighting phong;    
material dull;    
% axis equal;    
axis off;