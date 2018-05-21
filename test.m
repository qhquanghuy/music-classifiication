function test(numberOfNeighbors)
    testFolder = 'Music/Test/';
    files = dir(testFolder);
    predictTable = table;
   
    model = loadCompactModel("Trained");
    model.NumNeighbors = numberOfNeighbors;
    for idx = 1 : length(files)
        if ~files(idx).isdir
            audioname = files(idx).name;
                       
            feature = extractFeature(strcat(testFolder,audioname));
             
            [class, guitar, dantranh, piano] = counting(model.predict(feature));
            
            t = table;
            
            t.Name = string(audioname);
            t.Guitar = guitar.count;
            t.Dantranh = dantranh.count;
            t.Piano = piano.count;
            t.Predict = class;
           
            predictTable = [predictTable;t];
        end
    end
    
%     function [edm, pop, piano, rock] = counting(result)
%         edm = sum(count(result,"EDM"));
%         pop = sum(count(result,"Pop"));
%         piano = sum(count(result,"Piano"));
%         rock = sum(count(result,"Rock"));
%         
%         
%         
%     end
    disp("done")
end