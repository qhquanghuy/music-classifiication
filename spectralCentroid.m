function C = spectralCentroid(fftFrame,Fs)
    N = length(fftFrame);
    halfN = N / 2;
    fftFrame = abs(fftFrame(1 : halfN));
    
    distribution = fftFrame / sum(fftFrame);
    f = (0 : halfN - 1) * (Fs / N);
    
    C = f * distribution;
    
end
