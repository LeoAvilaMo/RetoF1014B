NumEspiras = 10;
separacion = 2;
dtheta = 2*pi/NumEspiras;
theta = 0:dtheta:2*pi/NumEspiras;
aux = 1;
spacex = -25:1:25;
spacey = -25:1:25;
spacez = -25:1:25;
Radio = 2;
[X,Y,Z] = meshgrid(spacex,spacey,spacez);
Px = zeros(length(X));
Py = zeros(length(Y));
Pz = zeros(length(Z));
dx = zeros(length(X));
dy = zeros(length(Y));
dz = zeros(length(Z));
aux = 1;
for i=1:NumEspiras
    dtheta = 2*pi/NumEspiras;
    theta = 0:dtheta:2*pi-1;
    Px(aux+NumEspiras-1) = Radio*cos(theta(i));
    Py(aux+NumEspiras-1) = Radio*sin(theta(i));
    Pz(aux+NumEspiras-1) = -NumEspiras*separacion/2 + separacion*(i-1);
    dx(aux+NumEspiras-1) = -Py(aux+ NumEspiras-1) * dtheta;
    dy(aux+NumEspiras-1) = Px(aux+NumEspiras-1) * dtheta;
    aux = aux + NumEspiras;
end
quiver(Px,Py,Pz,dx,dy,dz,0.5)
axis equal