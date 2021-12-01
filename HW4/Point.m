classdef Point
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x
        y
    end
    
    methods
        function obj = Point(a,b)
            if nargin == 0
                a = -1;
                b = -1;
            end
            obj.x = a;
            obj.y = b;
        end
        
        function b = equals(self, other)
            b = self.x == other.x && self.y == other.y;
        end
        
        function out = toRGB(self, image)
            px = self.x;
            py = self.y;
            out = RGBPoint( image(py, px, 1), image(py, px, 2), image(py, px, 3));
        end
    end
end

