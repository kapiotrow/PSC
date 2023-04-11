function plotss = lukasz1(dolne, gorne)
% wczytywanie pliku
figure
load openloop60hertz, openLoop=openLoopVoltage;
Fs=1000;
t=(0:length(openLoop)-1)/Fs;
plot(t, openLoop); box on; grid on;
ylabel 'Voltage [V]', xlabel 'Time [s]'
title 'Open-Loop Voltage with Noise'
%% Power spectrum - Moc
%% na ok 60 Hz widzimy zaklocenie
figure;
periodogram(openLoop, [], [], Fs);
%% Projektujemy filtr
filtCoeff= designfilt('bandstopiir', 'FilterOrder', 2,...
'HalfPowerFrequency1', dolne, 'HalfPowerFrequency2', gorne, ...
'SampleRate', Fs);
%% Wykres filtru
fvtool(filtCoeff)
noiseFreeSignal= filter(filtCoeff, openLoop);
%% sprawadzamy wynik w dziedzinie czasu
close all;
figure;
plot (t, openLoop, t, noiseFreeSignal); grid on;
legend('Przed filtracja', 'Po filtracji');
ylabel 'Napiecie [V]', xlabel 'Czas [s]'
%% sprawdzamy wynik w dziedzinie częstotliwości
figure;
periodogram(noiseFreeSignal, [], [], Fs);
title('Po filtracji ');
figure;
periodogram(openLoop, [], [], Fs);
title('Przed filtracja '); 