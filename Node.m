% Universidade Federal de Mato Grosso
% Instituto de Engenharia
%
% Classe Octave/MATLAB que implementa a descricao dos nohs de busca.
%
% Cada noh de contam uma referencia para o noh que o descobriu (i.e., noh visitado
% no passo anterior), o estado atual (i.e., configuracao da matriz) e 
% o numero de movimentos feitos ate o momento. 
%
% Para criar um novo noh de busca n:
% 
% n = Node(State, cost);
%
% em que State e cost correspondem, respectivamente, ao estado e ao custo
% do noh. O custo do noh e igual ao numero de passos efetivamente percorridos
% pelo algoritmo ate sua descoberta (i.e., o custo de um noh nao-raiz e
% 1 (um) mais o custo do noh que descobriu).
%
% a função abaixo indica que o noh n foi descoberto pelo noh p.
%
% n.Prev = p;
%



classdef Node < handle
    
    properties (GetAccess = public, SetAccess = public)
        State;
        f = 0;      
        Prev ;
       % conta_noh=0;
    end
    
    methods
        
        function self = Node(M, h) 
                       
            self.State = M;
            self.f = h;
            %self.conta_noh = g;
            
        end
               
        function[out] = get.State(self)
            out = self.State;
        end
        
        function[out] = get.Prev(self)
            out = self.Prev;
        end
        
        function[out] = get.f(self)
            out = self.f;
        end
        
 %       function[out] = get.conta_noh(self)
  %          out = self.conta_noh;
   %     end
        
        function[out] = eq(obj,obj2) 
            if length(obj2) > 1
               throw(MException('Node:eqMultiple','??? Cannot compare to multiple elements at once.'))
            end   
            out = strcmp(class(obj),class(obj2)) &&  sum(sum(obj.State == obj2.State)) == 9;   % obj2 deve ser da mesma classe
        end
        
                 
        function[out] = gt(obj,obj2) 
            if length(obj2) > 1
               throw(MException('Node:gtMultiple','??? Cannot compare to multiple elements at once.'))
            end  
            global option;
            
            if option == 1,            
              out = isa(obj2,'Node') && obj.f + hamming(obj.State) < obj2.f+hamming(obj2.State);
            else 
                out = isa(obj2,'Node') && obj.f + manhattan(obj.State) < obj2.f+manhattan(obj2.State);
            end
        end
        
    end
    
end
