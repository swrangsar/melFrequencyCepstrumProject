function [preemphasizedSignal, samplingFrequency] = getPreemphasizedSignal(signal)

% get pre-emphasized signal

[y, samplingFrequency] = wavread(signal);
for k = 1:length(y)
    if k > 1
        y(k) = y(k) - (0.97*y(k-1));
    end
end
preemphasizedSignal = y;

end
