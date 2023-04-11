%Sprawozdanie z zajęć 
%%
a = 23;
b = 5;
c = round(a/b)
d = rem(a,b)
%%
v = [0; 5; 0; 4; 0]
%%
rng(0,'twister')
m = 3;
sd = 5;
R2 = 5*randn(5,3) + m
%%
R3 = [R2 v]
%%
x = 0:pi/10:2*pi
y = sin(x)
plot(x,y)
%%
my = mean(y)
%%
A = [1 2 3; -1 1 4; -1 -2 -3]
B = [5; 1; -5]
X = linsolve(A, B)
%%
R = RGB(:,:,1); %tworzę tablicę zawierającą tylko składową R
G = RGB(:,:,2); %tworzę tablicę zawierającą tylko składową G
B = RGB(:,:,3); %tworzę tablicę zawierającą tylko składową B

vR = R(:)'; %zaczynam tworzyć wektory zawierające wszystkie wiersze tablic
vG = G(:)';
vB = B(:)';


A = [vR; vG; vB]; %tworzę macierz A zawierającą 
% wszystkie trzy wektory jako osobne wiersze

Z = [0.299 0.587 0.114; -0.169 -0.331 0.5; 0.5 -0.419 -0.081]; %macierz współczynników do konwersji

W = (Z * A) + [0; 128; 128]; %tworzę macierz przekonwertowanych wartości

Y = reshape(W(1,:), 650, 600); %tworzę tablice poszczególnych składowych
Cb = reshape(W(2,:), 650, 600);
Cr = reshape(W(3,:), 650, 600);

YCbCr = Y;
YCbCr(:,:,2) = Cb;
YCbCr(:,:,3) = Cr;  %łączę poszczególne składowe aby stworzyć trójwymiarową tablicę z wynikiem
imshow(YCbCr)

%%
a = pi;
b = ones(1, 1, 'uint8');
b = cast(b, "like",a)
a + b
%%
s = 'a':'g'
U = s(randi(numel(s),10,1))
