function [ synaptic_weights, weights_over_iterations ] = train_perceptron( X, Y, bias, max_iterations)

[example_count, feature_count] = size(X);
synaptic_weights = zeros(1,feature_count);
weights_over_iterations = synaptic_weights;


for i = 1:max_iterations
    weights_changed = false;
    for j = 1:example_count
        t = X(j,:);
        p = dot(synaptic_weights, t);
        a = bias + p;
        if sign(Y(j)*a) ~= 1
            weights_changed = true;
            synaptic_weights = synaptic_weights + (Y(j) * X(j,:));
            bias = bias + Y(j);
        end
    end
    
    if weights_changed == false
        text = sprintf('Convergence at iteration: %d', i);
        disp(text);
        break;
    end
    
    tx = sprintf('Weight values at %d : %d, %d', i, synaptic_weights(1,1), synaptic_weights(1,2));
    disp(tx);
    weights_over_iterations = [weights_over_iterations; synaptic_weights];
    
    
end

if weights_changed == true
    text = sprintf('Convergence not reached in %d iterations... Dataset is not linearly separable?', i);
    disp(text);
end


end

