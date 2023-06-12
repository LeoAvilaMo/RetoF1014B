function [] =rk4(f,a,b,y1,h)
x=a:h:b;
n=length(x);
y=[y1];
for i=1:n-1
k1 = f(x(i), y(i));
k2 = f(x(i)+h/2, y(i)+k1*h/2);
k3 = f(x(i)+h/2, y(i)+k2*h/2);
k4= f(x(i)+h, y(i)+k3*h);
y(i+1) = y(i)+(h/6)*(k1+2*k2+2*k3+k4);
end
plot(x,y);
end