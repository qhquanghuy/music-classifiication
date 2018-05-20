function features = extractFeature(filename) 
%     filename = "shapeofyou.mp3";
    frameSize = 32768;
    
    io = dsp.AudioFileReader(filename,"SamplesPerFrame",frameSize);
    
    songInfo = audioinfo(filename); 
    totalFrames = floor(songInfo.TotalSamples / frameSize);    
    
    features = [];
    for i = 1:totalFrames
        
        frame = io();
        frame = frame(:,1);
        feature = extractFrameFeature(frame, songInfo.SampleRate);
        features = [features; feature];
    end
    
    
end