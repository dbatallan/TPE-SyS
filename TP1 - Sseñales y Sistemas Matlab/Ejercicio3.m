clear all;
close all;
clc;

info = audioinfo('audios/fantasia.wav')
[y,Fs] = audioread('audios/fantasia.wav');

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
        text(0.1015,0.4,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,0.4,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,0.4,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,0.4,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,0.4,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,0.4,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,0.4,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,0.4,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')     
    xlim([0 xmax(1)])
    ylim([-0.6 0.6])
    grid on 
    grid minor
    plot(time,y)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_grafico_temporal.svg','svg')
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
        text(0.1015,20000,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,20000,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,20000,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,20000,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_Espectrograma_512_blackman.svg','svg')
hold off


window=256;
figure 
hold on
    specgram(y,window,Fs,blackman(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])
        text(0.1015,20000,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,20000,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,20000,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,20000,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_Espectrograma_256_blackman.svg','svg')
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
        text(0.1015,20000,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,20000,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,20000,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,20000,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_Espectrograma_512_kaiser.svg','svg')
hold off

window=256;
figure 
hold on
    specgram(y,window,Fs,kaiser(window,2.5),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])
        text(0.1015,20000,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,20000,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,20000,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,20000,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_Espectrograma_256_kaiser.svg','svg')
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
        text(0.1015,20000,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,20000,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,20000,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,20000,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_Espectrograma_512_hann.svg','svg')
hold off

window=256;
figure 
hold on
    specgram(y,window,Fs,hann(window),window/4)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',14)
    ylabel("Frecuencia(Hz)",'fontsize',14)
    xlim([0 time(1)])
    ylim([0 Fs/2])
        text(0.1015,20000,'F','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.201,'-g')        
        text(0.248,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.203,'-r')
        xline(0.293,'-r')
        text(0.3395,20000,'N','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.298,'-b')
        xline(0.381,'-b')
        text(0.4205,20000,'T','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.412,'-y')
        xline(0.428,'-y')      
        text(0.48,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.430,'-r')
        xline(0.530,'-r')
        text(0.609,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.536,'-c')
        xline(0.682,'-c')
        text(0.776,20000,'I','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.683,'-m')
        xline(0.869,'-m')        
        text(0.9655,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.919,'-r')
        xline(1.012,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio3_Espectrograma_256_hann.svg','svg')
hold off


