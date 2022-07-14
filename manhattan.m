% Universidade Federal de Mato Grosso
%
% Funcao Octave/MATLAB que deve implementar a heuristica de manhattan.
% A funcao deve receber uma matriz __State__ representando um estado 
% qualquer do jogo e deve calcular a soma das distancias (horizontal e 
% vertical) de cada celula deste estado para a posicao que ela deveria 
% ocupar no estado objetivo.
%


function dist = manhattan(State)
        E = State; % variavel E recebe o estado
        obj = [1 2 3; 4 5 6; 7 8 9]; % o estado objetivo que deve ser alcancado
	    dist = 0;
        
        for i = 1:8 % laco que irá percorrer as 8 posicoes
        
            [a ,b ] = find(obj==i); % a e x representam linhas , b e y representam colunas
            [x ,y ] = find(E==i);   % compara se o objetivo e o estado ate que sejam iguais 
        
            dist = dist + abs(x-a) + abs(y-b); %distancia altual + a diferenca entre as distancias
        end % finaliza o laco,ou seja , a distancia ja esta calculada
end
