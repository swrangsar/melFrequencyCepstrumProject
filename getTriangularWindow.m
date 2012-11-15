function [triangularWindow, nextStartIndex] = getTriangularWindow(windowLength, startIndex, totalLength)

% cd ~/Desktop/melFrequencyCepstrumProject/

% % windowLength = 101;
% % startIndex = 1;
% % totalLength = 800;


triangularWindow = zeros(totalLength, 1);

indexOfCenter = (windowLength + 1)/2;
slope = 1 / (indexOfCenter - 1);
w = 1:windowLength;
distanceFromCenter = abs(indexOfCenter - w);
weights = (indexOfCenter - distanceFromCenter - 1) .* slope;

% figure(1), plot( weights); axis tight;
% 

for k = 1:length(weights)
    triangularWindow(startIndex - 1 + k) = weights(k);
end
% triangularWindow(startIndex:(startIndex + windowLength -1)) = weights(:);
% figure(2), plot(triangularWindow);
nextStartIndex = startIndex + indexOfCenter - 1;

end