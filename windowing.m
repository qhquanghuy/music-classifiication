function wFFT = windowing(frame,windowSize,windowStep, callback)
    frameLength = length(frame);
    totalSteps = ceil((frameLength - windowSize) / windowStep) + 1;
    hammingWin = hamming(windowSize);
    curPos = 1;
    
    wFFT = zeros(windowSize, totalSteps);
    
    for i = 1:totalSteps 
        range = curPos : windowSize + curPos - 1;
        wFFT(:,i) = callback(frame(range).*hammingWin);
        curPos = curPos + windowStep;
    end
    
end