clear all;
close all;
clc
format long

info = audioinfo('audios/estaba_la.wav');
[y,Fs] = audioread('audios/estaba_la.wav');

tmax=size(y);
time=[0 : tmax-1]/Fs;
xmax=time(tmax)
figure
hold on
    xlabel("Tiempo(s)",'fontsize',12)
    ylabel("Amplitud",'fontsize',12)
        text(0.056,0.4,'E','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.112,'-g')        
        text(0.156,0.4,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.113,'-c')
        xline(0.199,'-c')
        text(0.335,0.4,'T','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.323,'-b')
        xline(0.347,'-b')
        text(0.427,0.4,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.347,'-r')
        xline(0.507,'-r')      
        text(0.547,0.4,'B','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.508,'-r')
        xline(0.586,'-r')
        text(0.6455,0.4,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.587,'-r')
        xline(0.704,'-r')
        text(0.7525,0.4,'L','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.705,'-y')
        xline(0.800,'-y')        
        text(0.871,0.4,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.800,'-r')
        xline(0.942,'-r')    
    xlim([0 xmax(1)])
    ylim([-0.6 0.6])
    grid on 
    grid minor
    plot(time,y)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio4_grafico_temporal.svg','svg')
hold off

time=size(y)/44100;
window=512;
figure 
hold on
    specgram(y,window,Fs,blackman(window),window/4)
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
    saveas(f,'Ejercicio4_Espectrograma_512_blackman.svg','svg')
hold off



%for i = 0:120
%    muestra25ms=y(1+441*i:1103+441*i);
%    [a,g] = lpc(muestra25ms,20);
%    matriz_coef=[matriz_coef;a];
%end
%    muestra25ms=y(1+441*121:54272);
%    [a,g] = lpc(muestra25ms,20);
%    matriz_coef=[matriz_coef;a];
matriz_coef=[];
cant_coef=20;
for i = 0:123
    if i <= 120
        muestra25ms=y(1+441*i:1103+441*i);
        [a,g] = lpc(muestra25ms,cant_coef);
        matriz_coef=[matriz_coef;a];
    else
        muestra25ms = y(1+441*i:54272);
        tamanio = size(muestra25ms);
        muestra25ms = transpose(muestra25ms);
        muestra25ms = [muestra25ms, zeros(1, 1103-tamanio(1))];
        muestra25ms = transpose(muestra25ms);
        [a,g] = lpc(muestra25ms,cant_coef);
        matriz_coef=[matriz_coef;a]; 
    end
end

writematrix(matriz_coef,'Ejercicio4_Matriz_coeficientes.txt','Delimiter','\t');

%Tomo muestras para el diagrama d epolos y ceros de la letra A hubicada
%desde 0.4s
muestra25ms=y(17640:18742);
[a,g] = lpc(muestra25ms,20);
den = [1 a(2:21)];
figure
hold on
    zplane(1,den)
    xlim([-1.5 1.5])
    ylim([-1.5 1.5])
    grid on 
    grid minor
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio4_Diagrama_Polos_ceros.svg','svg')
hold off

tiempo=[1:21]
frecuencia=[1:124]




