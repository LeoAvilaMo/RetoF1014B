% Parámetros y condiciones iniciales
mi = 1000;
miu =  (4*pi) * 10^-7;
radio = 10;
I = 1000;
masa = 100;
gravedad = 9.8;

z0 = 400; % Valor inicial de z
v0 = 30; % Valor inicial de v
t0 = 0; % Tiempo inicial
tn = 20; % Tiempo final
h = 1; % Tamaño del paso

% Funciones del sistema de ecuaciones diferenciales
f1 = @(t, z, v) v;
f2 = @(t, z, v) (3*mi*miu*radio^2*I/(2*masa)) * (z/(radio^2 + z^2)^(5/2)) - gravedad;

% Implementación del método de Runge-Kutta
t_vals = t0:h:tn; % Vector de tiempos
N = length(t_vals); % Número de pasos

z_vals = zeros(1, N); % Vector para almacenar los valores de z
v_vals = zeros(1, N); % Vector para almacenar los valores de v

z_vals(1) = z0; % Valor inicial de z
v_vals(1) = v0; % Valor inicial de v

% Iteración del método de Runge-Kutta
for i = 1:(N-1)
    t = t_vals(i);
    z = z_vals(i);
    v = v_vals(i);
    
    k1z = h * f1(t, z, v);
    k1v = h * f2(t, z, v);
    k2z = h * f1(t + h/2, z + k1z/2, v + k1v/2);
    k2v = h * f2(t + h/2, z + k1z/2, v + k1v/2);
    k3z = h * f1(t + h/2, z + k2z/2, v + k2v/2);
    k3v = h * f2(t + h/2, z + k2z/2, v + k2v/2);
    k4z = h * f1(t + h, z + k3z, v + k3v);
    k4v = h * f2(t + h, z + k3z, v + k3v);
    
    z_vals(i+1) = z + (k1z + 2*k2z + 2*k3z + k4z) / 6;
    v_vals(i+1) = v + (k1v + 2*k2v + 2*k3v + k4v) / 6;
end
a_vals = [];

for i=1:length(z_vals)
    a_vals(end+1) = (3*mi*miu*radio^2*I/(2*masa)) * (z_vals(i)/(radio^2 + (z_vals(i))^2)^(5/2)) - gravedad;
end
% Graficar la solución
figure(1);
plot(t_vals, z_vals);
xlabel('Tiempo');
ylabel('Posición Z');
title('Gráfica de posición con respecto al tiempo');
figure(2);
plot(t_vals,v_vals);
xlabel('Tiempo');
ylabel('Velocidad');
title('Gráfica de velocidad con respecto al tiempo');
figure(3);
plot(t_vals,a_vals);
xlabel('Tiempo');
ylabel('Aceleración');
title('Gráfica de velocidad con respecto al tiempo');

