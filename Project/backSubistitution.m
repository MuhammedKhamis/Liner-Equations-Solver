function [solutions] = backSubistitution( gaussArray)
length=size(gaussArray);
rowCounter=length(1);
variables(1)=0;
count=2;
while (count<=length(1))
    variables=[variables;0];
    count=count+1;
end

while(rowCounter>0)
    columnCounter=length(2)-1;
    sumOfTerms=0;
    while (columnCounter>rowCounter)
        temp=gaussArray(rowCounter,columnCounter)*variables(columnCounter);
        sumOfTerms=sumOfTerms+temp;
        columnCounter=columnCounter-1;
    end
    variables(rowCounter)=(gaussArray(rowCounter,length(2))-sumOfTerms)/gaussArray(rowCounter,rowCounter);
    rowCounter=rowCounter-1; 
end
solutions=variables;
end

