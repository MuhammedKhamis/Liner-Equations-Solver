function [x y] = substitude(A,pos,n,b)
    y = zeros(n,1);
    x = zeros(n,1);
    %Forward Sub
    y(pos(1)) = b(pos(1));
    for i = 2 : n 
       total = b(pos(i));
       for j = 1 : i-1
           total = total - y(pos(j))* A(pos(i),j);
       end
       y(pos(i)) = total;
    end
    
    %Backward sub
    x(pos(n)) = y(pos(n))/A(pos(n),n);
    for i = n-1 : -1 : 1
        sum = y(pos(i));
        for j = i+1 : n
            sum = sum - A(pos(i),j)*x(pos(j));
        end
        x(pos(i)) = sum/A(pos(i),i);
    end
    
    y = getTityOrder(y,pos);
    x = getTityOrder(x,pos);

end