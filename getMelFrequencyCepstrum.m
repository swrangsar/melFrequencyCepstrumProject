function melFrequencyCepstrum = getMelFrequencyCepstrum(speechSegment, numberOfCoefficients)


[melWeightedSpectrum, signalLength] = getMelWeightedSpectrum(speechSegment);

if nargin < 2
    numberOfCoefficients = signalLength;
end

logMelWeightedSpectrum = log(melWeightedSpectrum);
melFrequencyCepstrum = dct(logMelWeightedSpectrum, numberOfCoefficients);

end