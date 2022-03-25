rows = 1080;
columns = 1920;
amplitude = 150; % Brightness difference from peak to valley.
offset = 50; % Darkest it will be.
period = 500;
% Create column vector.
y = (1 : rows)';
cosVector = uint8(amplitude * (1 + cos(2 * pi * y / period)) / 2 + offset);
% Replicate it to turn it into a 2-D image.
horizontalBandsImage = repmat(cosVector, [1, columns]);
subplot(2, 2, 1);
imshow(horizontalBandsImage);
axis('on', 'image');
impixelinfo;

% Create column vector.
x = 1 : columns;
cosVector = uint8(amplitude * (1 + cos(2 * pi * x / period)) / 2 + offset);
% Replicate it to turn it into a 2-D image.
verticalBandsImage = repmat(cosVector, [rows, 1]);
subplot(2, 2, 2);
imshow(verticalBandsImage);
axis('on', 'image');
impixelinfo;

subplot(2, 2, 3:4);
histogram(verticalBandsImage, 0:255);
grid on;
title('Histogram', 'FontSize', 15);