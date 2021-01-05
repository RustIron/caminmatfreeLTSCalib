function Plane=target_plane(n,L)
for i = 1:n
    Plane(:,:,i)=local_pair_generate(L);
end