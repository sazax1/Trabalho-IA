% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Script Octave/MATLAB que deve ser utilizado para testar a implementacao.


clear
clc

% Utilizado para comparar objetos %  
global id;
id = intmin;
% %
tic 
% o numero '9' representa o espaco em branco.

% TESTE 1 - MATRIZ [1 2 3; 4 5 6; 7 9 8] - 1 movimentacao
%state = astar([1 2 3; 4 5 6 ; 7 9 8], @heuristic);
%state = astar([1 2 3; 4 5 6 ; 7 9 8], @hamming);
%state = astar([1 2 3; 4 5 6 ; 7 9 8], @manhattan);


% TESTE 2 - MATRIZ [4 3 1; 5 9 2; 7 8 6] - 10 movimentacoes
%state = astar([4 3 1; 5 9 2; 7 8 6], @heuristic);
%state = astar([4 3 1; 5 9 2; 7 8 6], @hamming);
%state = astar([4 3 1; 5 9 2; 7 8 6], @manhattan);

% TESTE 3 - MATRIZ [1 2 4; 8 9 3; 7 6 5] - 14 movimentacoes
%state = astar([1 2 4; 8 9 3; 7 6 5], @heuristic);
%state = astar([1 2 4; 8 9 3; 7 6 5], @hamming);
%state = astar([1 2 4; 8 9 3; 7 6 5], @manhattan);

% TESTE 4 - MATRIZ [4 5 9; 8 6 3; 7 1 2] - 24 movimentacoes
%state = astar([4 5 9; 8 6 3; 7 1 2], @heuristic);
state = astar([4 5 9; 8 6 3; 7 1 2], @hamming);
%state = astar([4 5 9; 8 6 3; 7 1 2], @manhattan);
state
toc

