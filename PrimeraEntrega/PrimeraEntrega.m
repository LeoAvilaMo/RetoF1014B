% Primera entrega

%Definiendo Variables constantes
N = 200; %Número de elementos de corriente
I = 100; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 2; %radio del aro

%Definiendo el espacio del campo 
spacex = -5:1:5;
spacey = -5:1:5;
spacez = -5:1:5;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
theta = 0:d_theta:((2*pi-d_theta));
Bx_total = zeros(size(X));
By_total = zeros(size(Y));
Bz_total = zeros(size(Z));
R = sqrt(((X).^2+(Y).^2+(Z).^2));
for i = 1:length(theta) %ciclo for que vaya por cada elemento de corriente en el aro
    ds = radio*theta(i); %diferencial de superficie del aro en base al angulo establecido por el vector de theta
    radio_dy = (ds.*X)./R; %vector en x del radio X.*theta(i)
    radio_dx = -(ds.*Y)./R; %vector en y del radio
    ri_x = X - radio_dx; %vector del punto en el espacio menos el vector del radio en x
    ri_y = Y - radio_dy; %vector del punto en el espacio menos el vector del radio en y
    ri_z = Z; %vector del punto en el espacio menos el vector del radio en z
    ri = sqrt((ri_x.^2)+(ri_y.^2)+(ri_z.^2+(0.2)^2)); %magnitud de los vectores anteriores
    Bx= (miu*I/4*pi) *((radio_dy.*ri_z)./ri.^3); %se obtiene cada campo en x,y y z
    By= -(miu*I/4*pi) *((radio_dx.*ri_z)./ri.^3);
    Bz= (miu*I/4*pi) *((radio_dx.*ri_y - radio_dy.*ri_x)./ri.^3);
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
quiver3(X,Y,Z, Bx_total, By_total, Bz_total)

hold off
%figure;
i= [-radio radio];
j = [0 0];
origen = round((length(spacey))/2);
Bx1 = squeeze(Bx_total(:,y2,:));
Bz1 = squeeze(Bz_total(:,y2,:));
plot(i,j);
streamslice(spacex,spacez,Bx1',Bz1');
