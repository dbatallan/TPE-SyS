clear all;
close all;
clc;

info = audioinfo('audios/aaaooo.wav')
[y,Fs] = audioread('audios/aaaooo.wav');

%window_size=512
%specgram(y,window_size,Fs,blackman(window_size),0)
%title('Spectrogram111')


tmax=size(y);
time=[0 : tmax-1]/Fs;
xmax=time(tmax)
figure
hold on
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Amplitud",'fontsize',14)  
    xlim([0 xmax(1)])
    ylim([-0.4 0.4])
    grid on 
    grid minor
    plot(time,y)
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_grafico_temporal.svg','svg')
hold off


time=size(y)/44100;
window=512;
figure 
hold on
    specgram(y,window,Fs,blackman(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])         
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_Espectrograma_512_blackman.svg','svg')
hold off


window=1024;
figure 
hold on
    specgram(y,window,Fs,blackman(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])        
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_Espectrograma_1024_blackman.svg','svg')
hold off

window=512;
figure 
hold on
    specgram(y,window,Fs,kaiser(window,2.5),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])         
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_Espectrograma_512_kaiser.svg','svg')
hold off

window=1024;
figure 
hold on
    specgram(y,window,Fs,kaiser(window,2.5),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])         
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_Espectrograma_1024_kaiser.svg','svg')
hold off

window=512;
figure 
hold on
    specgram(y,window,Fs,hann(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])         
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_Espectrograma_512_hann.svg','svg')
hold off

window=1024;
figure 
hold on
    specgram(y,window,Fs,hann(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])     
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio1_Espectrograma_1024_hann.svg','svg')
hold off