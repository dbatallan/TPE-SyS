clear all;
close all;
clc

ruido=rand(231904,1);
R=xcorr(ruido-0.5);

figure
hold on
plot(R)

size(ruido)