
Num_Positon =3;
length_target = 100;
num_of_exp = 50 ;
mean_err = zeros(num_of_exp,1);
std_err = zeros(num_of_exp,1);
%加载测试点集
load('test_distance_laser_dot.mat')
for i = 1:num_of_exp

%加载标定数据
    generate_calibration_data;%生成标定原始数据
%加载标定后的LTS模型
    generate_virtual_LTS;%利用优化方法标定虚拟相机
% load('LTS_model.mat')
   distance_estimate = laser_dot_2_3D_point(laser_dot,virtual_camera,plane);              
% 统计测试结果
   err = abs(distance_ground_truth - distance_estimate);
   mean_err(i) = mean(err);
end
% calibration_fail = mean_err>1;
% mean_err_remove_fail = mean_err;
% mean_err_remove_fail(calibration_fail) = [];
% mean_of_multi_exp = mean(mean_err_remove_fail);
% mean_err(calibration_fail) = mean_of_multi_exp;
