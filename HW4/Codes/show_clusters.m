function show_clusters( clus )
%Prints out each point in the cluster.

for i = 1:size(clus, 2)
    clus(i).show();
end

end

