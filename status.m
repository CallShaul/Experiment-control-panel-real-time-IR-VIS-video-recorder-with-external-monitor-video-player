function err = status(app, status_text, status_color, draw, stop)

global viewer_is_running;

try
    
if status_color == 'r'
    app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
elseif status_color == 'g'
    app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
end

app.Status1.Value = sprintf('%s', status_text); % display text at status bar

if stop == 1
    app.StopButton.ButtonPushedFcn(1,1);
    err = 1; % announce error occurred
    viewer_is_running = 0; % stop frame grabber loop
else
    err = 0;
end

if draw == 1
    drawnow(); % updates callback functions
end

catch
    err = 1;
end

end