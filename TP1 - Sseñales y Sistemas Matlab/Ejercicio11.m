clear all;
close all;
clc
format long

info = audioinfo('audios/estaba_la.wav');
[y,Fs] = audioread('audios/estaba_la.wav');

[yo,Fsaaaooo] = audioread('audios/aaaooo.wav');


tmax=size(y);
time=[0 : tmax-1]/Fs;
xmax=time(tmax)

time=size(y)/44100;
window=512;

matriz_coef=[];
cant_coef=20;


muestra_o_25ms=yo(158760:158760+1103);
[ao,g] = lpc(muestra_o_25ms,cant_coef);
figure
hold on
plot(ao)
hold off

pista=[];
for i = 0:123
    if i <= 120
        muestra25ms=y(1+441*i:1103+441*i);
        [a,g] = lpc(muestra25ms,cant_coef);
        if (i >= 34) && (i <= 54)
            a=ao;
        end
        if (i >= 80)
            a=ao;
        end
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
        a=ao;
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

audiowrite('Ejercicio11_reeemplazo_o_estaba_la.wav',pista,44100);

figure
hold on
    xlabel("Normalized Frequency (\times\pi rad/sample)",'fontsize',14)
    ylabel("Magnitude (dB)",'fontsize',14)
    [h,w]=freqz([1],[1 ao(2:21)]);
    plot(w/(pi),20*log10(abs(h)))
    grid on 
    grid minor
    f = gcf;
    saveas(f,'Ejercicio11_filtro_fonema_o.svg','svg')
hold off

figure
hold on
    xlabel("coeficiente",'fontsize',14)
    ylabel("valor",'fontsize',14)
    plot(ao)
    grid on 
    grid minor
    f = gcf;
    saveas(f,'Ejercicio11_coeficiente_fonema_o.svg','svg')
hold off


muestra25ms=yo(8820:1103+8820);
[a,g] = lpc(muestra25ms,cant_coef);
figure
hold on
    xlabel("Normalized Frequency (\times\pi rad/sample)",'fontsize',14)
    ylabel("Magnitude (dB)",'fontsize',14)
    [h,w]=freqz([1],[1 a(2:21)]);
    plot(w/(pi),20*log10(abs(h)))
    grid on 
    grid minor
    f = gcf;
    saveas(f,'Ejercicio11_filtro_fonema_a.svg','svg')
hold off

figure
hold on
    xlabel("coeficiente",'fontsize',14)
    ylabel("valor",'fontsize',14)
    plot(a)
    grid on 
    grid minor
    f = gcf;
    saveas(f,'Ejercicio11_coeficiente_fonema_a.svg','svg')
hold off





