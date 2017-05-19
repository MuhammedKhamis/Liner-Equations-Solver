function [A,B,flag] = MatrixParser(data)
    A = [];
    B = []; 
    try
        cells = cellstr(data);
        cells = cellstr(strrep(cells(1:1:length(cells)),'=' , '=='));
        symbols = sym('x',[1 length(cells)]);
        [A, B] = equationsToMatrix(cells(1:1:length(cells)),symbols);
        
        flag = 1;
        for i=1:length(B)
            flag = logical(flag & (B(i)== double(B(i))));
        end;
        [r,c] = size(A);
        for i=1:r;
            for j=1:c;
                flag = logical(flag & (A(i,j)== double(A(i,j))));
            end;
        end;
    catch e
        flag = 0;
    end
end