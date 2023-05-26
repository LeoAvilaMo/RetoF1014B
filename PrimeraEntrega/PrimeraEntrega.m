% Primera entrega

%Definiendo Variables constantes

I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética

%Definiendo el espacio del campo 
spacex = -15:0.1:15;
spacey = -15:0.1:15;
[X,Y] = meshgrid(spacex,spacey);

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
