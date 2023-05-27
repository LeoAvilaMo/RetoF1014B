% Primera entrega

%Definiendo Variables constantes
N = 25; %Elementos de corriente
I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética
radio = 2;

%Definiendo el espacio del campo 
spacex = -15:0.1:15;
spacey = -15:0.1:15;
spacez = -15:0.1:15;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
d_theta = (2*pi)/N;
theta = 0:d_theta:(2*pi);
centro_aro = [0,0,0];
%campo_Bx;
%campo_By;
%campo_Bz;

%Graficamos el aro
x = radio * cos(theta);
y = radio * sin(theta);
z = zeros(size(theta));
% Graficar la circunferencia en 3D
figure;
plot3(x, y, z, 'b', 'LineWidth', 2);

%un ciclo for por cada punto que este anidado con otro ciclo for por cada
%elemento de corriente
for i = 1:length(theta)
    for x = X
        for y = Y
            for z = Z
                R = sqrt(((x-centro_aro(1)).^2+(y-centro_aro(2)).^2+(z-centro_aro(3)).^2));
                %ri1= sqrt((theta))

            end

        end

    end

end


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
