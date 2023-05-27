% Primera entrega

%Definiendo Variables constantes
N = 40; %Número de elementos de corriente
I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 2;

%Definiendo el espacio del campo 
spacex = -10:2:10;
spacey = -10:2:10;
spacez = -10:2:10;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
circunferencia = 2*pi*radio;
d_cir =  0:d_theta:circunferencia;
theta = 0:d_theta:(2*pi);
centro_aro = [0,0,0];
%campo_Bx;
%campo_By;
%campo_Bz;

%un ciclo for por cada punto que este anidado con otro ciclo for por cada
%elemento de corriente
for i = 1:length(theta) %necesitamos un vector de posición para el aro
    R = sqrt(((X).^2+(Y).^2+(Z).^2));
    ds = radio*theta(i);
    radio_dy = (ds*cos((theta(i)))); %radio es ri'
    radio_dx = -(ds.*sin((theta(i))));
    ri_x = X - radio_dx;
    ri_y = Y - radio_dy;
    ri_z = Z;
    ri = sqrt((ri_x.^2)+(ri_y.^2)+(ri_z.^2));
end

    campo_Bx= (miu*I/4*pi) *((radio_dy.*ri_z)./ri.^3);
    campo_By= -(miu*I/4*pi) *((radio_dx.*ri_z)./ri.^3);
    campo_Bz= -(miu*I/4*pi) *((radio_dx.*ri_x - radio_dy.*ri_x)./ri.^3);
figure;
%Graficamos el aro
x = radio * cos(theta);
y = radio * sin(theta);
z = zeros(size(theta));
% Graficar la circunferencia en 3D
plot3(x, y, z, 'b', 'LineWidth', 2);
hold on 
quiver3(X,Y,Z,campo_Bx,campo_By,campo_Bz)
