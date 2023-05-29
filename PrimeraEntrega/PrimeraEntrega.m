% Primera entrega

%Definiendo Variables constantes
N = 20; %Número de elementos de corriente
I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 0.5;

%Definiendo el espacio del campo 
spacex = -4:0.5:4;
spacey = -4:0.5:4;
spacez = -4:0.5:4;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
theta = 0:d_theta:(2*pi);
campo_Bx_total = zeros(size(X));
campo_By_total = zeros(size(Y));
campo_Bz_total = zeros(size(Z));
R = sqrt(((X-radio).^2+(Y-radio).^2+(Z).^2));
%un ciclo for por cada punto que este anidado con otro ciclo for por cada
%elemento de corriente
for i = 1:length(theta) %necesitamos un vector de posición para el aro
    ds = radio*theta(i);
    radio_dy = (ds.*X.*(theta(i))); %radio es ri'
    radio_dx = -(ds.*Y.*(theta(i)));
    ri_x = X - radio_dx;
    ri_y = Y - radio_dy;
    ri_z = Z;
    ri = sqrt((ri_x.^2)+(ri_y.^2)+(ri_z.^2));
    campo_Bx= (miu*I/4*pi) *((radio_dy.*ri_z)./ri.^3);
    campo_By= -(miu*I/4*pi) *((radio_dx.*ri_z)./ri.^3);
    campo_Bz= -(miu*I/4*pi) *((radio_dx.*ri_x - radio_dy.*ri_x)./ri.^3);
    campo_Bx_total = campo_Bx_total + campo_Bx;
    campo_By_total = campo_By_total + campo_By;
    campo_Bz_total = campo_Bz_total + campo_Bz;
end


%Graficamos el aro
x = radio * cos(theta);
y = radio * sin(theta);
z = zeros(size(theta));
% Graficar la circunferencia en 3D
figure;
plot3(x, y, z, 'b', 'LineWidth', 2);
hold on 
quiver3(X,Y,Z, campo_Bx_total, campo_By_total, campo_Bz_total)
