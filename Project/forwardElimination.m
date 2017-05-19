function [solutionTable,finalMatrix,condition] = forwardElimination(augumentedMatrix)
help=augumentedMatrix;
length=size(help);
diagonalCounter=1;
flag=0;
intialize=0;
%{condition=0 for no error ,condition=1 for division by 0%}
%{solutions is the values of x's%}
while (diagonalCounter<length(1)&&flag==0)
        maxCounter = diagonalCounter;
        rowCounter=diagonalCounter+1;
        max=abs(help(diagonalCounter,diagonalCounter));
        while( rowCounter<=length(1))
            if (abs(help(rowCounter,diagonalCounter))>max)
                maxCounter=rowCounter;
                max=abs(help(rowCounter,diagonalCounter));
            end
             rowCounter= rowCounter+1;
        end
        if (maxCounter~=diagonalCounter)
            columnCounter=diagonalCounter;
            while(columnCounter<=length(2))
                temp=help(diagonalCounter,columnCounter);
                help(diagonalCounter,columnCounter)=help(maxCounter,columnCounter);
                help(maxCounter,columnCounter)=temp;
                columnCounter=columnCounter+1;
            end
        end
        rowCounter=diagonalCounter+1;
        while (rowCounter<=length(1)&&flag==0)
            factor =-1*help(rowCounter,diagonalCounter)/help(diagonalCounter,diagonalCounter);
            columnCounter=diagonalCounter;
            while(columnCounter<=length(2))
                help(rowCounter,columnCounter)=help(diagonalCounter,columnCounter)*factor+help(rowCounter,columnCounter);
                columnCounter=columnCounter+1;
            end
            if (intialize==0)
                solutionTable =help; 
                intialize=1;
            else
                 solutionTable=[solutionTable;help];
            end
            if (help(diagonalCounter+1,diagonalCounter+1)==0)
                 flag=1;
            end
             rowCounter= rowCounter+1;
        end
        diagonalCounter=diagonalCounter+1;
   
end
condition=flag;
finalMatrix=help;
end