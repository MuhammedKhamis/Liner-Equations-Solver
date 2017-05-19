function [ ] = printOutputFile( fileName, table)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    %fileName = strcat('C:\Users\amrmh_000\Desktop\outputs\',fileName);
    fileName = strcat(pwd,strcat('\',fileName));
    fileID = fopen(fileName,'wt');
    [r,c] = size(table);
    colNames = getColNames(double((c-2)/3));
    
    fprintf(fileID,'      %s  ',colNames{1});
    for i= 2 : length(colNames)
        endd = 8;
        if i > double((c-2)/3)+2
            endd = 6;
        end    
        for j=1:endd
            fprintf(fileID,'%s',' ');
        end
        fprintf(fileID,'%s  ',colNames{i});
    end
    
    for i=1:r
        fprintf(fileID,'\n');
        for j=1:c
            fprintf(fileID,'%10f   ',double(table(i,j)));
        end
    end
    
    fclose(fileID);
end
