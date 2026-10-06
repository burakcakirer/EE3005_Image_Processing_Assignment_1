function plotRGBHistograms(rgbImg, outDir)
%PLOTRGBHISTOGRAMS Plot the histogram of each RGB channel.

R = rgbImg(:,:,1); G = rgbImg(:,:,2); B = rgbImg(:,:,3);
[hR,x] = imhist(R,256);
[hG,~] = imhist(G,256);
[hB,~] = imhist(B,256);

f = figure('Name','Task 6 - RGB Histograms');
plot(x,hR,'r','LineWidth',1.1); hold on;
plot(x,hG,'g','LineWidth',1.1);
plot(x,hB,'b','LineWidth',1.1);
grid on; xlim([0 255]);
xlabel('Intensity value'); ylabel('Number of pixels');
title('RGB Channel Histograms');
legend('Red','Green','Blue','Location','best');

if nargin > 1 && ~isempty(outDir)
    exportgraphics(f, fullfile(outDir,'matlab_task6_rgb_histograms.png'), 'Resolution', 180);
end
end
