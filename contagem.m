% Universidade Federal de Mato Grosso
%
% Funcao Octave/MATLAB que deve contar a quantidade de elementos
% com valor igual a 1 (um) em uma matriz __M__ de entrada.


function c = contagem( M )  % variavel c irá receber a quantidade de 1 contidos na matriz M 

c = size(find(M==1),1);


end

