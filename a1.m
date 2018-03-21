clc
clear all
close all
dat=imread('lena.bmp');
figure;
imshow(dat);
 imi = imfinfo('lena.bmp')
 dat1=rgb2gray(dat);
 figure;
 imshow(dat1)
 h=imrect;
 position=wait(h);
 txt=input('enter the txt','s')