function main
    trainFolder = 'Music/Test/';
    testFolder = 'Music/Test/';
    
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
    
    saveCompactModel(knnModel,"Trained1");
    

%     [features, classes] = extractFeature("shapeofyou.mp3");
%     features2 = extractFeature("tamtau_guitar.wav");
%     classes2(1:length(features2)) = "tam tau";
%    
%     features3 = extractFeature("HoaTau_SongFromASecretGarden.wav");
%     classes3(1:length(features3)) = "hoa tau";
%     
%     features4 = extractFeature("SongTau_WeDontTalkAnymoreCover-GuitarViolin.wav");
%     classes4(1:length(features4)) = "song tau";
%     
%     features5 = extractFeature("DocTau_Guitar_Soledad.wav");
%     classes5(1:length(features5)) = "doc tau";
%     
%     model = train([features; features2; features5],[classes; classes2'; classes5']);
%     


end