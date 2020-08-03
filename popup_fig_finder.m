function popup_fig = popup_fig_finder(app, run_file_name, fig_name ,alwaysontop)

run(run_file_name); % run pop-up file
all_UIfigs = findall(0, 'HandleVisibility', 'off'); % find all currently running UI figures 

for i=1:length(all_UIfigs)
    
    if strcmp(all_UIfigs(i).Name, fig_name) == 1 % find the right UI figure
        break;
    end
    
end

popup_fig = all_UIfigs(i); % get the right figure handle
width_hight(1) = popup_fig.Position(3);
width_hight(2)= popup_fig.Position(4);
location = str2num(app.PopuppositionEditField.Value);

%if strcmp(run_file_name, 'intro_popup.mlapp') == 1
if strcmp(run_file_name, 'intro_popup.mlapp') == 1
    location(1) = location(1) + 158;
end

popup_fig.Position = [location(1), location(2), width_hight(1), width_hight(2)]; % locate pop-up figure where it should be

uifigureOnTop(popup_fig, alwaysontop); % perform always-on-top on the UI figure

warn = warning('query','last'); % find last warning (from the always-on-top function)
warning('off',warn.identifier); % disable the last warning (therfore it will apear only once)

end
