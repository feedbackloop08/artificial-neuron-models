inputs = [ 0 1 ] ; inputWeight1 = [ 0.6  -0.1 ]; inputWeight2 = [ -0.3  0.4 ];
internalBias = [ 0.3  0.5];
hiddenWeights = [ 0.4 0.1 ];
externalBias = -0.2;
alpha = 0.25;
target = 1;
epochs = 1;

while epochs <= 100 
    
    zIn1 = dot(inputs,inputWeight1) + internalBias(1);
    zIn2 = dot(inputs,inputWeight2) + internalBias(2);
    zStore = [ zIn1 zIn2 ];
    zOut = [ binSigmoidal(zIn1) binSigmoidal(zIn2) ];
    
    yIn = dot(zOut,hiddenWeights) + externalBias;
    yOut = binSigmoidal(yIn);
    
    if yOut == target 
        disp("Nailed it -_-");
        break;
    end
    
    hiddenError = (target - yOut) * diffSigmoidal(yOut);
    
    spatialError = [ hiddenError * hiddenWeights(1) hiddenError * hiddenWeights(2) ] ; 
    
    externalBias += ( alpha * hiddenError );
    for i=1:2
        hiddenWeights(i) += ( alpha * hiddenError * zStore(i));
        inputError(i) = spatialError(i) * diffSigmoidal(zOut(i));
        internalBias(i) += alpha * inputError(i);  
        inputWeight1(i) += alpha * inputError(i) * inputs(i);
        inputWeight2(i) += alpha * inputError(i) * inputs(i);
    end
    epochs+=1;
end    

disp("Weights Of Internal Layer =");
disp(inputWeight1);
disp(inputWeight2);
disp("Weights Of Hidden Layer =");
disp(hiddenWeights);
disp("Internal Bias");
disp(internalBias);
disp("External Bias");
disp(externalBias);