% Batch Mode Of learning.
% Hebbian learning with covariant hypothesis.

P1 = [ 1 -1 1 1 ];
P2 = [ 1 -1 -1 -1];

weights = [ 0 0 0 0 ];

P_ = 0;

biasWeight = 0;
biasFactor = 0;

patternPointer = P1;


yOut = [ 1 -1 ]; %intended Output Expected
Y_ = 0;
inputs = length(weights);


for x=1:1:length(yOut)
    Y_ = Y_ + yOut(x);
end

Y_ = Y_ / length(yOut);

deltaW = 0;

index = 1;

step = 1;

while (step<5)
        
        for i=1:1:inputs
                P_ = P_ + patternPointer(i);
        end
        
        P_ = P_/inputs;

        for b=1:1:inputs
        
            deltaW = (patternPointer(b) - P_) * ( yOut(index) - Y_);
            
            weights(b) = weights(b) + deltaW;
            
            biasFactor = biasFactor + deltaW;
            disp(deltaW);            
        end   
        
        if (patternPointer == P1)
            patternPointer = P2;
            index = 2;
        else
            patternPointer = P1;
            index = 1;
        end    
        P_ = 0;
        step+=1;
        
        
        disp(weights);
                if (deltaW == 0 )
                    disp(patternPointer)
                break;
                end
        
end        