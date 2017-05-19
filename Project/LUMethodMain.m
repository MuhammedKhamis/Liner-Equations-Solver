function [solutionTable,finalMatrix,solutions,condition] = LUMethodMain(coefficient,results)
% This method used to solve system of linear equations simultaneously using LU Decomposition method.
%Input:
%            coefficient     This is a 2D matrix that contains the coefficients of the system that we want to solve.
%            results         A column matrix that contains the results of those equations of the system.        
%Output:
%            solutionTable   This contains the steps of decompsition of coefficient matrix to L and U matrcies.
%            finalMatrix     Contains the final values of the L and U.
%            solutions       A column matrix that contains the result values of the system.
%           condition        error flag indicates of anything went wrong during executing the method.
    tol = 1e-6;
    [decomp condition solutionTable pos results] = getLU(coefficient,tol,results);
    if(condition == 1)
        solutionTable = [];
        finalMatrix =[];
        solutions = [];
        return;
    end
    n = size(coefficient);
    [x, y] = substitude(decomp,pos,n(1),results);
    if(condition == 1)
        return;
    end
    finalMatrix = y;
    solutions = x;
   
    
    
    %output in file
    %fileName = strcat('C:\Users\amrmh_000\Desktop\outputs\',fileName);
    fileName = strcat(pwd,'\outputLUDecomposition.txt');
    fileID = fopen('outputLUDecomposition.txt','wt');
    [r,c] = size(solutionTable);
    original = coefficient;
    len = length(solutions);
    
    fprintf(fileID,'%4s\r\n','Matrix A');
    %original matrix
    for i = 1:len
        for j = 1:len
            fprintf(fileID,'%08.10f  ',double(original(i,j)));
        end
        fprintf(fileID,'\r\n');   
    end
    
    %steps to getting U
    for i = 1:len:(r-2*len)
        fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
        fprintf(fileID,'%s %d %s\r\n','Step' , floor(i/len)+1,'to get U');
        for ii = i:i+len-1
           for j = 1:c
               fprintf(fileID,'%08.10f  ',double(solutionTable(ii,j)));
           end
           fprintf(fileID,'\r\n');
       end
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    
    %U
    fprintf(fileID,'%4s\r\n','Matrix U');
    for i = (r-2*len+1):(r-len)
        for j = 1:c
            fprintf(fileID,'%08.10f  ',double(solutionTable(i,j)));
        end
        fprintf(fileID,'\r\n');
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    
    %L
    fprintf(fileID,'%4s\r\n','Matrix L');
    for i = (r-len+1):(r)
        for j = 1:c
            fprintf(fileID,'%08.10f  ',double(solutionTable(i,j)));
        end
        fprintf(fileID,'\r\n');
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');

    %Y solutions
    fprintf(fileID,'%s\r\n','Y Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%08.10f\r\n',double(finalMatrix(i,:)));
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');

       
    %X solutions
    fprintf(fileID,'%s\r\n','X Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%08.10f\r\n',double(solutions(i,:)));
    end
    
    fclose(fileID);
    
end