function fluxes = spectralFlux(fftFrames)
    [rows, cols] = size(fftFrames);
    fftFrames = abs(fftFrames);
    halfN = rows / 2;
    fluxes = zeros(cols - 1,1);
    
    for idx = 1 : cols - 1
        fluxes(idx) = sum((fftFrames(1:halfN,idx + 1) - fftFrames(1:halfN, idx)).^2);
    end
    
end