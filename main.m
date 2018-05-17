function main

    filename = "shapeofyou.mp3";
    frameSize = 32768;
    
    io = dsp.AudioFileReader(filename,"SamplesPerFrame",frameSize);
    songInfo = audioinfo(filename);
    totalFrames = floor(songInfo.TotalSamples / frameSize);    
    
    
%     for i = 1:totalFrames
        
        frame = io();
        fftFrame = fftprocess(frame);
%         rmsVal = rms(frame);
%         rollOffPoint = 
%         centroid = spectralCentroid(fftFrame, songInfo.SampleRate);
%         flux = spectralFlux(fftFrame, songInfo.SampleRate);
%     end
    
    
    function fftSignals = fftprocess(frame)
        fftSignals = [];
        windowing(frame(:,1),1024,32, @handle);
        
        function handle(window,curI,totalSteps)
            if isempty(fftSignals)
                fftSignals = zeros(1024, totalSteps);
            end
            fftSignals(:,curI) = fft(window);
        end

    end




end