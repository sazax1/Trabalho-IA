% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Funcao Octave/MATLAB que mostra o caminho percorrido em solucao do quebra-cabeca.
% A funcao recebe um noh de busca __node__ e mostra o caminho percorrido.
%

function reconstruct_path( node )
    
    if ~isempty(node),	
        if isempty(node.Prev),
            show(node.State);
        else
            reconstruct_path(node.Prev);
            show(node.State);
        end
    end
end

