function [ out_val ] = classify_element( x_element, bias, synaptic_weight )

out_val = (sign(bias + dot(synaptic_weight, x_element)));

end
