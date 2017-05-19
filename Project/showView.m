function [ handles ] = showView( handles , selected_item)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    switch selected_item
        case 1
            flags = {'on','on','on','on','on','on','on','on','on','on','on','on','off','off','off','off'};
            
        case 2
            flags = {'off','off','off','off','off','off','off','off','off','off','off','off','on','on','on','off'};
            
        case 3
            flags = {'off','off','off','off','off','off','off','off','off','off','off','off','on','on','on','off'};
        
        case 4            
            flags = {'off','off','off','off','off','off','off','off','off','off','off','off','on','on','on','off'};
        
        case 5
            flags = {'off','off','off','off','on','on','on','on','on','on','off','off','off','off','off','on'};
        
        case 6
            flags = {'off','off','off','off','on','on','on','on','on','on','off','off','off','off','off','on'};
        
        otherwise
    end
    
    flag = flags;
    set(handles.initial_values_label2,'Visible',char(flag(1)));
    set(handles.initial_values_txtArea2,'Visible',char(flag(2)));
    set(handles.tolerance_label2,'Visible',char(flag(3)));
    set(handles.tolerance_txtArea2,'Visible',char(flag(4)));
    set(handles.initial_values_label,'Visible',char(flag(5)));
    set(handles.initial_values_txtArea,'Visible',char(flag(6)));
    set(handles.tolerance_label,'Visible',char(flag(7)));
    set(handles.tolerance_txtArea,'Visible',char(flag(8)));
    set(handles.iterations_label1,'Visible',char(flag(9)));
    set(handles.iterations_txtArea1,'Visible',char(flag(10)));
    set(handles.iterations_label2,'Visible',char(flag(11)));
    set(handles.iterations_txtArea2,'Visible',char(flag(12)));
    
    %buttons
    set(handles.next_button,'Visible',char(flag(13)));
    set(handles.prev_button,'Visible',char(flag(14)));

    %tables
    set(handles.table,'Visible',char(flag(15)));
    set(handles.table2,'Visible',char(flag(16)));
    
end

