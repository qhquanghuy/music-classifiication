function rollOff = spectralRollOff(fftFrame,fs)
    percentage = 0.85;  
    N1 = length(fftFrame);
    N2 = N1 / 2;
    f = abs(fftFrame(1:N2));  

    summed = sum(f);      
    rolloff = percentage * summed;  
    energy = 0;
    i = 1;
    while(energy <= rolloff)
        energy = energy + f(i);
        i = i+1;
    end

    rollOff = fs*i / N1;  

end