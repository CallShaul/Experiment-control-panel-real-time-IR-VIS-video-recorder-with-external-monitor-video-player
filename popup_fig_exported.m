classdef popup_fig_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        Popup_questionsUIFigure  matlab.ui.Figure
        ButtonGroup              matlab.ui.container.ButtonGroup
        posneg_1                 matlab.ui.control.RadioButton
        posneg_2                 matlab.ui.control.RadioButton
        posneg_3                 matlab.ui.control.RadioButton
        posneg_4                 matlab.ui.control.RadioButton
        posneg_5                 matlab.ui.control.RadioButton
        posneg_6                 matlab.ui.control.RadioButton
        posneg_7                 matlab.ui.control.RadioButton
        posneg_8                 matlab.ui.control.RadioButton
        posneg_9                 matlab.ui.control.RadioButton
        Label                    matlab.ui.control.Label
        Label_2                  matlab.ui.control.Label
        Label_3                  matlab.ui.control.Label
        ButtonGroup_2            matlab.ui.container.ButtonGroup
        wake_1                   matlab.ui.control.RadioButton
        wake_2                   matlab.ui.control.RadioButton
        wake_3                   matlab.ui.control.RadioButton
        wake_4                   matlab.ui.control.RadioButton
        wake_5                   matlab.ui.control.RadioButton
        wake_6                   matlab.ui.control.RadioButton
        wake_7                   matlab.ui.control.RadioButton
        wake_8                   matlab.ui.control.RadioButton
        wake_9                   matlab.ui.control.RadioButton
        feel_2                   matlab.ui.control.CheckBox
        feel_1                   matlab.ui.control.CheckBox
        feel_3                   matlab.ui.control.CheckBox
        feel_4                   matlab.ui.control.CheckBox
        feel_5                   matlab.ui.control.CheckBox
        Label_4                  matlab.ui.control.Label
        Button_8                 matlab.ui.control.Button
        feel_6                   matlab.ui.control.CheckBox
    end



    % Callbacks that handle component events
    methods (Access = private)

        % Callback function
        function ButtonPushed(app, event)
            
        end

        % Button pushed function: Button_8
        function Button_8Pushed(app, event)
            global feedback;
            
            [posneg, wake, feel] = collect_feedback(app);
            
            if ~isempty(feedback)
            
                len = length(feedback.posneg);
                
                if len == 1 && feedback.posneg == 0
                    len = 0; % remove initial zero
                end
    
                feedback.posneg(len + 1) = posneg;
                feedback.wake(len + 1) = wake;
                feedback.feel(len + 1, :) = feel;
    
                feedback.status = 0;
                
                closereq;
            
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create Popup_questionsUIFigure and hide until all components are created
            app.Popup_questionsUIFigure = uifigure('Visible', 'off');
            app.Popup_questionsUIFigure.Position = [100 100 860 325];
            app.Popup_questionsUIFigure.Name = 'Popup_questions';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.Popup_questionsUIFigure);
            app.ButtonGroup.TitlePosition = 'centertop';
            app.ButtonGroup.Title = 'חיובי ביותר                                                                     שלילי ביותר';
            app.ButtonGroup.FontWeight = 'bold';
            app.ButtonGroup.Position = [28 211 363 55];

            % Create posneg_1
            app.posneg_1 = uiradiobutton(app.ButtonGroup);
            app.posneg_1.Text = '1';
            app.posneg_1.Position = [11 9 27 22];

            % Create posneg_2
            app.posneg_2 = uiradiobutton(app.ButtonGroup);
            app.posneg_2.Text = '2';
            app.posneg_2.Position = [52 9 29 22];

            % Create posneg_3
            app.posneg_3 = uiradiobutton(app.ButtonGroup);
            app.posneg_3.Text = '3';
            app.posneg_3.Position = [92 9 29 22];

            % Create posneg_4
            app.posneg_4 = uiradiobutton(app.ButtonGroup);
            app.posneg_4.Text = '4';
            app.posneg_4.Position = [133 9 29 22];

            % Create posneg_5
            app.posneg_5 = uiradiobutton(app.ButtonGroup);
            app.posneg_5.Text = '5';
            app.posneg_5.Position = [169 9 29 22];
            app.posneg_5.Value = true;

            % Create posneg_6
            app.posneg_6 = uiradiobutton(app.ButtonGroup);
            app.posneg_6.Text = '6';
            app.posneg_6.Position = [210 9 29 22];

            % Create posneg_7
            app.posneg_7 = uiradiobutton(app.ButtonGroup);
            app.posneg_7.Text = '7';
            app.posneg_7.Position = [250 9 29 22];

            % Create posneg_8
            app.posneg_8 = uiradiobutton(app.ButtonGroup);
            app.posneg_8.Text = '8';
            app.posneg_8.Position = [285 9 29 22];

            % Create posneg_9
            app.posneg_9 = uiradiobutton(app.ButtonGroup);
            app.posneg_9.Text = '9';
            app.posneg_9.Position = [325 9 29 22];

            % Create Label
            app.Label = uilabel(app.Popup_questionsUIFigure);
            app.Label.FontSize = 16;
            app.Label.FontWeight = 'bold';
            app.Label.Position = [441 227 353 22];
            app.Label.Text = 'באיזה מידה הסרטון עורר בך תחושה חיובית \ שלילית';

            % Create Label_2
            app.Label_2 = uilabel(app.Popup_questionsUIFigure);
            app.Label_2.FontSize = 16;
            app.Label_2.FontWeight = 'bold';
            app.Label_2.Position = [416 143 388 22];
            app.Label_2.Text = 'באיזה מידה הסרטון עורר בך תחושה של עוררות פיזיולוגית';

            % Create Label_3
            app.Label_3 = uilabel(app.Popup_questionsUIFigure);
            app.Label_3.FontSize = 16;
            app.Label_3.FontWeight = 'bold';
            app.Label_3.Position = [411 77 394 22];
            app.Label_3.Text = 'מהו הרגש הדומיננטי ביותר שחווית בעקבות הצפייה בסרטון';

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.Popup_questionsUIFigure);
            app.ButtonGroup_2.TitlePosition = 'centertop';
            app.ButtonGroup_2.Title = 'מעורר מאוד                                                                לא מעורר בכלל';
            app.ButtonGroup_2.FontWeight = 'bold';
            app.ButtonGroup_2.Position = [28 127 363 55];

            % Create wake_1
            app.wake_1 = uiradiobutton(app.ButtonGroup_2);
            app.wake_1.Text = '1';
            app.wake_1.Position = [11 9 27 22];

            % Create wake_2
            app.wake_2 = uiradiobutton(app.ButtonGroup_2);
            app.wake_2.Text = '2';
            app.wake_2.Position = [52 9 29 22];

            % Create wake_3
            app.wake_3 = uiradiobutton(app.ButtonGroup_2);
            app.wake_3.Text = '3';
            app.wake_3.Position = [92 9 29 22];

            % Create wake_4
            app.wake_4 = uiradiobutton(app.ButtonGroup_2);
            app.wake_4.Text = '4';
            app.wake_4.Position = [133 9 29 22];

            % Create wake_5
            app.wake_5 = uiradiobutton(app.ButtonGroup_2);
            app.wake_5.Text = '5';
            app.wake_5.Position = [169 9 29 22];
            app.wake_5.Value = true;

            % Create wake_6
            app.wake_6 = uiradiobutton(app.ButtonGroup_2);
            app.wake_6.Text = '6';
            app.wake_6.Position = [210 9 29 22];

            % Create wake_7
            app.wake_7 = uiradiobutton(app.ButtonGroup_2);
            app.wake_7.Text = '7';
            app.wake_7.Position = [250 9 29 22];

            % Create wake_8
            app.wake_8 = uiradiobutton(app.ButtonGroup_2);
            app.wake_8.Text = '8';
            app.wake_8.Position = [285 9 29 22];

            % Create wake_9
            app.wake_9 = uiradiobutton(app.ButtonGroup_2);
            app.wake_9.Text = '9';
            app.wake_9.Position = [325 9 29 22];

            % Create feel_2
            app.feel_2 = uicheckbox(app.Popup_questionsUIFigure);
            app.feel_2.Text = 'פחד';
            app.feel_2.FontWeight = 'bold';
            app.feel_2.Position = [104 77 43 22];

            % Create feel_1
            app.feel_1 = uicheckbox(app.Popup_questionsUIFigure);
            app.feel_1.Text = 'גועל';
            app.feel_1.FontWeight = 'bold';
            app.feel_1.Position = [52 77 43 22];

            % Create feel_3
            app.feel_3 = uicheckbox(app.Popup_questionsUIFigure);
            app.feel_3.Text = 'שעשוע';
            app.feel_3.FontWeight = 'bold';
            app.feel_3.Position = [155 77 55 22];

            % Create feel_4
            app.feel_4 = uicheckbox(app.Popup_questionsUIFigure);
            app.feel_4.Text = 'תשוקה מינית';
            app.feel_4.FontWeight = 'bold';
            app.feel_4.Position = [222 77 86 22];

            % Create feel_5
            app.feel_5 = uicheckbox(app.Popup_questionsUIFigure);
            app.feel_5.Text = 'ניטרלי';
            app.feel_5.FontWeight = 'bold';
            app.feel_5.Position = [319 77 53 22];

            % Create Label_4
            app.Label_4 = uilabel(app.Popup_questionsUIFigure);
            app.Label_4.FontSize = 16;
            app.Label_4.FontWeight = 'bold';
            app.Label_4.Position = [390 293 73 22];
            app.Label_4.Text = 'שאלון קצר';

            % Create Button_8
            app.Button_8 = uibutton(app.Popup_questionsUIFigure, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Button_8.FontSize = 14;
            app.Button_8.FontWeight = 'bold';
            app.Button_8.Position = [381 15 100 24];
            app.Button_8.Text = 'אישור';

            % Create feel_6
            app.feel_6 = uicheckbox(app.Popup_questionsUIFigure);
            app.feel_6.Text = 'אף אחד מהרגשות הבאים';
            app.feel_6.FontWeight = 'bold';
            app.feel_6.Position = [133 39 146 22];

            % Show the figure after all components are created
            app.Popup_questionsUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = popup_fig_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.Popup_questionsUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.Popup_questionsUIFigure)
        end
    end
end