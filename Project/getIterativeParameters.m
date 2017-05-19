function [initial,toler,itera,flag] = getIterativeParameters( handles, option, len)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    flag = 1;
    
    try
        if option ==1
            itera = get(handles.iterations_txtArea1,'String');
            initial = get(handles.initial_values_txtArea,'String');
            toler = get(handles.tolerance_txtArea,'String');
        else
            itera = get(handles.iterations_txtArea2,'String');
            initial = get(handles.initial_values_txtArea2,'String');
            toler = get(handles.tolerance_txtArea2,'String');
        end
    catch e
        flag = 0;
        return
    end
    
    if(isempty(itera))
        itera = 50;
    else
        itera = str2num(itera);
        flag = logical(flag & (itera == double(itera))& (double(itera)>=1));
    end;

    if(isempty(toler))
        toler = .00001;
    else
        toler = str2num(toler);
        flag = logical(flag & (toler == double(toler)) & (double(toler)>0));
    end;

    if(isempty(initial))
        initial = zeros(1,len);
    else
        initial = strsplit(initial,' ');
        for i=1:length(initial)
            initiall(1,i) = str2num(char(initial(1,i)));
        end
        if(logical(logical(flag & (initiall == double(initiall)))&logical(flag & (length(initiall)==len))))
            flag = 1;
        else
            flag = 0;
        end;
        initial = initiall;
    end;
end