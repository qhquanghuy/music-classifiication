
    function [class, guitar, dantranh, piano] = counting(result)
        guitar.name = "Guitar";
        guitar.count = sum(count(result,"Guitar"));
        
        dantranh.name = "DanTranh";
        dantranh.count = sum(count(result,"DanTranh"));
        
        piano.name = "Piano";
        piano.count = sum(count(result,"Piano"));
              
        tmp = [guitar dantranh piano];
        tmp2 = [guitar.count dantranh.count piano.count];
        tmp2Max = max(tmp2);
        
        class = '';        
        for index = 1 : length(tmp) 
            if tmp(index).count == tmp2Max
                class = tmp(index).name;
            end
        end
        
        
    end

    