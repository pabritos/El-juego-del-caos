%
% Esta simulación está inspirada por
% -El juego del caos- que se puede encontrar
% en el libro El azar en la vida cotidiana,
% cuyo autor es Alberto Rojo.
%
% La implementación en matlab-octave que
% realicé es la siguiente:
%

clc; 

clear

% Considero el triángulo isósceles, ABC
% Donde A=[0,0] , B=[1,0] y C=[0.5,sqrt(3)/2]

n=10000;
X = zeros(1,n);
Y = zeros(1,n);

 % Elijo un punto P=[x,y] aleatorio en el triángulo ABC
x = rand;
if (x < 0.5)
  y = x*sqrt(3)/2*rand;
else
  y = (1-x)*sqrt(3)/2*rand;
end

# Consigo todos los puntos a graficar
for i=1:n
  % Elijo un vértice aleatorio
  V=randi([0 2]);    
  switch V
    case 0 % Punto medio entre A y P
        X_z = (x)/2;
        Y_z = (y)/2;
    case 1 % Punto medio entre B y P
        X_z = (x+1)/2;
        Y_z = (y)/2;
    case 2 % Punto medio entre C y P
        X_z = (x+0.5)/2;
        Y_z = (y+0.5*sqrt(3)/2)/2;
    end
  % Agrego el punto a graficar
  X(1,i)=X_z;
  Y(1,i)=Y_z;
  % Sigo a partir del punto obtenido
  x = X_z;
  y = Y_z;  
end

# Graficamos los primeros 500 con pausa
tic
for i=1:1000
  plot(X(i),Y(i),'.',...
      'MarkerSize',10,...
      'MarkerEdgeColor','b') 
  hold on
  if i < 300
    pause(0.01)
  else
    pause(0.001)
  end
  if i < 2 
    # Las siguientes instrucciones las ejecutamos una 
    # sola vez ya que tardan medio segundo cada vez.
    axis([0 1 0 sqrt(3)/2*0.5])
    title('El juego del caos con Octave - Pablo Britos')
    legend(sprintf('n=%d Iteraciones',n))  
  end
end
toc 
# Graficamos los restantes sin pausa ya que
# representarlos uno a uno en un bucle tarda mucho.

tic 
plot(X,Y,'.',...
      'MarkerSize',5,...
      'MarkerEdgeColor','b')
toc