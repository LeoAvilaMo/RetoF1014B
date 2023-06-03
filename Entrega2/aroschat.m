% Definir el radio y la separación
radio = 2;
separacion_y = 2;

% Crear un vector de ángulos
theta = linspace(0, 2*pi, 100);

% Inicializar la figura
figure;
hold on;

% Iterar para graficar los 10 anillos
for i = 1:10
    % Calcular las coordenadas x, y, y z del centro del anillo
    centro_x = 0;
    centro_y = (i-1) * separacion_y;
    centro_z = 0;
    
    % Calcular las coordenadas x, y, y z de los puntos del anillo
    x = centro_x + radio * cos(theta);
    y = centro_y + zeros(size(theta));
    z = centro_z + radio * sin(theta);
    
    % Graficar el anillo en 3D
    plot3(x,y,z);
end

% Configurar los ejes y la apariencia de la gráfica
axis equal;
grid on;

% Etiquetas de los ejes
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');

% Título de la gráfica
title('10 anillos de radio 2 con separación en el eje Y de 2 unidades en 3D');

hold off;
