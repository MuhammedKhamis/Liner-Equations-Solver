function [solutionTable,finalMatrix,solutions,condition] = GaussJordan(coefficient,results)
[solutionTable,finalMatrix,condition]=forwardElimination(horzcat(coefficient,results));
if (condition==0)
    diagonalCounter=2;
    lengthh=size(finalMatrix);
    while(diagonalCounter<=lengthh(1))
        rowCounter=diagonalCounter-1;
        while (rowCounter>0)
            factor=-1*finalMatrix(rowCounter,diagonalCounter)/finalMatrix(diagonalCounter,diagonalCounter);
            columnCounter=diagonalCounter;
            while (columnCounter<=lengthh(2))
                finalMatrix( rowCounter,columnCounter)=factor* finalMatrix(diagonalCounter ,columnCounter)+ finalMatrix( rowCounter,columnCounter);
                 columnCounter=columnCounter+1;
            end
            solutionTable=[solutionTable;finalMatrix];
            rowCounter=rowCounter-1;
        end
        diagonalCounter=diagonalCounter+1;
    end
    count=2;
    variables(1)=0;
    while (count<=lengthh(1))
        variables=[variables;0];
        count=count+1;
    end
    diagonalCounter=1;
    while ( diagonalCounter<=lengthh(1))
       variables(diagonalCounter)=finalMatrix(diagonalCounter,lengthh(2))/finalMatrix(diagonalCounter,diagonalCounter);
       diagonalCounter=diagonalCounter+1; 
    end
    solutions=variables;
    
else
    solutions=0;
    return;
end

    %output in file
    %fileName = strcat('C:\Users\amrmh_000\Desktop\outputs\',fileName);
    fileName = strcat(pwd,'\outputGaussJordan.txt');
    fileID = fopen(fileName,'wt');
    fprintf(fileID,'%4s\r\n','Original Matrix');
    [r,c] = size(solutionTable);
    original = horzcat(coefficient,results);
    len = length(solutions);
    
    %original matrix
    for i = 1:len
        for j = 1:c
            if(j == c)
                    fprintf(fileID,'%s  ', '|');
            end
            fprintf(fileID,'%08.10f  ',double(original(i,j)));
        end
        fprintf(fileID,'\r\n');   
    end
    
    %steps
    for i = 1:len:r
        fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
        fprintf(fileID,'%s %d\r\n','Step' , floor(i/len)+1);
        for ii = i:i+len-1
           for j = 1:c
               if(j == c)
                    fprintf(fileID,'%s  ', '|');
               end
               fprintf(fileID,'%08.10f  ',double(solutionTable(ii,j)));
           end
           fprintf(fileID,'\r\n');
       end
    end
    fprintf(fileID,'%s\r\n','-------------------------------------------------------------------');
    
    %solutions
    fprintf(fileID,'%s\r\n','Solutions');
    for i = 1:length(solutions)
        fprintf(fileID,'%08.10f\r\n',double(solutions(i,:)));
    end
    
    fclose(fileID);
end

