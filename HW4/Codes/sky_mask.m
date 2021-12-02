function result = sky_mask(sky_words, ground_words, image_path)
%Returns a image where all sky pixels are hot pink and and all
%ground pixels are muddy brown.

%Setting up the fields
image = imread( image_path );
sky_words = double( sky_words );
ground_words = double( ground_words );
height = size( image, 1 );
width = size( image, 2);
result = uint8( zeros( height, width, 3) );
for y = 1:height
    for x = 1:width
        colors = reshape( double(image(y, x, :)), [], 3); %Colors will be a 1*1*3 array
        ground_dist = sqrt( sum( (ground_words - colors).^2, 2));
        sky_dist = sqrt( sum( (sky_words - colors).^2, 2));
        if min(sky_dist) < min(ground_dist)
            %Draw a sky pixel at RGB 255, 158, 253
            result(y, x, 1) = 255;
            result(y, x, 2) = 158;
            result(y, x, 3) = 253;
        else
            %Draw a ground pixel at RGB 168, 142, 101
            result(y, x, 1) = 168;
            result(y, x, 2) = 142;
            result(y, x, 3) = 101;
        end
    end
end

end

