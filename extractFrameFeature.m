

function feature = extractFrameFeature(frame, fs)
    fftFrames = windowing(frame,1024,512, @(window) fft(window));
    
    fftFrames( :, ~any(fftFrames,1) ) = []; 
    feature = [];
    if ~isempty(fftFrames)
        rmsVal = rms(frame);
        rollOffF = map2(fftFrames, @(fftFrame) spectralRollOff(fftFrame, fs));
        centroid = map2(fftFrames, @(fftFrame) spectralCentroid(fftFrame, fs));
        flux = spectralFlux(fftFrames);
        feature = [rmsVal mean(rollOffF) mean(centroid) mean(flux) std(rollOffF) std(centroid) std(flux)];
    end
    
end
