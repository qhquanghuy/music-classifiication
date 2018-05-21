function test(numberOfNeighbors)
    testFolder = 'Music/Test/';
    files = dir(testFolder);
    predictTable = table;
   
    model = loadCompactModel("Trained_F");
    model.NumNeighbors = numberOfNeighbors;
    for idx = 1 : length(files)
        if ~files(idx).isdir
            audioname = files(idx).name;
            audioclass = strsplit(audioname,"_");
            audioclass = string(audioclass(1));           
            feature = extractFeature(strcat(testFolder,audioname));
             
            [class, guitar, dantranh, piano] = counting(model.predict(feature));
            
            t = table;
            
            t.Name = string(audioname);
            t.Guitar = guitar.count;
            t.Dantranh = dantranh.count;
            t.Piano = piano.count;
            t.Predict = class;
            t.Actual = audioclass;
            predictTable = [predictTable;t];
        end
    end
    disp(predictTable)
end