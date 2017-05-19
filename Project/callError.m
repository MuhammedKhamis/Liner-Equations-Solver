function [handles] = callError( obj, messege, handless )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    handles = clearTables(handless);
    set(obj,'String',messege); 
end

