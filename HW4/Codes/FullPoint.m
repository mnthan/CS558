classdef FullPoint < RGBPoint
    %This point can handle x and y values as well as RGB values
    
    properties
        x
        y
    end
    
    methods
        function obj = FullPoint(new_r, new_g, new_b, new_x, new_y)
            %Constructs a new object of type fullpoint
            if nargin == 0
                new_r = 0;
                new_g = 0;
                new_b = 0;
                new_x = 0;
                new_y = 0;
            end
            obj@RGBPoint();
            obj = obj.setr( new_r );
            obj = obj.setg( new_g );
            obj = obj.setb( new_b );
            obj.x = new_x;
            obj.y = new_y;
        end
        
        function num = getx(self)
            num = self.x;
        end
        
        function num = gety(self)
            num = self.y;
        end
        
        function obj = set_x(self, X)
            self.x = X;
            obj = self;
        end
        
        function obj = set_y(self, Y)
            self.y = Y;
            obj = self;
        end
        
        function num = full_distance(self, rgb_point, px, py)
            num = SLIC_distance( self, self.x, self.y, rgb_point, px, py);
        end
        
        function num = distance(self, other)
            num = self.full_distance( other, other.getx(), other.gety() );
        end
        
        function show( self )
            fprintf(['R:%d, G:%d, B:%d, x:%d, y:%d, C:%d' char newline], self.getr(), self.getg(), self.getb(), self.getx(), self.gety(), self.getcluster() );
        end
    end
end

