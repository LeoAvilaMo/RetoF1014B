% Primera entrega

%Definiendo Variables constantes
N = 200; %Número de elementos de corriente
I = 100; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 1; %radio del aro

%Definiendo el espacio del campo 
spacex = -4:1:4;
spacey = -4:1:4;
spacez = -4:1:4;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
theta = 0:d_theta:(2*pi);
campo_Bx_total = zeros(size(X));
campo_By_total = zeros(size(Y));
campo_Bz_total = zeros(size(Z));
R = sqrt(((X).^2+(Y).^2+(Z).^2));
for i = 1:length(theta) %ciclo for que vaya por cada elemento de corriente en el aro
    ds = radio*theta(i); %diferencial de superficie del aro en base al angulo establecido por el vector de theta
    radio_dy = (ds.*X)./R; %vector en x del radio
    radio_dx = -(ds.*Y)./R; %vector en y del radio
    ri_x = X - radio_dx; %vector del punto en el espacio menos el vector del radio en x
    ri_y = Y - radio_dy; %vector del punto en el espacio menos el vector del radio en y
    ri_z = Z; %vector del punto en el espacio menos el vector del radio en z
    ri = sqrt((ri_x.^2)+(ri_y.^2)+(ri_z.^2)); %magnitud de los vectores anteriores
    campo_Bx= (miu*I/4*pi) *((radio_dy.*ri_z)./ri.^3); %se obtiene cada campo en x,y y z
    campo_By= -(miu*I/4*pi) *((radio_dx.*ri_z)./ri.^3);
    campo_Bz= -(miu*I/4*pi) *((radio_dx.*ri_x - radio_dy.*ri_x)./ri.^3);
    campo_Bx_total = campo_Bx_total + campo_Bx; %se actualia las variables para ser sumadas en cada ciclo
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
%se gráfican los campos eléctricos
quiver3(X,Y,Z, campo_Bx_total, campo_By_total, campo_Bz_total)
