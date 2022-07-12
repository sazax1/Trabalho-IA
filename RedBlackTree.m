classdef RedBlackTree < handle

    properties (Access = private)
        k;                      
        root;                   
        nil;                   
    end
    
    
    
    methods (Access = public)

        function this = RedBlackTree()

            this.Clear();
        end
        

        function Insert(this,key,value)

            if (nargin == 2)
                x = RBTElement(key);
            else
                x = RBTElement(key,value);
            end
            x.size = 1; 
            this.k = this.k + 1;
            
            
            y = this.nil;
            z = this.root;
            while ~isnan(z)
                y = z;
                z.size = z.size + 1; % atualizar o tamanho
                if (x.key < z.key)
                    z = z.left;
                else
                    z = z.right;
                end
            end
            x.p = y;
            if isnan(y)
                this.root = x;
            elseif (x.key < y.key)
                y.left = x;
            else
                y.right = x;
            end
            x.left = this.nil;
            x.right = this.nil;
            x.color = true;
            
            
            this.InsertFixup(x);
        end
        
        %
        % deleta os elementos da arvore
        %
        function Delete(this,x)

            
            if ~isnan(x)
                % atualiza o comprimento
                this.k = this.k - 1;
                
                % Deleta o elemento
                orig_color = x.color;
                if isnan(x.left)
                    z = x.right;
                    this.Transplant(x,x.right);
                    this.TraverseUpwardPath(x.p); % atualizar o tamanho
                elseif isnan(x.right)
                    z = x.left;
                    this.Transplant(x,x.left);
                    this.TraverseUpwardPath(x.p); % atualizar o tamanho
                else
                    y = RedBlackTree.TreeMinimum(x.right);
                    this.TraverseUpwardPath(y.p); % atualizar o tamanho
                    orig_color = y.color;
                    z = y.right;
                    if (y.p == x)
                        z.p = y;
                    else
                        this.Transplant(y,y.right);
                        y.right = x.right;
                        y.right.p = y;
                    end
                    this.Transplant(x,y);
                    y.left = x.left;
                    y.left.p = y;
                    y.color = x.color;
                    y.size = y.left.size + y.right.size + 1; % atualizar o tamanho
                end
                
                
                if (orig_color == false)
                    this.DeleteFixup(z);
                end
            end
        end
        
       
        function keys = Sort(this)

            
            keys = RBTElement(1,zeros(this.k,1));
            RedBlackTree.InOrderTreeWalk(this.root,keys);
            keys = keys.value;
        end
        

        function bool = ContainsKey(this,key)

            
            bool = ~isnan(this.Search(key));
        end
        

        function x = Search(this,key)

            
            x = this.root;
            while (~isnan(x) && (key ~= x.key))
                if (key < x.key)
                    x = x.left;
                else
                    x = x.right;
                end
            end
        end
        
       

       
        function x = Minimum(this)
           
            
            x = RedBlackTree.TreeMinimum(this.root);
        end
        

        function y = NextSmallest(this,x) %#ok
            
            
            if ~isnan(x)
                if ~isnan(x.left)
                    y = RedBlackTree.TreeMaximum(x.left);
                else
                    y = x.p;
                    while (~isnan(y) && (x == y.left))
                        x = y;
                        y = y.p;
                    end
                end
            else
                y = nan;
            end
        end
        

        function x = Maximum(this)
           
            
            x = RedBlackTree.TreeMaximum(this.root);
        end
        
        
        function y = NextLargest(this,x) %#ok
            
            
            if ~isnan(x)
                if ~isnan(x.right)
                    y = RedBlackTree.TreeMinimum(x.right);
                else
                    y = x.p;
                    while (~isnan(y) && (x == y.right))
                        x = y;
                        y = y.p;
                    end
                end
            else
                y = nan;
            end
        end
        
        
        function x = Select(this,i)
            
            
            x = RedBlackTree.TreeSelect(this.root,i);
        end
        
        
        function r = Rank(this,x)
            
            
            r = x.left.size + 1;
            y = x;
            while (y ~= this.root)
                if (y == y.p.right)
                    r = r + y.p.left.size + 1;
                end
                y = y.p;
            end
        end
        
       
        function count = Count(this)
            
            
            count = this.k;
        end
        
        %
        % verifica arvore vazia
        %
        function bool = IsEmpty(this)
            
            
            if (this.k == 0)
                bool = true;
            else
                bool = false;
            end
        end
        
        %
        % limpa a arvore 
        %
        function Clear(this)
            
            
            this.k = 0;                    
            this.nil = RBTElement(nan);    
            this.root = this.nil;          
        end
    end  

    
    methods (Access = private)
       
        function Transplant(this,u,v)
            if isnan(u.p)
                this.root = v;
            elseif (u == u.p.left)
                u.p.left = v;
            else
                u.p.right = v;
            end
            v.p = u.p;
        end
        

        function LeftRotate(this,x)
            y = x.right;
            x.right = y.left;
            if ~isnan(y.left)
                y.left.p = x;
            end
            y.p = x.p;
            if isnan(x.p)
                this.root = y;
            elseif (x == x.p.left)
                x.p.left = y;
            else
                x.p.right = y;
            end
            y.left = x;
            x.p = y;
            y.size = x.size; % atualizar o tamanho
            x.size = x.left.size + x.right.size + 1; % atualizar o tamanho
        end

        
        function RightRotate(this,x)
            y = x.left;
            x.left = y.right;
            if ~isnan(y.right)
                y.right.p = x;
            end
            y.p = x.p;
            if isnan(x.p)
                this.root = y;
            elseif (x == x.p.right)
                x.p.right = y;
            else
                x.p.left = y;
            end
            y.right = x;
            x.p = y;
            y.size = x.size; % atualizar o tamanho
            x.size = x.left.size + x.right.size + 1; % atualizar o tamanho
        end
        

        function InsertFixup(this,x)
            while (x.p.color == true)
                if (x.p == x.p.p.left)
                    y = x.p.p.right;
                    if (y.color == true)
                        x.p.color = false;
                        y.color = false;
                        x.p.p.color = true;
                        x = x.p.p;
                    else
                        if (x == x.p.right)
                            x = x.p;
                            this.LeftRotate(x);
                        end
                        x.p.color = false;
                        x.p.p.color = true;
                        this.RightRotate(x.p.p);
                    end
                else
                    y = x.p.p.left;
                    if (y.color == true)
                        x.p.color = false;
                        y.color = false;
                        x.p.p.color = true;
                        x = x.p.p;
                    else
                        if (x == x.p.left)
                            x = x.p;
                            this.RightRotate(x);
                        end
                        x.p.color = false;
                        x.p.p.color = true;
                        this.LeftRotate(x.p.p);
                    end
                end
            end
            this.root.color = false;
        end
        

        function DeleteFixup(this,z)
            while ((z ~= this.root) && (z.color == false))
                if (z == z.p.left)
                    w = z.p.right;
                    if (w.color == true)
                        w.color = false;
                        z.p.color = true;
                        this.LeftRotate(z.p);
                        w = z.p.right;
                    end
                    if ((w.left.color == false) && (w.right.color == false))
                        w.color = true;
                        z = z.p;
                    else
                        if (w.right.color == false)
                            w.left.color = false;
                            w.color = true;
                            this.RightRotate(w);
                            w = z.p.right;
                        end
                        w.color = z.p.color;
                        z.p.color = false;
                        w.right.color = false;
                        this.LeftRotate(z.p);
                        z = this.root;
                    end
                else
                    w = z.p.left;
                    if (w.color == true)
                        w.color = false;
                        z.p.color = true;
                        this.RightRotate(z.p);
                        w = z.p.left;
                    end
                    if ((w.left.color == false) && (w.right.color == false))
                        w.color = true;
                        z = z.p;
                    else
                        if (w.left.color == false)
                            w.right.color = false;
                            w.color = true;
                            this.LeftRotate(w);
                            w = z.p.left;
                        end
                        w.color = z.p.color;
                        z.p.color = false;
                        w.left.color = false;
                        this.RightRotate(z.p);
                        z = this.root;
                    end
                end
            end
            z.color = false;
        end
        

        function TraverseUpwardPath(this,y)
            if ~isnan(y)
                y.size = y.size - 1; % atualizar o tamanho
                if (y ~= this.root)
                    this.TraverseUpwardPath(y.p);
                end
            end
        end
    end
    

    methods (Access = private, Static = true)
  
        function InOrderTreeWalk(x,keys)
            if ~isnan(x)
                RedBlackTree.InOrderTreeWalk(x.left,keys);
                keys.value(keys.key) = x.key;
                keys.key = keys.key + 1;
                RedBlackTree.InOrderTreeWalk(x.right,keys);
            end
        end
        
   
        function x = TreeMinimum(x)
            if ~isnan(x)
                while ~isnan(x.left)
                    x = x.left;
                end
            end
        end
        
        
    
        function x = TreeMaximum(x)
            if ~isnan(x)
                while ~isnan(x.right)
                    x = x.right;
                end
            end
        end
        
   
        function x = TreeSelect(x,i)
            if ~isnan(x)
                r = x.left.size + 1;
                if (i < r)
                    x = RedBlackTree.TreeSelect(x.left,i);
                elseif (i > r)
                    x = RedBlackTree.TreeSelect(x.right,i - r);
                end
            end
        end
    end
end
