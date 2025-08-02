% Read the RGB image
img = imread('vin.png');  % Replace with your image file


% Red Plane
Ir = img;
Ir(:,:,2) = 0;  
Ir(:,:,3) = 0;   

% Green Plane
Ig = img;
Ig(:,:,1) = 0; 
Ig(:,:,3) = 0; 

% Blue Plane 
Ib = img;
Ib(:,:,1) = 0;  
Ib(:,:,2) = 0;  

% Display all three images
figure;
subplot(1,3,1), imshow(Ir), title('Red Plane');
subplot(1,3,2), imshow(Ig), title('Green Plane');
subplot(1,3,3), imshow(Ib), title('Blue Plane');

%% Grayscale Conversion (Average Method)
gray = (R_d + G_d + B_d) / 3;
gray_uint8 = uint8(gray);  % Convert for display

% Display grayscale image
figure;
imshow(gray_uint8);
title('Grayscale Image (Average Method)');

%% Black & White Conversion (Manual Threshold)
gray_norm = gray / 255;        % Normalize to [0, 1]
threshold = 0.5;
bw = gray_norm > threshold;    % Logical matrix

% Display BW image
figure;
imshow(bw);
title('Black & White Image');
