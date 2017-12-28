clear;

[X,Y] = meshgrid(-2:0.2:2,-2:0.2:2);
Z = funkcja(X,Y);
figure
surface(X,Y,Z)
view(2)

%Populacja pocz¹tkowa
N = 10;
%Liczba przyciagajacych agentow
K0 = 10;
%Pocz¹tkowa sta³a grawitacji
G = 100;
iter = 1;
%Ma³a sta³a do zapobiegania osobliwoœci
Epsilon = 1e-15;
%Wektory prêdkoœci i przyspieszeñ zainicjowane na 0
V = zeros(N,2);
A = zeros(N,2);
%poczatkowe losowe pozycje
P = (rand(N,2)-0.5)*4;
%Poczatkowe wartosci funkcji celu
Zc = funkcja(P(:,1),P(:,2));
%Masa aktywna, bierna i bezw³adnoœci
M = (Zc - min(Zc)) / (max(Zc) - min(Zc));
pop = [P V A M]
i = 0;
while i < iter
    % Wyznacz G i K
    G = G * 0.9;
    K = K0;
    % Zmodyfikuj M przez dobre i z³e rozwi¹zania, posortuj
    Zc = funkcja(P(:,1),P(:,2));
    M = (Zc - min(Zc)) / (max(Zc) - min(Zc));
    pop(:,7) = M;
    % Wyznacz F i a
    pop = sortrows(pop,7);
    % Odleglosci punktow od siebie
    R = zeros(N);
    iloczyn_mas = ones(N);
    for j = 1:1:N
        diff = (ones(N,1)*pop(j,1:2)-pop(:,1:2));
        R(j,:) = (diff(:,1).^2 + diff(:,2).^2).^(0.5);
        iloczyn_mas(j,:) = ones(N,1)*pop(j,7).*pop(:,7);
  %      F(j,:) = G * ones(N,1)*pop(j,1:2)
    end
    i = i + 1;
end
    


hold on
plot3(pop(:,1),pop(:,2), ...
      funkcja(pop(:,1),pop(:,2))+0.1, ...
      'wo','markers',10,'LineWidth',4)
