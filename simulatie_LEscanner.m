%standaard MATLAB dingen
clc
close all
clear all

%Dit zijn X,y,z coordinaten, Deze worden ingevoerd in de kinematica. 
%Met de .plot functie kan de robot naar deze positie gesimuleerd worden.
x = -150;       %start = 685
y = 0;
z = 600;        %start = 142

l1 = 142;
l2 = 350;
l3 = 270;
l4 = 65;
phi = pi/2;

%Hier is de robotweergegeven met behulp van DH notatie's
base = [
0 142 0 0.5*pi
0 0 350 0
0 0 270 0
0 0 65  0 ];

L = SerialLink(base);       %De base wordt hier in robot L aangemaakt

L.teach;        %Met L.teach kan je de assen handmatig joggen

LEscanner = SerialLink(base); %Hier wordt de LEscanner robot aangemaakt met de robotbase
LEscanneralt = SerialLink(base);
LEscanner.name = 'LEscanner';

% De reverse kinematics staan hier in vergelijkingen
h1 = atan2(y,x);
A = x - (l4*cos(h1)*cos(phi));
B = y - l4*sin(h1)*cos(phi); 
C = z-l1-l4*sin(phi);
h3 = acos((A^2+B^2+C^2-l2^2-l3^2)/(2*l2*l3));
h2 = atan2((z-l1-l4*sin(phi)),+sqrt((sqrt((l3*sin(h3))^2+(l2+l3*cos(h3))^2))^2-(z-l1-l4*sin(phi))^2))-atan2((l3*sin(h3)),(l2+l3*cos(h3)));
h2alt = atan2((z-l1-l4*sin(phi)),-sqrt((sqrt((l3*sin(h3))^2+(l2+l3*cos(h3))^2))^2-(z-l1-l4*sin(phi))^2))-atan2((l3*sin(h3)),(l2+l3*cos(h3)));
h4 = phi-h2-h3;
h4alt = phi-h2alt-h3;
a_motor_1 = h1 /pi*180;
a_motor_2 = ((h2 /pi*180)-90);
a_motor_3 = h3 /pi*180;
a_motor_4 = h4 /pi*180; 



    a_motor_2alt = (h2alt /pi*180)-90; %De altanative kinematica, Dit is eigenlijk een andere manier om de eindpositie te bepalen
    a_motor_4alt = h4alt /pi*180; 
    
%Met deze functie x,y,z posities geplot worden. LETOP L.teach moet gecommit
%zijn om deze functies te gebruiken. Anders pakt hij die eindposities van
%L.teach

 % LEscanner.plot([h1,h2,h3,h4]);
 % LEscanner.plot([h1,h2alt,h3,h4alt]); 
  

