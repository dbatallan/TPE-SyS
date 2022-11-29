clear all;
close all;
clc
format long

info = audioinfo('Ejercicio5_error_estaba_la.wav');
[y,Fs] = audioread('Ejercicio5_error_estaba_la.wav');

time=size(y)/44100;
window=512;
figure 
hold on
    specgram(y,window,Fs,blackman(window),window/8)
    colormap bone
    xlabel("Tiempo(s)",'fontsize',12)
    ylabel("Frecuencia(Hz)",'fontsize',12)
    xlim([0 time(1)])
    ylim([0 Fs/2])
        text(0.056,20000,'E','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.112,'-g')        
        text(0.156,20000,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.113,'-c')
        xline(0.199,'-c')
        text(0.335,20000,'T','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.323,'-b')
        xline(0.347,'-b')
        text(0.427,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.347,'-r')
        xline(0.507,'-r')      
        text(0.547,20000,'B','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.508,'-r')
        xline(0.586,'-r')
        text(0.6455,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.587,'-r')
        xline(0.704,'-r')
        text(0.7525,20000,'L','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.705,'-y')
        xline(0.800,'-y')        
        text(0.871,20000,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.800,'-r')
        xline(0.942,'-r')           
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio7_Espectrograma_512_blackman.svg','svg')
hold off