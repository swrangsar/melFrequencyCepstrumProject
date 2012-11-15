function [windowedSignal, samplingFrequency] = getWindowedSignal(signal)

% get windowed central part of signal

windowDuration = 0.030; % in ms
[y, samplingFrequency] = getPreemphasizedSignal(signal);

centralIndex = round(length(y)/2);
M = round(windowDuration * samplingFrequency);
startIndex = round(centralIndex - M/2);
windowedSignal = y(startIndex:startIndex + M-1);

% apply hamming window

N = length(windowedSignal);
indices = 0:N-1;
hammingWindow = 0.54 - (0.46 * cos(2*pi*indices ./(N-1)));
windowedSignal = windowedSignal(:) .* hammingWindow(:);

end