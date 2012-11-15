function [signalSpectrum, signalLength, samplingFrequency] = getSpectrum(signal)

% get spectrum of the windowed signal

% close all; clear all;
% 
% cd ~/Desktop/melFrequencyCepstrumProject/

[windowedSignal, samplingFrequency] = getWindowedSignal(signal);

signalLength = length(windowedSignal);
N = 2 ^ nextpow2(2 * signalLength);
signalSpectrum = abs(fft(windowedSignal, N)) .^ 2;

% frequency = 0:(length(signalSpectrum) - 1);
% frequency = frequency .* (samplingFrequency/length(signalSpectrum));

% mel = 1127 * log(1 + (frequency./700));
% figure, stem(mel, signalSpectrum); axis tight;

end