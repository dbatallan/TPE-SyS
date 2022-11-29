clear all;
close all;
clc
format long

info = audioinfo('audios/estaba_la.wav');
[y,Fs] = audioread('audios/estaba_la.wav');

tmax=size(y);
time=[0 : tmax-1]/Fs;
xmax=time(tmax)

time=size(y)/44100;
window=512;

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


%tiempo=[1:21]
%frecuencia=[1:124]
%waterfall(tiempo,frecuencia,abs(matriz_coef))



transf=[];
for i = 0:123
    if i <= 120
        muestra25ms=y(1+441*i:1103+441*i);
        [a,g] = lpc(muestra25ms,cant_coef);
        [h,w]=freqz([1],[1 a(2:21)]);
        P=abs(h);
        transf=[transf,P];
    else
        muestra25ms = y(1+441*i:54272);
        tamanio = size(muestra25ms);
        muestra25ms = transpose(muestra25ms);
        muestra25ms = [muestra25ms, zeros(1, 1103-tamanio(1))];
        muestra25ms = transpose(muestra25ms);
        [a,g] = lpc(muestra25ms,cant_coef);
        [h,w]=freqz([1],[1 a(2:cant_coef+1)]);
        P=abs(h);
        transf=[transf,P];
    end
end

size(transf)

tiempo=[1:512]
frecuencia=[1:124]

colormap bone
waterfall(frecuencia,tiempo,20*log10(transf))

