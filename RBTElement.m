classdef RBTElement < handle





	properties (Access = public)
		key;            
        id;
        left = nan;      
        right = nan;    
        p = nan;        
        color = false;  
        size = 0;       
        value = [];     
    end
    

	methods (Access = public)

		function this = RBTElement(key,value)
    
          global id;
			% chave de inicialização
            this.key = key;
            this.id = id;
            id = id + 1;
            % definindo dados, se especificados 
            if (nargin == 2)
                this.value = value;
            end
        end
        

        function bool = isnan(this)
            bool = isnan(this.key);
        end
        
       
        function[bool] = eq(this, obj)
            bool = this.id == obj.id;
        end
        
        function[bool] = ne(this, obj)
            bool = this.id ~= obj.id;
        end
    end
    
     
end
