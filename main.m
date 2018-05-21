function main
    trainFolder = 'Music/Train/';
        
    files = dir(trainFolder);
    features = [];
    classes = [];
    for idx = 1 : length(files)
        if ~files(idx).isdir
            audioname = files(idx).name;
            audioclass = strsplit(audioname,"_");
            audioclass = string(audioclass(1));
            feature = extractFeature(strcat(trainFolder,audioname));
            class = strings(length(feature),1);
            class(1:length(feature)) = audioclass;
            features = [features; feature];
            classes = [classes; class];
        end
    end
    
    knnModel = train(features, classes);
    
    saveCompactModel(knnModel,"Trained");
    
    disp("done");
end