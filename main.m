function main

    filename = "shapeofyou.mp3";
    frameSize = 32768;
    
    io = dsp.AudioFileReader(filename,"SamplesPerFrame",frameSize);
    songInfo = audioinfo(filename);
    totalFrames = floor(songInfo.TotalSamples / frameSize);    
    
    features = [];
    classes = [];
    for i = 1:totalFrames
        
        frame = io();
        frame = frame(:,1);
        
        features = [features; extractFeature(frame, songInfo.SampleRate)];
        classes = [classes; "pop"];
    end
    
    
    


end