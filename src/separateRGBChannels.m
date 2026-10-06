function [R,G,B] = separateRGBChannels(rgbImg, outDir)
%SEPARATERGBCHANNELS Separate an MxNx3 RGB image into three MxN matrices.

if ndims(rgbImg) ~= 3 || size(rgbImg,3) ~= 3
    error('Input must be an RGB image with size M x N x 3.');
end

R = rgbImg(:,:,1);
G = rgbImg(:,:,2);
B = rgbImg(:,:,3);

f = figure('Name','Task 2 - RGB Channels');
tiledlayout(2,2,'Padding','compact','TileSpacing','compact');
nexttile; imshow(rgbImg); title('Original RGB image');
nexttile; imshow(R); title('Red channel');
nexttile; imshow(G); title('Green channel');
nexttile; imshow(B); title('Blue channel');

if nargin > 1 && ~isempty(outDir)
    exportgraphics(f, fullfile(outDir,'matlab_task2_rgb_channels.png'), 'Resolution', 180);
end
end
