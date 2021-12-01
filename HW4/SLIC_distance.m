function num = SLIC_distance(point1, x1, y1, point2, x2, y2)
%Returns the distance in five dimensions x, y, R, G, and B between point1
%and point2
num = point1.RGB_distance( point2 ) + ((x1-x2)^2 + (y1-y2)^2 )/2;

end

