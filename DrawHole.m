function DrawHole(pod,Rad,ch)

dis=sqrt(Rad^2-ch^2);
 %hc=zeros(101,3);
 %for theta=0:2*pi/5:8*pi/5;
        theta=0;
        trans=[cos(theta),-sin(theta),0;
         sin(theta),cos(theta),0;
          0,0,1];
m=size(pod,1);
    for i=1:m
        k=0:2*pi/100:2*pi;
        hc(:,1)=ch*cos(k);
        hc(:,2)=ch*sin(k);
        hc(:,3)=0;
     
    cosin=dis*pod(i,:)/Rad;
    sigma=1e-2;
    if pod(i,3)>=0
    beta=-asin(pod(i,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=asin(pod(i,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    else
      beta=asin(pod(i,1)/Rad);
    if abs(cos(beta))>sigma
    alfa=-asin(pod(i,2)/(Rad*cos(beta)));
    else
        alfa=0;
    end
    end
    rotaX=[1,0,0;0,cos(alfa),sin(alfa);0,-sin(alfa),cos(alfa)];
    rotaY=[cos(beta),0,-sin(beta);0,1,0;sin(beta),0,cos(beta)];
    
    hc=(rotaX*rotaY*hc')';
    for j=1:101
        hc(j,:)=hc(j,:)+cosin;
    end
    
    hc=(trans*hc')';
   
    %plot3(hc(:,1),hc(:,2),hc(:,3),'b','LineWidth',2.5);
    fill3(hc(:,1),hc(:,2),hc(:,3),'g','FaceAlpha',1);
    
    axis equal;
    hold on;
    end
%  end
   % grid on;     
end
    
