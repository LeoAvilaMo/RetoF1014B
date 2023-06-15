% Primera entrega
close all;
%Definiendo Variables constantes
N = 1000; %Número de elementos de corriente
I = 100; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 1; %radio del aro

%Definiendo el espacio del campo 
spacex = linspace(-3, 3, 15);
spacey = linspace(-3, 3, 15);
spacez = linspace(-3, 3, 15);
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
theta = 0:d_theta:((2*pi));
Bx_total = zeros(length(spacex), length(spacey), length(spacez));
By_total = zeros(length(spacex), length(spacey), length(spacez));
Bz_total = zeros(length(spacex), length(spacey), length(spacez));
R = sqrt(((X).^2+(Y).^2+(Z).^2));
cte=(miu*I)/(4*pi);

for i = 1:length(theta) %ciclo for que vaya por cada elemento de corriente en el aro
    radio_dy = radio*sin(theta(i)); %vector en x del radio X.*theta(i)
    radio_dx = radio*cos(theta(i)); %vector en y del radio
    rx=-d_theta*radio_dy;
    ry=d_theta*radio_dx;
    ri_x = X - radio_dx; %vector del punto en el espacio menos el vector del radio en x
    ri_y = Y - radio_dy; %vector del punto en el espacio menos el vector del radio en y
    ri_z = Z; %vector del punto en el espacio menos el vector del radio en z
    ri = sqrt((ri_x.^2)+(ri_y.^2)+(ri_z.^2)); %magnitud de los vectores anteriores
    Bx= (cte *((ry.*ri_z))./(ri.^3)); %se obtiene cada campo en x,y y z
    By= -(cte *((rx.*ri_z))./(ri.^3));
    Bz= (cte*(((rx.*ri_y) - (ry.*ri_x)))./(ri.^3));
    Bx_total = Bx_total + Bx; %se actualia las variables para ser sumadas en cada ciclo
    By_total = By_total + By;
    Bz_total = Bz_total + Bz;
end


%Graficamos el aro
x = radio * cos(theta);
y = radio * sin(theta);
z = zeros(size(theta));
% Graficar la circunferencia en 3D
figure;
plot3(x, y, z, 'b', 'LineWidth', 2);
hold on 
%se gráfican los campos
quiver3(X,Y,Z, Bx_total, By_total, Bz_total,"filled")
hold off

figure;
i= [-radio radio];
j = [0 0];
col =[204, 41, 54]/255;
lx = length(spacex);
origen = round((lx/2));
By1 = squeeze(By_total(:,origen,:));
Bz1 = squeeze(Bz_total(:,origen,:));
plot(i,j,'Color', col,'LineWidth',2);
streamslice(spacex,spacez,By1',Bz1');
legend("aro en yz")
title("Campo magnético de un anillo",'FontSize',11)


