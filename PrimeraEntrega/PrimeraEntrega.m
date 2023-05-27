% Primera entrega

%Definiendo Variables constantes
N = 40; %Número de elementos de corriente
I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 2;

%Definiendo el espacio del campo 
spacex = -1:0.1:1;
spacey = -1:0.1:1;
spacez = -1:0.1:1;
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
    campo_Bx= (miu*I/4*pi) *((radio_dy.*ri_z)/ri^3);
    campo_By= -(miu*I/4*pi) *((radio_dx.*ri_z)/ri^3);
    campo_Bz= -(miu*I/4*pi) *((dx.*ri_x - dy.*ri_x)/ri^3);
    vecBX(end+1) = campo_Bx;
    vecBY(end+1) = campo_Bx;
    vecBZ(end+1) = campo_B<;
end

%Graficamos el aro
x = radio * cos(theta);
y = radio * sin(theta);
z = zeros(size(theta));
% Graficar la circunferencia en 3D
figure;
plot3(x, y, z, 'b', 'LineWidth', 2);
hold on 
quiver3(X,Y,Z,)
% definir los 3 vectores con los que se obtendrá la magnitud
% campo_Bx= (miu*I/4*pi) *((dy[i]*rz[i])/ri[i]^3) i
% campo_By= -(miu*I/4*pi) *((dx[i]*rz[i])/ri[i]^3) j
% campo_By= -(miu*I/4*pi) *((dx[i]*ry[i] - dy[i]*rx[i])/ri[i]^3) k
%dy[i] = ds[i]cos(theta) o bien ds[i]*(x[i]/R) donde ds es diferencial de superficie del aro
%dx[i] = ds[i]sin(theta) o bien ds[i]*(y[i]/R)
%r[i] = R - r'[i] donde R es la hipotenusa entre el centro del aro a un punto P y 
%r[i] es la hipotenusa desde un punto de la circunferencia del aro a un punto p, r'[i] es el radio del aro
%sería conveniente definir  los vectores para los tres planos, luego en base a eso establecer las diferentes distancias de r, R y r' para cada posición
%podemos hacer tres fors anidados para luego almacenar la sumatoria de los campos totales producidos en un punto por el aro y luego graficar estos en x, y yz
%si solo será con los planos x y y solo se tendría que hacer otra ecuación para el determinante del campo magnetico en sacando el determinante de la nueva matriz
