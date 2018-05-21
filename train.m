function trainedModel = train(features,classes)
    trainedModel = fitcknn(features,classes, 'NumNeighbors',3);
end