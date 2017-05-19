function [ handles ] = clearInputFields( handles )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    set(handles.input_equations_textArea,'String','');
    
    set(handles.iterations_txtArea1,'String','');
    set(handles.initial_values_txtArea,'String','');
    set(handles.tolerance_txtArea,'String','');
    
    set(handles.iterations_txtArea2,'String','');
    set(handles.initial_values_txtArea2,'String','');
    set(handles.tolerance_txtArea2,'String','');

end

