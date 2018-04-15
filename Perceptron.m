bias = 0;
max_iterations = 1000;
synaptic_weight = [];

X = load('data6.txt'); %Read data
Y = X(:,3);

for hk = 1:length(Y)
    if Y(hk) == 2
        Y(hk) = -1;
    end
    if Y(hk) == 4
        Y(hk) = 1;
    end
    if Y(hk) == 8
        Y(hk) = -1;
    end
end

TestData = X(1000 + 1:end,1:2);
Actual_TestResults = Y(1000 + 1:end);
TrainingData = X(1:1000,1:2);
TrainingResults = Y(1:1000);

[ synaptic_weights, weights_over_iterations ] = train_perceptron( TrainingData, TrainingResults, bias, max_iterations);
test_outcomes = (classify(TestData, bias, synaptic_weights));

correctCount = 0;
for l = 1: length(test_outcomes)
    if Actual_TestResults(l) == test_outcomes(l);
        correctCount = correctCount + 1;
    end
end

stext = sprintf('%d correct out of %d | %.2f%% success',correctCount, length(test_outcomes), correctCount/ length(test_outcomes)*100);
disp(stext);

figure(1)
subplot(2,1,1)
plot(weights_over_iterations);
legend('Synaptic Weight 0', 'Synaptic Weight 1');
title('Synaptic Weights');
subplot(2,1,2);

plot(test_outcomes,'*');
ylim([-2,2]);
title('Classification');