function [ predictions ] = classify( x_elements, bias, synaptic_weights )

predictions = [];

for i = 1:length(x_elements)

    prediction_t = classify_element(x_elements(i,:), bias, synaptic_weights);
    predictions = [predictions, prediction_t];
    
end

end

