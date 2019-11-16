% Adaline Network -- OR implementation

dataSet = [ 0 0 ; 0 1 ; 1 0 ; 1 1 ];

biasFactor = 0; % (bias * biasW);

target = [ 0 1 1 1];
alpha = 0.1;

yIn = 0; 
currentInput = dataSet(2,:);


weights = [ 0 0 ];

error = [ 0 0 ];

sigmaE = 0;

iterations = 1;

x = 1;

epochs = 1;

while iterations <=4
    
    
    for i=1:1:2
        yIn = yIn + [dataSet(iterations,i) * weights(i)]; % yIn = bias + Sigma Xi * Wi;
    end
    
    yIn+=biasFactor;    
    
    for i=1:1:2
    
        weights(i) = weights(i) + alpha * (target(iterations) - yIn) * dataSet(iterations,i); % Wi(Old) + alpha*(T-yIn)*Xi;
        error(i) = (target(iterations) - yIn);
    end
    
    biasFactor = biasFactor + alpha * (target(iterations) - yIn);
    
    for i=1:1:2
        sigmaE+= error(i) * error(i);
    end    
    
    disp(weights);
    % disp(biasFactor);
    % disp(yIn);
    disp(error);
    disp(sigmaE);
    
    if ( sigmaE < 0.001 && error~=0)
         break;
     end
    
    sigmaE = 0;
    
    if( iterations == 4)
        iterations = 1;
        epochs+=1;
        fprintf("Epoch %d completed",epochs);
    end
    iterations+=1;
end    
