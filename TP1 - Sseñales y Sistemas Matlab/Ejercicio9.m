clear all;
close all;
clc
format long

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

plot(pista)
error=y-pista;
audiowrite('Ejercicio9_estaba_la.wav',pista,44100);

tmax=size(y);
time=[0 : tmax-1]/Fs;
xmax=time(tmax)

muestras256=[0:2/255:2]-1;
pista256=[];
for i = 1:size(y)
    xx=pista(i); % xx valor arbitrario
    [minimo,position]=min(abs(muestras256-xx));
    pista256=[pista256,muestras256(position)];
end
audiowrite('Ejercicio9_estaba_la_256.wav',pista256,44100);
size(pista256)

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
    ylim([-1 1])
    grid on 
    grid minor
    plot(time,pista256)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio9_grafico_temporal_256.svg','svg')
hold off

error256=[];
for i = 1:size(y)
    xx=error(i); % xx valor arbitrario
    [minimo,position]=min(abs(muestras256-xx));
    error256=[error256,muestras256(position)];
end

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
    ylim([-1 1])
    grid on 
    grid minor
    plot(time,error256)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio9_grafico_error_256.svg','svg')
hold off


muestras16=[0:2/15:2]-1;
pista16=[];
for i = 1:size(y)
    xx=pista(i); % xx valor arbitrario
    [minimo,position]=min(abs(muestras16-xx));
    pista16=[pista16,muestras16(position)];
end
audiowrite('Ejercicio9_estaba_la_16.wav',pista16,44100);
size(pista16)


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
    ylim([-1 1])
    grid on 
    grid minor
    plot(time,pista16)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio9_grafico_temporal_16.svg','svg')
hold off


muestras16=[0:2/15:2]-1;
error16=[];
for i = 1:size(y)
    xx=pista(i); % xx valor arbitrario
    [minimo,position]=min(abs(muestras16-xx));
    error16=[error16,muestras16(position)];
end

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
    ylim([-1 1])
    grid on 
    grid minor
    plot(time,error16)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio9_grafico_error_16.svg','svg')
hold off




muestras4=[0:2/3:2]-1;
pista4=[];
for i = 1:size(y)
    xx=pista(i); % xx valor arbitrario
    [minimo,position]=min(abs(muestras4-xx));
    pista4=[pista4,muestras4(position)];
end
audiowrite('Ejercicio9_estaba_la_4.wav',pista4,44100);
size(pista4)

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
    ylim([-1 1])
    grid on 
    grid minor
    plot(time,pista4)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio9_grafico_temporal_4.svg','svg')
hold off


error4=[0:2/3:2]-1;
error4=[];
for i = 1:size(y)
    xx=error(i); % xx valor arbitrario
    [minimo,position]=min(abs(muestras4-xx));
    error4=[error4,muestras4(position)];
end


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
    ylim([-1 1])
    grid on 
    grid minor
    plot(time,error4)
    pbaspect([16 16 16])
    f = gcf;
    %exportgraphics(f,'barchart.png','Resolution',300)
    saveas(f,'Ejercicio9_grafico_error_4.svg','svg')
hold off