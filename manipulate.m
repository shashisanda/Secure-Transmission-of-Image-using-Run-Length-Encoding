dat = imread('lena.bmp');

   figure()
   image(dat)
   title('original')

   % invert colors
   dat2 = 255-dat;
   figure();
   image(dat2);
   title('inverted colors');

   % gamma-correction
   gamma_r = 2.2;  % gamma correction red channel
   gamma_g = 2.0;  % gamma correction green channel
   gamma_b = 1.0;  % gamma correction blue channel

   dat2(:,:,1) = uint8( (double(dat(:,:,1))/256).^gamma_r *256);
   dat2(:,:,2) = uint8( (double(dat(:,:,2))/256).^gamma_g *256);
   dat2(:,:,3) = uint8( (double(dat(:,:,3))/256).^gamma_b *256);
   figure();
   image(dat2);
   title('gamma-corrected');

   % blur filter for central 301x301 pixels
   alpha =0.8;
   N = 30;
   dat2 = double(dat);
   [height,width] = size(dat(:,:,1));
   cx = round(width/2);
   cy = round(height/2);
   for n=1:N
      tmp = 1/(1+4*alpha) * (        dat2(cy-150:cy+150,cx-150:cx+150,:) + ...
                              alpha*(dat2(cy-150-1:cy+150-1,cx-150:cx+150,:)+ ...
                                     dat2(cy-150+1:cy+150+1,cx-150:cx+150,:)+ ...
                                     dat2(cy-150:cy+150,cx-150-1:cx+150-1,:)+ ...
                                     dat2(cy-150:cy+150,cx-150+1:cx+150+1,:)));
      dat2(cy-150:cy+150,cx-150:cx+150,:) = tmp;
   end
   dat2 = uint8(dat2);
   figure();
   image(dat2);
   title('blurred');
   