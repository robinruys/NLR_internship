
x = 578;
y = 0;
z = 408;

l1 = 142;
l2 = 350;
l3 = 270;
l4 = 65;

phi = 0;
h1 = atan(y/x);
A = x - l4*cos(h1)*cos(phi);
B = y - l4*sin(h1)*cos(phi);
C = z-l1-l4*sin(phi);
h3 = acos((A^2+B^2+C^2-l2^2-l3^2)/(2*l2*l3));
h2 = atan2((z-l1-l4*sin(phi)),+sqrt((sqrt((l3*sin(h3))^2+(l2+l3*cos(h3))^2))^2-(z-l1-l4*sin(phi))^2))-atan2((l3*sin(h3)),(l2+l3*cos(h3)));
%a = (l3*sin(h3));
%b = (l2+l3*cos(h3));
%c = (z-l1-l4*sin(phi));
%r = (sqrt(a^2+b^2));
h4 = phi-h2-h3;


%simulatie part 
t = [
0 142 0 0.5*pi
0 0 350 0
0 0 270 0
0 0 65 0
];

L = SerialLink(t);
L.teach;
