% Universidade Federal de Mato Grosso
% 
% Classe Octave/MATLAB que implementa a fila de prioridades.
% Para criar um fila de prioridades vazia:
% q = PriorityQueue() ;
% Para inserir um noh n com prioridade p em uma fila q ja criada:
% q.insert(p, n) ;
% Para remover um noh m com a menor prioridade:
% extracMin assim:
% m = q.extractMin();
% 



classdef PriorityQueue
    properties
        T
    end
    
    methods
        function this = PriorityQueue()
            this.T = RedBlackTree();
        end
        
        function insert(this, priority, node)
            this.T.Insert(priority, node);
        end
        
        function node = extractMin(this)
            elem = this.T.Minimum();
            node = elem.value;
            this.T.Delete(elem);      
            
        end
        
        function bool = isempty(this)
            bool = this.T.IsEmpty() ;
        end
    end
    
end

