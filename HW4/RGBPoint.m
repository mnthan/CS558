classdef RGBPoint
    %Stores four integer values, RGB and cluster in a 32 bit integer
    %   RGB each take one byte, therefore the first 24 bites. The last byte
    %   is reserved for holding the cluster value.
    
    properties (Access = public)
        store uint32
    end
    
    methods
        function obj = RGBPoint(new_r, new_g, new_b)
            if nargin == 0
                obj.store = 0;
            else
                obj = RGBPoint();
                obj = obj.setr( new_r );
                obj = obj.setg( new_g );
                obj = obj.setb( new_b );
            end
        end
        
        function dis = RGB_distance( self, other )
            dis = (self.getr() - other.getr())^2 + (self.getg() - other.getg())^2 + (self.getb() - other.getb())^2;
        end
        
        function obj = set_cluster(self, num)
            self.store = bitand( self.store, 0x00FFFFFF );
            temp = bitshift( bitand(uint32(num), uint32(0xFF) ), 24);
            self.store = bitor( self.store, temp );
            obj = self;
        end
        
        function obj = setr(self, num)
            self.store = bitand( self.store, 0xFFFFFF00 );
            temp = bitand(uint32(num), uint32(0xFF) );
            self.store = bitor( self.store, temp );
            obj = self;
        end
        
        function obj = setg(self, num)
            self.store = bitand( self.store, 0xFFFF00FF );
            temp = bitshift( bitand(uint32(num), uint32(0xFF) ) , 8);
            self.store = bitor( self.store, temp );
            obj = self;
        end
        
        function obj = setb(self, num)
            self.store = bitand( self.store, 0xFF00FFFF );
            temp = bitshift( bitand(uint32(num), uint32(0xFF) ), 16);
            self.store = bitor( self.store, temp );
            obj = self;
        end
            
        function obj = set_black(self)
           self.store = bitand( self.store, 0xFF000000 );
           obj = self;
        end
        
        function num = getcluster(self)
            %Returns the cluster this point belongs to, 0 if none.
            num = double( bitshift( bitand(self.store,0xFF000000), -24) );
        end
        
        function num = getr(self)
            %Returns the r value of the point
            num = double( bitand(self.store,0x000000FF) );
        end
        
        function num = getg(self)
            %Returns the g value of the point
            num = double( bitshift( bitand(self.store,0x0000FF00), -8) );
        end
        
        function num = getb(self)
            %Returns the b value of the point
            num = double( bitshift( bitand(self.store,0x00FF0000), -16) );
        end
        
        function obj = find_cluster(self,clusters)
        %Returns the index of the Center that the point is closest to

            distance = arrayfun( @(clus) clus.RGB_distance( self ), clusters );

            %Find the minimum element of distance and it's index
            index = 1;
            min = distance(1);
            for i = 2:size( clusters, 2 )
                if distance(i) < min
                    index = i;
                    min = distance(i);
                end
            end
            obj = self.set_cluster( index );
        end
        
        function pnt = to_full_point(self, x, y)
            pnt = FullPoint( self.getr(), self.getg(), self.getb(), x, y);
        end
        
        function show( self )
            fprintf(['R:%d, G:%d, B:%d, C:%d' char newline], self.getr(), self.getg(), self.getb(), self.getcluster() );
        end
        
    end %End of methods
end

