inputs = [ 1 1 ; 1 -1 ; -1 1 ; -1 -1 ; ];
internalBias1 = 0.3;
internalBias2 = 0.15;
inputWeights = [ 0.05 0.2 ; 0.1 0.2; ];
externalBias = 0.5;
externalWeights = [ 0.5 0.5 ];
targets = [ -1 1 1 -1 ];
alpha = 0.5;
epochs = 1;
iterations = 1;
output = [];
cnt = 0;

while true

    zIn1 = internalBias1 +  dot(inputs(iterations,:),inputWeights(1,:));
    zIn2 = internalBias2 +  dot(inputs(iterations,:),inputWeights(2,:));
    zOut = [ Activate(zIn1) Activate(zIn2) ];
    disp("zIn1 =")
    disp(zIn1)
    disp("zIn2 =")
    disp(zIn2)
    yIn = externalBias +  dot(zOut,externalWeights);
    yOut = Activate(yIn);
    output(iterations) = yOut;
    currentTarget = targets(iterations);
    
    if yOut ~= currentTarget
        
        delta1 = [alpha * (currentTarget - zIn1) * inputs(iterations,1) alpha * (currentTarget - zIn1) * inputs(iterations,2)];
        delta2 = [ alpha * (currentTarget - zIn2) * inputs(iterations,1) alpha * (currentTarget - zIn2) * inputs(iterations,2)];
        delta3 = alpha * (currentTarget - zIn1);
        delta4 = alpha * (currentTarget - zIn2);
        if currentTarget == 1
            if abs(zIn1 - 0) < abs(zIn2 - 0)    
                delta2 = [ 0 0 ] ;    
                delta4 = 0;
                disp("Yes");
            else 
                delta1 = [ 0 0 ];
                delta3 = 0;
            end
        end
        inputWeights(1,:) += delta1;
        inputWeights(2,:) += delta2;
        internalBias1 += delta3;
        internalBias2 += delta4;
    end
    
    iterations+=1;
    disp("Internal Weights = ");
    disp(inputWeights);
    fprintf("Input Biases are %d and %d \n\n",internalBias1,internalBias2);
    
   if (iterations == 5)
        
        iterations = 1;
        fprintf("[  Epoch  %d Completed ].................. \n\n",epochs);
        epochs+=1;
        comparison = output==targets;
        for i=1:4
            if comparison(i) == 1
                cnt+=1;
            end
        end
        if cnt == 5
            disp("Completed");
            break;
        end
    end 
end