function [res] = getTityOrder(mat , pos)
    [r c] = size(mat);
    res = [];
    for i = 1 : r
        res = [res;mat(pos(i),:)];
    end
end