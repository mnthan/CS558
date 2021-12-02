function center_mat = random_centers(image, k)
%Takes the given image and returns an array of k random RGBPoints inside it

%Image in the form of x * y * RGB -> double[0,1]
center_mat(k) = Point(1, 1); %Preallocate k occurences in the center_mat matrix
for i = 1:k
    y = randi( size( image, 1) );
    x = randi( size( image, 2) );
    center_mat(i) = Point( x, y );
end

%Make sure there are no duplicate points
for i = 1:k
    for j = i+1:k
        while( center_mat(i).equals(center_mat(j) ) )
            center_mat(i) = Point( randi( size( image, 1) ), randi( size( image, 2) ) );
        end
    end
end

center_mat = arrayfun( ( @(p) p.toRGB( image ) ), center_mat );

end %End of function

