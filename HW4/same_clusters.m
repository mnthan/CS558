function [b, dis] = same_clusters(clus1, clus2, threshold)
%Compares to see if each argument is close enough to be considered the
%same. Returns true if the two point arrays have no distance difference
%above the threshold.

if size(clus2, 2) ~= size(clus2, 2)
    error("Sizes do not match")
end

b = true;
dis = zeros( size(clus1, 2), 1 );

for i = 1:size(clus1, 2)
    cur_dis = clus1(i).RGB_distance( clus2(i) );
    dis(i) = cur_dis;
    if cur_dis > threshold
        b = false;
    end
end
end

