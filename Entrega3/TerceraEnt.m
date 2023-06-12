%Tercera entrega
close all;
%Definiendo Variables constantes
N = 1000; %Número de elementos de corriente
I = 100; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 10; %radio del aro
mi=0.3; % Momento MAgnético
masa = 100;
gravedad = 9.81;

%Parámetros de ejecución
f=@(t,z) (3*mi*miu*radio^2*I/2*masa)*(z/(radio^2 + z^2)^(5/2))-gravedad;
a=0; % Límite inferior del tiempo
b=500; %Límite superior del tiempo
y0= 400; %Z inicial
h=0.5; %Delta de tiempo

rk4(f,a,b,y0,h)
