function trainedModel = train(features,classes)
    trainedModel = fitcknn(features,classes, 'NumNeighbors',4);
end