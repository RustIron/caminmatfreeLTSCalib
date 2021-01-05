%生成测试点集
    pairs = zeros(3,2,2000);
    distance_ground_truth = zeros(2000,1);
        cameraA = [1200 0 800;
               0 1200 600;
               0    0   1];
    for i = 1:2000
    distance_ = rand*200;
    pairs(:,:,i) = local_pair_generate(distance_);%复用local_pair_generate以生成三点对
    distance_ground_truth(i) = distance_;
    end
    pairs_after_trans = transform_(pairs);
    laser_dot = plane_project(cameraA,pairs_after_trans,0.1);%投影至像平面，角点方差0.1
%     save('test_distance_laser_dot',distance_ground_truth,laser_dot);