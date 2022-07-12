% Universidade Federal de Mato Grosso
%
% Script Octave/MATLAB que deve ser utilizado para testar a implementacao


clear
clc

% Utilizado para comparar objetos %  
global id;
id = intmin;
% 
% Teste 1
M = [4 3 1; 9 2 5; 7 8 6];
[~, error] = astar(M, @manhattan);
assert(error == 1);
fprintf('Teste 1: OK\n');

% Teste 2
M = [9 1 3; 2 4 5; 7 8 6];
[~, error] = astar(M, @manhattan);
assert(error == 1);
fprintf('Teste 2: OK\n');

% Teste 3
M = [4 9 5; 3 8 6; 1 7 2];
[~, error] = astar(M, @manhattan);
assert(error == 1);
fprintf('Teste 3: OK\n');

% Teste 4
M = [5 3 2; 7 6 4; 8 1 9];
m = astar(M, @heuristic);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 4: OK\n');

% Teste 5
M = [4 6 7; 9 5 8; 2 1 3];
m = astar(M, @heuristic);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 5: OK\n');

fprintf('Sua implementacao esta correta\n');
