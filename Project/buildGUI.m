function [ handles ] = buildGUI( handless )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    %to remove old tables from old GUI
    if(size(getappdata(handless.figure1,'selected_item'))~=0)
        set(handless.table,'Visible','off');
        set(handless.table2,'Visible','off');
    end
    
    handles = handless;
    
    f = handles.figure1;
    %matrix table
    t = uitable('Parent',f,'Position',[60 60 400 300]);
    handles.table = t;
    set(t, 'RowName', []);
    set(t, 'ColumnName', []);
    set(t, 'ColumnWidth', 'auto');
    
    %iterative table
    t2 = uitable('Parent',f,'Position',[60 60 550 300]);
    handles.table2 = t2;
    set(t2, 'RowName', []);
    set(t2, 'ColumnName', []);
    set(t2, 'ColumnWidth', 'auto');

    
    %buttons
    set(handles.next_button,'Visible','off');
    set(handles.prev_button,'Visible','off');

    %tables
    set(handles.table,'Visible','off');
    set(handles.table2,'Visible','off');
    
    %menu
    if(size(getappdata(handles.figure1,'selected_item'))==0)
        setappdata(handles.figure1,'selected_item',1);
    end
    number = getappdata(handles.figure1,'selected_item');
    showView(handles,number);
    
    %reset
    handles = clearTables(handles);
    handles = clearInputFields(handles);
end

