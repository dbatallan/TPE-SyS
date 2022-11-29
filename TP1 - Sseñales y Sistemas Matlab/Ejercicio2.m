clear all;
close all;
clc;

Fs=44100;
ruido=rand(Fs*2,1)-0.5;

audiowrite('Ejercicio2_ruido.wav',ruido,Fs);

time=2;
window=512;

eje_tiempo=[1:Fs*2]/Fs;

figure 
hold on
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Amplitud",'fontsize',14)
    xlim([0 time])
    ylim([-1 1]) 
    plot(eje_tiempo,ruido)
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio2_grafico_temporal_ruido.svg','svg')
hold off


figure 
hold on
    specgram(ruido,window,Fs,blackman(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time])
    ylim([0 Fs/2])         
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio2_Espectrograma_ruido.svg','svg')
hold off

correlacion=xcorr(ruido);
figure
hold on
    xlim([0 88200*2])
    ylim([-1000 8000])
    grid on 
    grid minor
    plot (correlacion)
    f = gcf;
    saveas(f,'Ejercicio2_correlacion.svg','svg')
hold off

figure
hold on
    xlabel("Normalized Frequency (\times\pi rad/sample)",'fontsize',14)
    ylabel("Magnitude (dB)",'fontsize',14)
    [h,w]=freqz([1],[1 -0.75]);
    plot(w/(pi),20*log10(abs(h)))
    grid on 
    grid minor
    f = gcf;
    saveas(f,'Ejercicio2_respuesta_filtro.svg','svg')
hold off

filtrado=filter(1,[1 -0.75],ruido);

window=512;
figure 
hold on
    specgram(filtrado,window,Fs,blackman(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time])
    ylim([0 Fs/2])         
    grid on 
    grid minor
    pbaspect([16 9 1])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio2_Espectrograma_ruido_filtrado.svg','svg')
hold off

audiowrite('Ejercicio2_ruido_filtrado.wav',filtrado,44100);




