% Universidade Federal de Mato Grosso
% Instituto de Engenharia
%
% Funcao Octave/MATLAB que deve implementar o algoritmo A-estrela.
% A funcao deve receber uma matriz __M__ com estado inicial do quebra-cabeca o apontador para a funcao heuristica __h__ e devolver um noh de busca __n__ com o estado objetivo.
% 
% Para que seja possivel reconstruir o caminho percorrido ate a solucao,  cada numero produzido pelo algoritmo de busca deve conter uma referencia para o numero que o descobriu (i.e., noh visitado no passo anterior). 
%
% Para executar o algoritmo para um estado S com heuristica de hamming por exemplo pode-ser fazer:
% S = [4 1 3; 9 2 5; 7 8 6];
% node = astar(S, @hamming);
% 
% A variavel __error__ será utilizada para identificar jogos que nao possuem solucao. 
% 

    
function [n, error] = astar(M, h)
    conta_noh=0;%variável para contar a quantidade de nohs criada.
	error = 0;

	%Cria uma fila de prioridades vazia
	q = PriorityQueue() ;
	
	% Estado objetivo 
	obj = [1 2 3; 4 5 6; 7 8 9]; %o programa ira parar quando um estado objetivo for alcancado.
	
	% Cria um novo no __n__ com estado igual a matriz __M__ (estado inicial) e 
	% custo 0 (zero).
 	n = Node(M, 0);
	
	% Insere o noh __n__ na fila de prioridades __q__. O custo deste noh 
	% eh igual a n.f + h(n.State). __h__ eh um apontador para funcao heuristica
	% considerada
	q.insert(n.f+h(n.State), n);
	
    % Laco principal do algoritmo A-estrela - eh interrompido quando a fila ficar vazia
	while (~q.isempty())
	    % Remove um noh m com a menor prioridade na fila q
	    m = q.extractMin();   
      if isequal (m.State,obj) % compara se o estado eh igual ao objetivo
      n = m;
      break
      
    end
    
     %verifica se eh permitido fazer o movimento 
     moves = legal_moves(m.State); % utiliza a função legal_moves
     
     % cria um noh para o estado vizinho
     for i=1:size(moves, 1), 
       N = do_move(m.State, moves(i)); 
       N1 = Node(N, m.f+1);
       N1.Prev = m;
       %m.State
       %conta_noh=conta_noh+1;
       %verifica se o estado anterior eh nulo, caso positivo, esse noh eh o pai
       if isempty (m.Prev)
         q.insert(N1.f+1+h(N1.State), N1);
         conta_noh=conta_noh+1;
       else 
         
        % esse isequal verifica se o estado anterior eh igual ao atual
         if ~ isequal (N1.State,m.Prev.State)
           q.insert(N1.f+h(N1.State), N1);
           conta_noh=conta_noh+1;
   
         end
             
        end
        
      end
          
    end
    fprintf('Nohs criados:%d \n',conta_noh);
end

