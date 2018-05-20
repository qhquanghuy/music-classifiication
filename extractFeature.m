

function feature = extractFeature(frame, fs)
    fftFrames = windowing(frame,1024,512, @(window) fft(window));
    rmsVal = rms(frame);
    rollOffF = mean(map2(fftFrames, @(fftFrame) spectralRollOff(fftFrame, fs)));
    centroid = mean(map2(fftFrames, @(fftFrame) spectralCentroid(fftFrame, fs)));
    flux = mean(spectralFlux(fftFrames));
    feature = [rmsVal rollOffF centroid flux];
end
