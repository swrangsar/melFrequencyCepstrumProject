close all; clear all;

cd ~/Desktop/melFrequencyCepstrumProject/

speechSegment = 'a_pani.wav';
numberOfCoefficients = 20;
melFrequencyCepstrum = getMelFrequencyCepstrum(speechSegment, numberOfCoefficients);

figure(300); clf;
plot(melFrequencyCepstrum);
title(['Mel frequency cepstrum for /a/ in ''pani'' with ', num2str(numberOfCoefficients), ' coefficients']);
print('-dpng', 'plots/melCepstrum');