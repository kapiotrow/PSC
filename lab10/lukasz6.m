function plotss = zad6()
load chirp
t = (0:length(y)-1)/Fs; % 1.6 sekundy
ord = 46;
low = 0.4;
bnd = [0.5 0.99];
bM = fir1(ord,[low bnd], 'DC-1', tukeywin(ord+1));
hM = fir1(ord,[low bnd],'DC-0',hann(ord+1));
hfvt = fvtool(bM,1,hM,1); %porownanie okien
legend(hfvt,'Hamming','Hann')
end