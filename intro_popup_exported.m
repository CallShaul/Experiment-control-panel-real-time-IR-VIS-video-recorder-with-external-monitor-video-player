classdef intro_popup_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        IntroPopupUIFigure  matlab.ui.Figure
        ButtonGroup         matlab.ui.container.ButtonGroup
        Button_male         matlab.ui.control.RadioButton
        Button_female       matlab.ui.control.RadioButton
        Label_3             matlab.ui.control.Label
        DropDown_age        matlab.ui.control.DropDown
        ButtonGroup_2       matlab.ui.container.ButtonGroup
        Button_hetro        matlab.ui.control.RadioButton
        Button_homo         matlab.ui.control.RadioButton
        Button_bi           matlab.ui.control.RadioButton
        Button_no_ans       matlab.ui.control.RadioButton
        Label_5             matlab.ui.control.Label
        Button_ok           matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button_ok
        function Button_okPushed(app, event)
            
            global feedback;
            
            [age, sex, orientation] = collect_intro_feedback(app);
            
            if ~isempty(feedback)

                feedback.age = age;
                feedback.sex = sex;
                feedback.orientation = orientation;
                
                closereq;
            
            end
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create IntroPopupUIFigure and hide until all components are created
            app.IntroPopupUIFigure = uifigure('Visible', 'off');
            app.IntroPopupUIFigure.Position = [600 100 545 285];
            app.IntroPopupUIFigure.Name = 'Intro Pop-up';
            app.IntroPopupUIFigure.Resize = 'off';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.IntroPopupUIFigure);
            app.ButtonGroup.TitlePosition = 'centertop';
            app.ButtonGroup.Title = 'מין';
            app.ButtonGroup.FontWeight = 'bold';
            app.ButtonGroup.FontSize = 16;
            app.ButtonGroup.Position = [192 137 161 55];

            % Create Button_male
            app.Button_male = uiradiobutton(app.ButtonGroup);
            app.Button_male.Text = 'זכר';
            app.Button_male.Position = [108 5 41 22];
            app.Button_male.Value = true;

            % Create Button_female
            app.Button_female = uiradiobutton(app.ButtonGroup);
            app.Button_female.Text = 'נקבה';
            app.Button_female.Position = [17 5 51 22];

            % Create Label_3
            app.Label_3 = uilabel(app.IntroPopupUIFigure);
            app.Label_3.HorizontalAlignment = 'center';
            app.Label_3.FontSize = 16;
            app.Label_3.FontWeight = 'bold';
            app.Label_3.Position = [300 208 25 22];
            app.Label_3.Text = 'גיל';

            % Create DropDown_age
            app.DropDown_age = uidropdown(app.IntroPopupUIFigure);
            app.DropDown_age.Items = {'18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80'};
            app.DropDown_age.Editable = 'on';
            app.DropDown_age.BackgroundColor = [1 1 1];
            app.DropDown_age.Position = [220 208 68 22];
            app.DropDown_age.Value = '18';

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.IntroPopupUIFigure);
            app.ButtonGroup_2.TitlePosition = 'centertop';
            app.ButtonGroup_2.Title = 'נטייה מינית';
            app.ButtonGroup_2.FontWeight = 'bold';
            app.ButtonGroup_2.FontSize = 16;
            app.ButtonGroup_2.Position = [37 61 472 55];

            % Create Button_hetro
            app.Button_hetro = uiradiobutton(app.ButtonGroup_2);
            app.Button_hetro.Text = 'הטרוסקסואל';
            app.Button_hetro.Position = [385 5 81 22];
            app.Button_hetro.Value = true;

            % Create Button_homo
            app.Button_homo = uiradiobutton(app.ButtonGroup_2);
            app.Button_homo.Text = 'הומוסקסואל';
            app.Button_homo.Position = [264 5 78 22];

            % Create Button_bi
            app.Button_bi = uiradiobutton(app.ButtonGroup_2);
            app.Button_bi.Text = 'ביסקסואל';
            app.Button_bi.Position = [147 5 67 22];

            % Create Button_no_ans
            app.Button_no_ans = uiradiobutton(app.ButtonGroup_2);
            app.Button_no_ans.Text = 'מעדיף לא לענות';
            app.Button_no_ans.Position = [11 5 97 22];

            % Create Label_5
            app.Label_5 = uilabel(app.IntroPopupUIFigure);
            app.Label_5.HorizontalAlignment = 'center';
            app.Label_5.FontSize = 16;
            app.Label_5.FontWeight = 'bold';
            app.Label_5.Position = [175 252 196 22];
            app.Label_5.Text = 'אנא ענה/י על השאלות הבאות';

            % Create Button_ok
            app.Button_ok = uibutton(app.IntroPopupUIFigure, 'push');
            app.Button_ok.ButtonPushedFcn = createCallbackFcn(app, @Button_okPushed, true);
            app.Button_ok.FontSize = 14;
            app.Button_ok.FontWeight = 'bold';
            app.Button_ok.Position = [223 19 100 24];
            app.Button_ok.Text = 'אישור';

            % Show the figure after all components are created
            app.IntroPopupUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = intro_popup_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.IntroPopupUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.IntroPopupUIFigure)
        end
    end
end