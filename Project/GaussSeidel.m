function [table,flagError] = GaussSeidel(A, b, x0, iterations, error)
time = tic;
flagError = 0;
try
    num_of_variables = size(A,2);
    for j = 1 : num_of_variables
        res(1) = 0;
        for k = 1 : num_of_variables
            if(k > j)
                res(1) = res(1) + A(j, k) * x0(k);
            elseif(k < j)
                res(1) = res(1) + A(j, k) * x(1,k);
            end
        end
        x(1,j) = (b(j) - res(1))/A(j,j);
        er(1,j) = 0;
    end
    table(1, 1) = 1;
    for j = 1 : num_of_variables
        table(1,j + 1) = x0(j);
    end
    for j = 1 : num_of_variables
        table(1,j + num_of_variables + 1) = x(1,j);
        if(isnan(x(1,j)) | isinf(x(1,j)))
            flagError = 1;
        end
    end
    for j = 1 : num_of_variables
        table(1,j + 2*num_of_variables + 1) = er(1,j);
    end
    table(1, 3*num_of_variables + 2) = toc(time);
    for i = 2 : iterations
        time = tic;
        for j = 1 : num_of_variables
            res = 0;
            for k = 1 : num_of_variables
                if(k > j)
                    res = res + A(j, k) * x(i-1,k);
                elseif(k < j)
                    res = res + A(j, k) * x(i,k);
                end

            end
            x(i,j) = (b(j) - res)/A(j,j);
            er(i,j) = abs(x(i,j) - x(i - 1,j));
        end
        table(i, 1) = i;
        for j = 1 : num_of_variables
            table(i,j + 1) = x(i-1, j);
            if(isnan(x(i - 1,j)) | isinf(x(i-1,j)))
                flagError = 1;
            end
        end
        for j = 1 : num_of_variables
            table(i,j + num_of_variables + 1) = x(i,j);
            if(isnan(x(i,j))| isinf(x(i,j)))
                flagError = 1;
            end
        end
        for j = 1 : num_of_variables
            table(i,j + 2*num_of_variables + 1) = er(i,j);
        end
        table(i, 3*num_of_variables + 2) = toc(time);
        flag = true;
        for j = 1 : num_of_variables
            if(er(i,j) > error)
                flag = false;
                break
            end
        end
        if (flag)
           break;
        end
    end
catch e
    flagError = 1;
    return;
end
           
    printOutputFile('outputGaussSeidel.txt',table);
end
