% Segunda entrega
clc;
close all;
%Definiendo Variables constantes
N = 1000; %Número de elementos de corriente
I = 100; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 1; %radio del aro
num = 5; %numero de aros
d = 0.5; %distancia entre aros
meshgrid_size=5; %valor que puede ser modificado por el usuario, 
%debe de estar de acuerdo a la distancia que recorren las espiras

%Definiendo el espacio del campo 
spacex = linspace(-meshgrid_size, meshgrid_size, 30);
spacey = linspace(-meshgrid_size,meshgrid_size, 30);
spacez = linspace(-meshgrid_size, meshgrid_size,30);
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
theta = 0:d_theta:((2*pi));
Bx_total = zeros(length(spacex), length(spacey), length(spacez));
By_total = zeros(length(spacex), length(spacey), length(spacez));
Bz_total = zeros(length(spacex), length(spacey), length(spacez));
R = sqrt(((X).^2+(Y).^2+(Z).^2));
cte=(miu*I)/(4*pi);
%crear vector de posición en z de los aros
aros = linspace(-((num-1)*d)/2, ((num-1)*d)/2, num);

for j = 1:length(aros)
    for i = 1:length(theta) %ciclo for que vaya por cada elemento de corriente en el aro
        radio_dy = radio*sin(theta(i)); %vector en x del radio X.*theta(i)
        radio_dx = radio*cos(theta(i)); %vector en y del radio
        rx=-d_theta*radio_dy;
        ry=d_theta*radio_dx;
        ri_x = X - radio_dx; %vector del punto en el espacio menos el vector del radio en x
        ri_y = Y - radio_dy; %vector del punto en el espacio menos el vector del radio en y
        ri_z = Z - aros(j); %vector del punto en el espacio menos el vector del radio en z
        ri = sqrt((ri_x.^2)+(ri_y.^2)+(ri_z.^2)); %magnitud de los vectores anteriores
        Bx= (cte *((ry.*ri_z))./(ri.^3)); %se obtiene cada campo en x,y y z
        By= -(cte *((rx.*ri_z))./(ri.^3));
        Bz= (cte*(((rx.*ri_y) - (ry.*ri_x)))./(ri.^3));
        Bx_total = Bx_total + Bx; %se actualia las variables para ser sumadas en cada ciclo
        By_total = By_total + By;
        Bz_total = Bz_total + Bz;
    end
end

%se gráfican los campos
figure;
quiver3(X,Y,Z, Bx_total, By_total, Bz_total,"filled",'b','LineWidth',1)
hold on;

%Graficamos los aros
x = radio * cos(theta);
y = radio * sin(theta);
z = ones(size(theta));

% Graficar las circunferencias en 3D
for j = 1:length(aros)
    z_aros = aros(j) * z; % Vector con la misma longitud que theta y con el valor de aros(j) en cada posición
    plot3(x, y, z_aros, 'b', 'LineWidth', 1.5);
    hold on;
end
hold off

%se grafican los aros en el plano
figure;
rad= [-radio radio];
lx = length(spacex);
origen = round((lx/2));
By1 = squeeze(By_total(:,origen,:));
Bz1 = squeeze(Bz_total(:,origen,:));
col =[204, 41, 54]/255;
for k=1:length(aros)
    y = aros(k);
    j =[y y];
    plot(rad,j,'Color',col);
    hold on;
end

%se grafica el campo a la mitad del plano x
streamslice(spacex,spacez,By1',Bz1');
title("Campo magnético de varios anillos",'FontSize',11)
