% Universidade Federal de Mato Grosso
% Instituto de Engenharia
%
% Funcao Octave/MATLAB que implementa a heuristica de hamming.
% 
%



function [ dist ] = hamming( State )

	S = State';
	H = S(:) ~= [1:9]';
 
	dist = sum(H(:)) ;
 
	if dist > 1,
		dist = dist - 1;
	end
     
end

