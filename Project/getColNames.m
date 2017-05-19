function [ colNames ] = getColNames( numberOfVariables )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    colNames = cell(1,numberOfVariables*3+2);

    colNames{1} = 'i';
    
    for i=1:numberOfVariables
        colNames{i+1} = strcat(strcat('x',num2str(i)),'i');
    end
    
    for i=1:numberOfVariables
        colNames{i+numberOfVariables+1} = strcat(strcat('x',num2str(i)),'i+1');
    end
    
    for i=1:numberOfVariables
        colNames{i+2*numberOfVariables+1} = strcat('Err',num2str(i));
    end
    
    colNames{3*numberOfVariables+2} = 'Time';
end

