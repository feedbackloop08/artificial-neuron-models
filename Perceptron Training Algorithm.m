%Perceptron Training Algorithm

pattern = [ 1 1 1 -1 1 -1 1 1 1  ; 1 1 1 1 1 1 1 -1 -1 ;];
alpha = 1;
target = [ 1  -1 ];
index = 1;
weights = [ 0 0 0 0 0 0 0 0 0 ];
epochTarget = [ 0  0 ];
bias = 0;
yIn = 0;
x = 0;

summation = 0;

epoch = 1;

while true

    if x == 2
        epoch+=1;
        x = 0;
    end
    
    fprintf("Epoch= %d",epoch); fprintf("\n");
  
    x += 1;
    
    for i=1:9
        summation = summation +  pattern(index,i) * weights(i);
     end
    
    yIn = bias + summation;
    
    % PTA Activation Function .
    if yIn > 0
        yOut = 1;
    elseif yIn == 0
        yOut = 0;
    else
        yOut = -1;
    end    
    
    % Final Match .
    
    if yOut ~= target(index)
        epochTarget(index) = 0;
    else 
        epochTarget(index) = 1;
        
    end
    
    if (epochTarget(1) == 1 && epochTarget(2) == 1)
        disp("Matched");
        break;
    end    
        
    
    % Weight updation
    
        for i=1:9
            weights(i) = weights(i) + alpha * target(index) * pattern(index,i);
        end
        
        bias = bias + alpha * target(index);    
    
    % Pattern Switch 

    summation = 0;
    
    disp("Weights = ") , disp(weights)
    fprintf("yOut = %d",yOut); disp("");
    
    index = index+1;
      if index == 3
        index = 1;
      end  
    
end 
