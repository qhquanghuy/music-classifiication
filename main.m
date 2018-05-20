function main

    filename = "shapeofyou.mp3";
    frameSize = 32768;
    
    io = dsp.AudioFileReader(filename,"SamplesPerFrame",frameSize);
    songInfo = audioinfo(filename);
    totalFrames = floor(songInfo.TotalSamples / frameSize);    
    
    
%     for i = 1:totalFrames
        
        frame = io();
        
        fftFrames = windowing(frame(:,1),1024,512, @(window) fft(window));
%         rmsVal = rms(frame);
%         rollOffPoint = 
        centroid = mean(map2(fftFrames, @(fftFrame) spectralCentroid(fftFrame, songInfo.SampleRate)));
%         flux = spectralFlux(fftFrame, songInfo.SampleRate);
%     end
    

    function ys = map2(xs, f)
        
        [rows, cols] = size(xs);
        ys = zeros(cols,1);
        for id = 1 : cols
            ys(id) = f(xs(:,id));
        end
        
    end


end