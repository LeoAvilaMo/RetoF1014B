% Primera entrega

%Definiendo Variables constantes
radio = 2;
N = 40;
I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
const = miu*I/4*pi;

%Definiendo el espacio del campo 
spacex = -15:3:15;
spacey = -15:3:15;
spacez = -15:3:15;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
dtheta = 0:((2*pi)/N):2*pi;
R = sqrt(X.^2 + Y.^2 + Z.^2);
for i=1:length(dtheta)
    rdx = -Y*dtheta(i);
    rdy = X*dtheta(i);
end
rx = X - rdx;
ry = Y - rdy;
rz = Z;
r = sqrt(ry.^2 + rx.^2 + rz.^2);

Bx = const .* ((rdy.*rz)./(r.^3));
By = -const .* ((rdx.*rz)./(r.^3));
Bz = -const .* ((((rdx -rdy)).*(rx))./(r.^3));

%Aro
figure;
%Graficamos el aro
x = radio * cos(dtheta);
y = radio * sin(dtheta);
z = zeros(size(dtheta));
plot3(x, y, z, 'b', 'LineWidth', 2);
hold on 
quiver3(X,Y,Z,Bx,By,Bz);