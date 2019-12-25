tt = 0:2*pi/5:(2*pi-2*pi/5);

 t = [tt tt+pi/5];

% vert=[vert;cos(t),sin(t),a*sqrt(3)*ones(5,1)/2];
% h = sqrt(0.75*a^2-cos(pi/5)^2);
% vert = [0 0 -h;vert;0 0 a*sqrt(3)/2+h];

r=300;   %Õ‚Ω”‘≤∞Îæ
%a=r/sin(2*pi/5);
%a=4*r/sqrt(10+2*sqrt(5));
%t = [0,2*pi/5];
ua = 1/sin(2*pi/5) ;
a=r*ua;
Ri=r*(sqrt(4-ua^2)*ua/2);
vert=[a/(2*sin(pi/5))*cos(t'),a/(2*sin(pi/5))*sin(t'),[r*(2-ua^2)*ones(5,1)/2;-r*(2-ua^2)*ones(5,1)/2]];
vert=[0 0 r;vert;0 0 -r];

 fac = [1 2 3
1 3 4
1 4 5
1 5 6
1 6 2
2 3 7
2 6 11
2 7 11
3 7 8
3 4 8
4 8 9
4 5 9
5 9 10
5 6 10
6 10 11
7 8 12
8 9 12
9 10 12
10 11 12
7 11 12];
h = patch('faces',fac,'vertices',vert,'FaceColor','r','FaceAlpha',.8,'EdgeColor','w','LineWidth',3);
view(3);    %
%set(h,'FaceAlpha',0.5);    %
light('Posi',[100 100 100]);
lightangle(30,30);     %
lighting flat;    %
material metal;    %
axis equal;    %
hold on;
%xlabel('X'); ylabel('Y'); zlabel('Z');    %
axis off