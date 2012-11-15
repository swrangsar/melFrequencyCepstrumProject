function melFrequencyCepstrum = getMelFrequencyCepstrum(speechSegment)

end



%% get spectrum of the windowed signal

function [signalSpectrum, signalLength] = getSpectrum(windowedSignal)

signalLength = length(windowedSignal);
N = 2 ^ nextpow2(2 * signalLength);
signalSpectrum = fft(windowedSignal, N);

end