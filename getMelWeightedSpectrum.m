function [melWeightedSpectrum, signalLength] = getMelWeightedSpectrum(signal, filterCount)

% % 
% % signal = 'a_pani.wav';
% % filterCount = 20;

[signalSpectrum, signalLength, samplingFrequency] = getSpectrum(signal);
NFFT = length(signalSpectrum);

melFilterBank = getMelFilterBank(samplingFrequency, NFFT, filterCount);

melWeightedSpectrum = zeros(filterCount, 1);

for k = 1:filterCount
    columnisedSignalSpectrum = signalSpectrum(:);
    columnisedMelFilterBank = melFilterBank(k, :)';
    melFilteredSpectrum = columnisedSignalSpectrum(1:(NFFT/2)) .* columnisedMelFilterBank;
    melWeightedSpectrum(k) = sum(melFilteredSpectrum(:));
end

figure('Name', 'Mel weighted spectrum'); clf;
plot(melWeightedSpectrum);
title('Mel weighted spectrum');
print('-dpng', 'plots/melWeightedSpectrum');


end