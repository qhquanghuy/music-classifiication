function windowing(frame,windowSize,windowStep, callback)
    frameLength = length(frame);
    totalSteps = ceil((frameLength - windowSize) / windowStep) + 1;
    hammingWin = hamming(windowSize);
    curPos = 1;
    for i = 1:totalSteps 
        range = curPos : windowSize + curPos - 1;
        callback(frame(range).*hammingWin,i,totalSteps);
        curPos = curPos + windowStep;
    end
    
end