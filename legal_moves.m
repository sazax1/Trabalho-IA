% Universidade Federal de Mato Grosso
%
% Funcao Octave/MATLAB que implementa a descricao das ações validas em 
% um estado do quebra-cabeca de oito pecas.
% A funcao recebe uma matriz __Satte__ que representa um estado do jogo 
% e devolve um vetor coluna __moves__ com todas as pecas que podem ser 
% movimentadas neste estado.
%

function [ moves ] = legal_moves( State )

	blank_value = 9;
	adj = [0 1 0; 1 0 1; 0 1 0]; 

	mask = conv2(double(State==blank_value), adj, 'same')>0; 
	moves = unique(State(mask));

end

