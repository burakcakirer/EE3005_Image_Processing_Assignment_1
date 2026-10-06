function displayMatrixRepresentation(I, outDir)
%DISPLAYMATRIXREPRESENTATION Display an image as numerical matrix values.
%   I is expected to be a 2-D grayscale matrix. A 10x10 region from the
%   image center is printed and displayed with intensity values.

if ndims(I) ~= 2
    error('Input must be a 2-D grayscale image.');
end

[nRows,nCols] = size(I);
r0 = floor(nRows/2)-4;
c0 = floor(nCols/2)-4;
block = I(r0:r0+9, c0:c0+9);

fprintf('\n10x10 sample from the center of the image:\n');
disp(block);

f = figure('Name','Task 1 - Matrix Representation');
imagesc(block); axis image; colormap gray; colorbar;
title('10 x 10 Matrix Sample from Image Center');
xlabel('Column index within crop'); ylabel('Row index within crop');

for r = 1:size(block,1)
    for c = 1:size(block,2)
        if block(r,c) < 110
            textColor = 'w';
        else
            textColor = 'k';
        end
        text(c,r,num2str(block(r,c)), 'HorizontalAlignment','center', ...
            'FontSize',8,'Color',textColor);
    end
end

if nargin > 1 && ~isempty(outDir)
    exportgraphics(f, fullfile(outDir,'matlab_task1_matrix_sample.png'), 'Resolution', 180);
    writematrix(block, fullfile(outDir,'matlab_task1_matrix_sample.csv'));
end
end
