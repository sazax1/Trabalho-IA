% Universidade Federal de Mato Grosso
% Instituto de Engenharia
%
% Funcao Octave/MATLAB que implementa o modelo de transicao do
% quebra-cabeca de oito pecas.
% A funcao recebe uma matriz __M__ que representa um estado do jogo 
% e uma pecaa __p_value__ a ser movimentada e devolve uma nova matriz 
% __nM__ com o estado do jogo apos a movimentacao.
%
% Uma execucao da funcao para 
%
% S = [4 1 3; 9 2 5; 7 8 6];
% p_value = 2;
%
% por exemplo, devolve o estado:
%
% [4 1 3; 2 9 5; 7 8 6]; 


function [ nM ] = do_move( M, p_value )

	blank_value = 9;
	p = find(M == p_value);
	blank_p = find(M == blank_value);

	nM = M;
	nM(p) = M(blank_p);
	nM(blank_p) = M(p);


end

