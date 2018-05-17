function out = dft_music(signal)
    N = length(signal);
    
    if N >= 4 
        second = dft_music(signal(2:2:end)); 
        first = dft_music(signal(1:2:end));
        Wn = exp(-2*pi*1i*(0:N/2 - 1)'/N);
        tmp = Wn .* second;
        out = [(first + tmp);(first - tmp)];
        
    else
         switch N
            case 2
                out = [1 1; 1 -1] * signal;
            otherwise
                error("fuck");
        end
    end
end
