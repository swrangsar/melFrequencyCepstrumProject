close all; clear all;

cd ~/Desktop/melFrequencyCepstrumProject/

% function getMelDomainSpectrum(signal, windowCount)
signal = 'a_pani.wav';
windowCount = 20;

[signalSpectrum, signalLength, samplingFrequency] = getSpectrum(signal);
spectrumLength = length(signalSpectrum);

melDomainSpectrum = zeros(windowCount, 1);

initialWindowLength = 201;
startIndex = 1;
for k = 1:10
    [triangularWindow, startIndex] = getTriangularWindow(initialWindowLength, startIndex, spectrumLength);
    startIndex
    windowedSpectrum = signalSpectrum(:) .* triangularWindow(:);
    melDomainSpectrum(k) = sum(windowedSpectrum(:));
end

figure(300); clf; stem(melDomainSpectrum);