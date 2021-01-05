results_exp_mean = [];
length_target = 200;
for Num_Positon = 3:15
    simulation_experiment;
%     results_exp = [results_exp;multi_exp_err_mean,multi_exp_std_mean,multi_exp_fail_rate];
    results_exp_mean = [results_exp_mean,mean_err];
    display(['now_exp_on_num_pose ',num2str(Num_Positon)])
end

%% post process
load('test_number_of_pose.mat')
outlier_removed_result = zeros(500,13);
successful_rate = zeros(13,1);
for i = 1:13
mean_err = results_exp_mean(:,i);
calibration_fail = mean_err > 1;
mean_err_remove_fail = mean_err;
mean_err_remove_fail(calibration_fail) = [];
% mean_of_multi_exp = mean(mean_err_remove_fail);
% mean_err(calibration_fail) = mean_of_multi_exp;
outlier_removed_result(1:size(mean_err_remove_fail,1),i) = mean_err_remove_fail;
successful_rate(i) = 1-sum(calibration_fail)/500;
end