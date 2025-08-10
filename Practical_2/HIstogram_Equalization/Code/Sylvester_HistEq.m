clc;
clear;
close all;


%  Read image

I = imread('ace_a_e.jpg');  


% Convert to double for more accuracy
I = uint8(I); % ensure 0-255 format

[m, n] = size(I);
numPixels = m * n;

% Compute histogram

hist_counts = zeros(1,256); % intensity range 0-255

for row = 1:m
    for col = 1:n
        intensity = I(row, col);
        hist_counts(intensity + 1) = hist_counts(intensity + 1) + 1; % +1 for MATLAB index
    end
end


%  Compute PDF
pdf = hist_counts / numPixels;

%  Compute CDF

cdf = zeros(1,256);
cdf(1) = pdf(1);
for k = 2:256
    cdf(k) = cdf(k-1) + pdf(k);
end


% Rounding off

L = 256;
mapping = round(cdf * (L - 1));



I_eq = zeros(m, n, 'uint8');
for row = 1:m
    for col = 1:n
        I_eq(row, col) = mapping(I(row, col) + 1);
    end
end


figure;
subplot(2,2,1), imshow(I), title('Original Image');
subplot(2,2,2), bar(0:255, hist_counts), title('Original Histogram');
subplot(2,2,3), imshow(I_eq), title('Equalized Image');

% Equalized histogram
hist_eq = zeros(1,256);
for row = 1:m
    for col = 1:n
        hist_eq(I_eq(row,col) + 1) = hist_eq(I_eq(row,col) + 1) + 1;
    end
end
subplot(2,2,4), bar(0:255, hist_eq), title('Equalized Histogram');
