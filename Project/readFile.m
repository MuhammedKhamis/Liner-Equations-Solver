function [error,equations,init1,toler1,iter1,init2,toler2,iter2] = readFile(fileName,pathName,handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if isequal(fileName,0)
        set(handles.comment_textArea,'String','User selected Cancel File');
        error = 1;
    else
        
        equations = {};
        init1 = '';
        toler1 = '';
        iter1 = '';
        init2 = '';
        toler2 = '';
        iter2 = '';
        
        error = 0;
        set(handles.comment_textArea,'String','Successfully selected file');
        file = fullfile(pathName,fileName)
        fileID = fopen(file);
        numberOfEquations = fscanf(fileID,'%d');
        indOfLine = 1;
        while ~feof(fileID)
            indOfLine = indOfLine + 1;
            if indOfLine <= numberOfEquations+1
                tline = fgetl(fileID);
                equations{indOfLine-1} = tline;
            else
                type = fgetl(fileID);
                if (strcmp(type,'initial'))
                    if (strcmp(init1,''))
                        init1 = fgetl(fileID);
                    else
                        init2 = fgetl(fileID);
                    end
                elseif (strcmp(type,'iterations'))    
                    if (strcmp(iter1,''))
                        iter1 = fgetl(fileID);
                    else
                        iter2 = fgetl(fileID);
                    end
                elseif (strcmp(type,'tolerance'))
                    if (strcmp(toler1,''))
                        toler1 = fgetl(fileID);
                    else
                        toler2 = fgetl(fileID);
                    end
                else
                    error = 1;
                end
            end        
        end
        fclose(fileID);
        
        set(handles.input_equations_textArea,'String',equations);
        set(handles.initial_values_txtArea,'String',init1);
        set(handles.tolerance_txtArea,'String',toler1);
        set(handles.iterations_txtArea1,'String',iter1);
        set(handles.initial_values_txtArea2,'String',init2);
        set(handles.tolerance_txtArea2,'String',toler2);
        set(handles.iterations_txtArea2,'String',iter2);
    end
end

