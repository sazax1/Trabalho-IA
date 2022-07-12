% Universidade Federal de Mato Grosso
%
%Funcao Octave/MATLAB que deve implementar uma nova heuristica.
% A funcao deve receber uma matriz __S__ com um estado do quebra-cabeca 
% e devolver uma estimativa (__dist__) da quantidade de movimentos 
% necessarios para se chegar no objetivo.



function [ dist ] = heuristic( State )
    
  E= State; 
  obj = [1 2 3; 4 5 6; 7 8 9];% definimos o estado objetivo
  dist = 0;
  
  for i = 1:8
        [a ,b ] = find(obj==i);% encontramos a posição do numero na matriz objetivo
        [x ,y] = find(E==i);% encontramos a posição do numero na matriz estado
        
        if (abs(a-x) ~= 0)% realizamos a comparacao da posicao , caso seja igual,
                          % significa que ja esta na linha correta
          dist = dist + 1;% caso não seja igual , soma uma unidade de distância
        end
        
        if(abs(b-y) ~= 0)% realizamos a comparacao da posicao , caso seja igual,
                          % significa que ja esta na coluna correta
          dist = dist + 1;% caso não seja igual , soma uma unidade de distância
        end
  end
end 

