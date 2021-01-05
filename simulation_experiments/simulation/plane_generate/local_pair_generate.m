function P=local_pair_generate(L)

x_range = 200;
y_range = 200;
start_point = [x_range*(-0.5+rand) y_range*(-0.5+rand)];

sin_theta = (-0.5+rand)*2;
rand_=rand;
cos_theta = (-0.5+rand_)/abs(-0.5+rand_)*sqrt(1-sin_theta^2);

end_point = [start_point(1)+L*cos_theta start_point(2)+L*sin_theta];

mid_point = (start_point+end_point)/2;

P=[start_point;
   mid_point;
   end_point;];
end
