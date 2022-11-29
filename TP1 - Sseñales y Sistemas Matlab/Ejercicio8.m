clear all;
close all;
clc
format long

P=[0:2/255:2]-1;
size(P);

info = audioinfo('Ejercicio6_reconstruccion_estaba_la.wav');
[y,Fs] = audioread('Ejercicio6_reconstruccion_estaba_la.wav');

tmax=size(y);
time=[0 : tmax-1]/Fs;
xmax=time(tmax)
figure
hold on
    xlabel("Tiempo(s)",'fontsize',12)
    ylabel("Amplitud",'fontsize',12)
        text(0.056,1.25,'E','Color','green','horizontalalignment', 'center','FontSize',14)
        xline(0,'-g')
        xline(0.112,'-g')        
        text(0.156,1.25,'S','Color','cyan','horizontalalignment', 'center','FontSize',14)
        xline(0.113,'-c')
        xline(0.199,'-c')
        text(0.335,1.25,'T','Color','blue','horizontalalignment', 'center','FontSize',14)
        xline(0.323,'-b')
        xline(0.347,'-b')
        text(0.427,1.25,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.347,'-r')
        xline(0.507,'-r')      
        text(0.547,1.25,'B','Color','magenta','horizontalalignment', 'center','FontSize',14)
        xline(0.508,'-r')
        xline(0.586,'-r')
        text(0.6455,1.25,'A','Color','red','horizontalalignment', 'center','FontSize',14)
        xline(0.587,'-r')
        xline(0.704,'-r')
        text(0.7525,1.25,'L','Color','yellow','horizontalalignment', 'center','FontSize',14)
        xline(0.705,'-y')
        xline(0.800,'-y')        
        text(0.871,1.25,'A','Color','red','horizontalalignment', 'center','FontSize',14)        
        xline(0.800,'-r')
        xline(0.942,'-r')    
    xlim([0 xmax(1)])
    ylim([-1.5 1.5])
    grid on 
    grid minor
    plot(time,y)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio8_grafico_temporal.svg','svg')
hold off

info = audioinfo('audios/estaba_la.wav');
[y,Fs] = audioread('audios/estaba_la.wav');


pista=[];
cant_coef=20;
for i = 0:123
    if i <= 120
        muestra25ms=y(1+441*i:1103+441*i);
        [a,g] = lpc(muestra25ms,cant_coef);
        den=[1 a(2:cant_coef+1)];
        estimacion=filter(1,den,[1 zeros(1,1102)]);
        segmento=estimacion(1:441);
        segmento=transpose(segmento);
        pista=[pista;segmento];
    elseif i<123
        muestra25ms = y(1+441*i:54272);
        tamanio = size(muestra25ms);
        muestra25ms = transpose(muestra25ms);
        muestra25ms = [muestra25ms, zeros(1, 1103-tamanio(1))];
        muestra25ms = transpose(muestra25ms);
        [a,g] = lpc(muestra25ms,cant_coef);
        den=[1 a(2:cant_coef+1)];
        estimacion=filter(1,den,[1 zeros(1,1102)]);
        segmento=estimacion(1:441);
        segmento=transpose(segmento);
        pista=[pista;segmento];
    else
        muestra25ms = y(1+441*i:54272);
        tamanio = size(muestra25ms);
        muestra25ms = transpose(muestra25ms);
        muestra25ms = [muestra25ms, zeros(1, 1103-tamanio(1))];
        muestra25ms = transpose(muestra25ms);
        [a,g] = lpc(muestra25ms,cant_coef);
        den=[1 a(2:cant_coef+1)];
        estimacion=filter(1,den,[1 zeros(1,1102)]);
        segmento=estimacion(1:29);
        segmento=transpose(segmento);
        pista=[pista;segmento];
    end
end

audiowrite('Ejercicio8_estaba_la.wav',pista,44100);

