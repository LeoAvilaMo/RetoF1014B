% Primera entrega

%Definiendo Variables constantes

I = 10; %Intensidad de corriente eléctrica (Amperios)
miu = (4*pi) * 10^-7; %Constante de permeabilidad magnética

%Definiendo el espacio del campo 
spacex = -15:0.1:15;
spacey = -15:0.1:15;
[X,Y] = meshgrid(spacex,spacey);