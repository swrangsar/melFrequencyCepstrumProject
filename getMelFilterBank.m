function melFilterBank = getMelFilterBank(samplingFrequency, NFFT, filterCount)

% % samplingFrequency = 8000;
% % NFFT = 512;
% % filterCount = 20;

maximumFrequency = samplingFrequency/2;
maximumMelFrequency = 1127 * log(1 + (maximumFrequency/700));

edgeMelFrequencies = ((0:(filterCount + 1))./(filterCount + 1)) * maximumMelFrequency;
edgeFrequencies = 700 * (exp(edgeMelFrequencies ./ 1127) - 1);
edgeBins = round((edgeFrequencies ./ maximumFrequency) * (NFFT / 2));
edgeBins(1) = 1; % just correcting the first bin since it can't be zero

if edgeBins(2) == 0
    error('Cannot create so many filters for this NFFT!');
end

melFilterBank = zeros(filterCount, NFFT/2);

for k = 1:filterCount
    leftEdge = edgeBins(k);
    centerEdge = edgeBins(k + 1);
    rightEdge = edgeBins(k + 2);
    
    binsInLeftSlope = centerEdge - leftEdge;
    binsInRightSlope = rightEdge - centerEdge;
    
    melFilterBank(k, leftEdge:centerEdge) = (0:binsInLeftSlope) ./ binsInLeftSlope;
    melFilterBank(k, centerEdge:rightEdge) = (binsInRightSlope:-1:0) ./ binsInRightSlope;
    
end

figure('Name', 'melFilterBank'); clf;
plot(melFilterBank');
title(['Mel Filter Bank for NFFT =', num2str(NFFT), ' with ', num2str(filterCount), ' filters']);
print('-dpng', 'plots/melFilterBank');


end