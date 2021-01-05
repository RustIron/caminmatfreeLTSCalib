results_exp_mean = [];
Num_Positon = 12;
length_targets = [50,100,150,200,250,300];
for t = 1:6
    length_target = length_targets(t);
    simulation_experiment;
%     results_exp = [results_exp;multi_exp_err_mean,multi_exp_std_mean,multi_exp_fail_rate];
    results_exp_mean = [results_exp_mean,mean_err];
    display(['now_exp_on_target_length ',num2str(length_target)])
end
save('test_target_length','results_exp_mean')
%% post process
clc
clear
load('test_target_length.mat')
outlier_removed_result = zeros(500,6);
successful_rate = zeros(6,1);
for i = 1:6
mean_err = results_exp_mean(:,i);
calibration_fail = mean_err > 1;
mean_err_remove_fail = mean_err;
mean_err_remove_fail(calibration_fail) = [];
% mean_of_multi_exp = mean(mean_err_remove_fail);
% mean_err(calibration_fail) = mean_of_multi_exp;
outlier_removed_result(1:size(mean_err_remove_fail,1),i) = mean_err_remove_fail;
successful_rate(i) = 1-sum(calibration_fail)/500;
end