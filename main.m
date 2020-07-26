classdef main < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ExperimentcontrolpanelUIFigure  matlab.ui.Figure
        RunButton                       matlab.ui.control.Button
        SaveSwitchLabel                 matlab.ui.control.Label
        SaveSwitch                      matlab.ui.control.Switch
        RGBcameraSwitchLabel            matlab.ui.control.Label
        RGBcameraSwitch                 matlab.ui.control.Switch
        Lamp                            matlab.ui.control.Lamp
        Lamp_3                          matlab.ui.control.Lamp
        PlayvideosSwitchLabel           matlab.ui.control.Label
        PlayvideosSwitch                matlab.ui.control.Switch
        VideofilesfolderEditFieldLabel  matlab.ui.control.Label
        VideofilesfolderEditField       matlab.ui.control.EditField
        FilenameEditFieldLabel          matlab.ui.control.Label
        FilenameEditField               matlab.ui.control.EditField
        FramerateDropDownLabel          matlab.ui.control.Label
        FramerateDropDown               matlab.ui.control.DropDown
        Lamp_4                          matlab.ui.control.Lamp
        LiveviewSwitchLabel             matlab.ui.control.Label
        LiveviewSwitch                  matlab.ui.control.Switch
        InitialintroscreenEditFieldLabel  matlab.ui.control.Label
        InitialintroscreenEditField     matlab.ui.control.NumericEditField
        PausetimeEditFieldLabel         matlab.ui.control.Label
        PausetimeEditField              matlab.ui.control.NumericEditField
        FinalthankyouscreenLabel        matlab.ui.control.Label
        FinalthankyouscreenEditField    matlab.ui.control.NumericEditField
        Lamp_5                          matlab.ui.control.Lamp
        ExitButton                      matlab.ui.control.Button
        VerifyVLCfullscreenCheckBox     matlab.ui.control.CheckBox
        Button_dir                      matlab.ui.control.Button
        ExperimentcontrolpanelLabel     matlab.ui.control.Label
        WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel  matlab.ui.control.Label
        PlaytimeLabel                   matlab.ui.control.Label
        PlaytimeDropDown                matlab.ui.control.DropDown
        LWIRcameraSwitchLabel           matlab.ui.control.Label
        LWIRcameraSwitch                matlab.ui.control.Switch
        Lamp_6                          matlab.ui.control.Lamp
        StopButton                      matlab.ui.control.Button
        PopuppositionEditFieldLabel     matlab.ui.control.Label
        PopuppositionEditField          matlab.ui.control.EditField
        QuestionsPopupCheckBox          matlab.ui.control.CheckBox
        DeviceDropDownLabel             matlab.ui.control.Label
        DeviceDropDown                  matlab.ui.control.DropDown
        CheckButton                     matlab.ui.control.Button
        ResolutionDropDownLabel         matlab.ui.control.Label
        ResolutionDropDown              matlab.ui.control.DropDown
        cameraRefresh                   matlab.ui.control.Button
        Button_crop                     matlab.ui.control.Button
        CroppingcoordinatesEditFieldLabel  matlab.ui.control.Label
        CroppingcoordinatesEditField    matlab.ui.control.EditField
        CropCheckBox                    matlab.ui.control.CheckBox
        StatusLabel                     matlab.ui.control.Label
        Status1                         matlab.ui.control.TextArea
        RGB2grayCheckBox                matlab.ui.control.CheckBox
        TimeLabel_2                     matlab.ui.control.Label
        Status2                         matlab.ui.control.Label
        FolderListBoxLabel              matlab.ui.control.Label
        FolderListBox                   matlab.ui.control.ListBox
        SecLabel                        matlab.ui.control.Label
        PlayerListBoxLabel              matlab.ui.control.Label
        PlayerListBox                   matlab.ui.control.ListBox
        Button_right                    matlab.ui.control.Button
        Button_left                     matlab.ui.control.Button
        Button_refresh_list             matlab.ui.control.Button
        StopafterCheckBox               matlab.ui.control.CheckBox
        EditField_stop                  matlab.ui.control.NumericEditField
        ButtonGroup                     matlab.ui.container.ButtonGroup
        SecondsButton_stop              matlab.ui.control.RadioButton
        FramesButton_stop               matlab.ui.control.RadioButton
        Label                           matlab.ui.control.Label
        WarmupCheckBox                  matlab.ui.control.CheckBox
        EditField_start                 matlab.ui.control.NumericEditField
        ButtonGroup_2                   matlab.ui.container.ButtonGroup
        SecondsButton_start             matlab.ui.control.RadioButton
        FramesButton_start              matlab.ui.control.RadioButton
        Label_2                         matlab.ui.control.Label
        ButtonGroup_4                   matlab.ui.container.ButtonGroup
        TemperatureButton               matlab.ui.control.RadioButton
        ColorButton                     matlab.ui.control.RadioButton
        SavewhileblackscreenCheckBoxave  matlab.ui.control.CheckBox
        Button_right_2                  matlab.ui.control.Button
        SetButton                       matlab.ui.control.Button
        DonotrecordonblackscreenCheckBox  matlab.ui.control.CheckBox
        MemoryallocationEditFieldLabel  matlab.ui.control.Label
        MemoryallocationEditField       matlab.ui.control.EditField
        MemoryallocationEditFieldLabel_2  matlab.ui.control.Label
        FramerateLabel                  matlab.ui.control.Label
        FPS_status                      matlab.ui.control.Label
        FPSLabel                        matlab.ui.control.Label
        Initial_BS_units                matlab.ui.control.Label
        Play_time_units                 matlab.ui.control.Label
        Pause_time_units                matlab.ui.control.Label
        Last_BS_units                   matlab.ui.control.Label
        RemarksEditFieldLabel           matlab.ui.control.Label
        RemarksEditField                matlab.ui.control.EditField
        ButtonGroup_3                   matlab.ui.container.ButtonGroup
        OrderButton                     matlab.ui.control.RadioButton
        FilenameButton                  matlab.ui.control.RadioButton
        SavevideodatabyLabel            matlab.ui.control.Label
        FlagIRcameraonblackscreenCheckBox  matlab.ui.control.CheckBox
        FPSdelaycorrectorLabel          matlab.ui.control.Label
        FPSdelaycorrectorEditField      matlab.ui.control.EditField
        FPSdelaycorrectorstepEditFieldLabel  matlab.ui.control.Label
        FPSdelaycorrectorstepEditField  matlab.ui.control.EditField
        Lamp_7                          matlab.ui.control.Lamp
        NIRcameraSwitchLabel            matlab.ui.control.Label
        NIRcameraSwitch                 matlab.ui.control.Switch
        LWIRimageasLabel                matlab.ui.control.Label
        cameraRefresh_2                 matlab.ui.control.Button
        Button_crop_2                   matlab.ui.control.Button
        CropCheckBox_2                  matlab.ui.control.CheckBox
        RGB2grayCheckBox_2              matlab.ui.control.CheckBox
        DeviceDropDown_2Label           matlab.ui.control.Label
        DeviceDropDown_2                matlab.ui.control.DropDown
        ResolutionDropDown_2Label       matlab.ui.control.Label
        ResolutionDropDown_2            matlab.ui.control.DropDown
        CroppingcoordinatesEditField_2Label  matlab.ui.control.Label
        CroppingcoordinatesEditField_2  matlab.ui.control.EditField
        cameraRefresh_3                 matlab.ui.control.Button
        DeviceDropDown_3Label           matlab.ui.control.Label
        DeviceDropDown_3                matlab.ui.control.DropDown
        ResolutionDropDown_3Label       matlab.ui.control.Label
        ResolutionDropDown_3            matlab.ui.control.DropDown
        Button_left_2                   matlab.ui.control.Button
    end

    
    properties (Access = private)
        Property;
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
          %{
            load('lastrunvar','app');
            
            app.FilenameEditField.Value = app.Property.title; % file name to be saved
            app.PausetimeEditField.Value = app.Property.pauseTime; % black screen time between videos
            app.FinalthankyouscreenEditField.Value = app.Property.lastBlackScreen; % last black screen duration
            app.VideofilesfolderEditField.Value = app.Property.location;
            app.InitialintroscreenEditField.Value = app.Property.initialBlackScreen; % first black screen duration
            
            app.PlaytimeDropDown.Value = num2str(app.Property.playTime);
            app.FramerateDropDown.Value = num2str(app.Property.constantFrameRate);
            app.SaveSwitch.Value = app.Property.save_data;
            app.RGBcameraSwitch.Value = app.Property.VIS_camera;
            app.Property.live_view = app.LiveviewSwitch.Value;
            app.PlayvideosSwitch.Value = app.Property.playVideofiles;
            app.VerifyVLCfullscreenCheckBox.Value = app.Property.verifyFullscreen;
            app.DisplayFPSgraphCheckBox.Value = app.Property.dispCWstatus;
            %}
            
            %app.Property.app = app;
            
            web_cam_list = webcamlist;
            expected_device1 = 'USB Capture HDMI'; % RGB camera
            desired_resolution1 = '960x540';
            expected_device2 = 'HD USB Camera'; % NIR camera
            desired_resolution2 = '640x480';
            expected_device3 = 'PI IMAGER'; % IR camera
            
            devices_found = size(web_cam_list, 1);

            % VIS camera:
            app.DeviceDropDown.Items = web_cam_list;
 
            VIS_found = find(ismember(app.DeviceDropDown.Items, expected_device1), 1);
            if ~isempty(VIS_found)
                app.DeviceDropDown.Value = expected_device1;
            end

            VIS_cam = app.DeviceDropDown.Value;
            if ~strcmp(VIS_cam, expected_device3)
                try
                    cam = webcam(VIS_cam);
                    res = cam.AvailableResolutions;
                    app.ResolutionDropDown.Items = res;
                    clear('cam');
                    if ~isempty(VIS_found)
                        app.ResolutionDropDown.Value = desired_resolution1;
                    end
                catch
                    app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                    app.Status1.Value = sprintf('%s', 'Error connecting to VIS camera, or no camera connected to your system.');
                end
            end
            
            % NIR camera:
            app.DeviceDropDown_2.Items = web_cam_list;
            
            NIR_found = find(ismember(app.DeviceDropDown_2.Items, expected_device2), 1);
            if ~isempty(NIR_found)
                app.DeviceDropDown_2.Value = expected_device2;
            else
                for i=1:devices_found
                    if strcmp(app.DeviceDropDown_2.Value, app.DeviceDropDown.Value) || strcmp(app.DeviceDropDown_2.Value, expected_device3)
                        app.DeviceDropDown_2.Value = app.DeviceDropDown_2.Items(i);
                    else
                        break;
                    end
                end
            end

            NIR_cam = app.DeviceDropDown_2.Value;
            if strcmp(NIR_cam, expected_device3) || strcmp(NIR_cam, app.DeviceDropDown.Value)
                app.DeviceDropDown_2.Items(:) = [];            
            else
                try
                    cam = webcam(NIR_cam);
                    res = cam.AvailableResolutions;
                    app.ResolutionDropDown_2.Items = res;
                    clear('cam');
                    if ~isempty(NIR_found)
                        app.ResolutionDropDown_2.Value = desired_resolution2;
                    end
                catch
                    app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                    app.Status1.Value = sprintf('%s', 'Error connecting to NIR camera, or no camera connected to your system.');
                end
            end
            
            % LWIR camera:
            app.DeviceDropDown_3.Items = web_cam_list;
            
            LWIR_found = find(ismember(app.DeviceDropDown_3.Items, expected_device3), 1);
            if ~isempty(LWIR_found)
                app.DeviceDropDown_3.Value = expected_device3;
                
                VIS_found = find(ismember(app.DeviceDropDown_3.Items, expected_device1), 1);
                NIR_found = find(ismember(app.DeviceDropDown_3.Items, expected_device2), 1);
                
                try
                app.DeviceDropDown.Items(LWIR_found) = [];
                catch 
                end
                try
                app.DeviceDropDown_2.Items(LWIR_found) = [];
                catch
                end
                try
                app.DeviceDropDown_3.Items(VIS_found) = [];
                catch
                end
                try
                app.DeviceDropDown_3.Items(NIR_found) = [];
                catch
                end
                
                LWIR_cam = app.DeviceDropDown_3.Value;
                try
                    cam = webcam(LWIR_cam);
                    res = cam.AvailableResolutions;
                    app.ResolutionDropDown_3.Items = res;
                    clear('cam');
                catch
                    app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                    app.Status1.Value = sprintf('%s', 'Error connecting to LWIR camera, or no camera connected to your system.');
                end
                
            else
                app.DeviceDropDown_3.Items(:) = [];
            end

        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            
            if strcmp(app.RGBcameraSwitch.Value, 'Off') && strcmp(app.NIRcameraSwitch.Value, 'Off') && strcmp(app.LWIRcameraSwitch.Value, 'Off')
                
                status(app, 'No camera was selected at all, please select at least one camera.', 'r', 1, 0);
                
                app.Lamp_3.Color = 'g';
                app.Lamp_7.Color = 'g';
                app.Lamp_6.Color = 'g';
                pause(0.125);
                app.Lamp_3.Color = 'r';
                app.Lamp_7.Color = 'r';
                app.Lamp_6.Color = 'r';
                pause(0.125)
                app.Lamp_3.Color = 'g';
                app.Lamp_7.Color = 'g';
                app.Lamp_6.Color = 'g';
                pause(0.125);
                app.Lamp_3.Color = 'r';
                app.Lamp_7.Color = 'r';
                app.Lamp_6.Color = 'r';
                
            elseif strcmp(app.SaveSwitch.Value, 'Off') && strcmp(app.LiveviewSwitch.Value, 'Off')
                
                status(app, 'No live view was selected, or data to be saved, please choose one.', 'r', 1, 0);
                
                app.Lamp.Color = 'g';
                app.Lamp_4.Color = 'g';
                pause(0.125);
                app.Lamp.Color = 'r';
                app.Lamp_4.Color = 'r';
                pause(0.125);
                app.Lamp.Color = 'g';
                app.Lamp_4.Color = 'g';
                pause(0.125);
                app.Lamp.Color = 'r';
                app.Lamp_4.Color = 'r';
                
            elseif isempty(app.CroppingcoordinatesEditField.Value) && app.CropCheckBox.Value == 1
                
                status(app, 'No cropping cordinates provided, please provide.', 'r', 1, 0);
                
                app.CroppingcoordinatesEditField.BackgroundColor = 'r';
                pause(0.125);
                app.CroppingcoordinatesEditField.BackgroundColor = 'w';
                pause(0.125);
                app.CroppingcoordinatesEditField.BackgroundColor = 'r';
                pause(0.125);
                app.CroppingcoordinatesEditField.BackgroundColor = 'w';
                
            elseif strcmp(app.RGBcameraSwitch.Value, 'On') && isempty(app.DeviceDropDown.Value)
                
                status(app, 'Please choose a VIS camera.', 'r', 1, 0);
                
                app.DeviceDropDown.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown.BackgroundColor = 'w';
                pause(0.125);
                app.DeviceDropDown.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown.BackgroundColor = 'w';
                
            elseif strcmp(app.NIRcameraSwitch.Value, 'On') && isempty(app.DeviceDropDown_2.Value)
                
                status(app, 'Please choose a NIR camera.', 'r', 1, 0);
                
                app.DeviceDropDown_2.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown_2.BackgroundColor = 'w';
                pause(0.125);
                app.DeviceDropDown_2.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown_2.BackgroundColor = 'w';
                
            elseif strcmp(app.LWIRcameraSwitch.Value, 'On') && isempty(app.DeviceDropDown_3.Value)
                
                status(app, 'Please choose a LWIR camera.', 'r', 1, 0);
                
                app.DeviceDropDown_3.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown_3.BackgroundColor = 'w';
                pause(0.125);
                app.DeviceDropDown_3.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown_3.BackgroundColor = 'w';
                
            elseif strcmp(app.NIRcameraSwitch.Value, 'On') && strcmp(app.RGBcameraSwitch.Value, 'On')...
                    && strcmp(app.DeviceDropDown_2.Value, app.DeviceDropDown.Value)
                
                status(app, 'Cannot choose the same device as VIS and NIR camera.', 'r', 1, 0);
                
                app.DeviceDropDown.BackgroundColor = 'r';
                app.DeviceDropDown_2.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown.BackgroundColor = 'w';
                app.DeviceDropDown_2.BackgroundColor = 'w';
                pause(0.125);
                app.DeviceDropDown.BackgroundColor = 'r';
                app.DeviceDropDown_2.BackgroundColor = 'r';
                pause(0.125);
                app.DeviceDropDown.BackgroundColor = 'w';
                app.DeviceDropDown_2.BackgroundColor = 'w';
                
            elseif strcmp(app.PlayvideosSwitch.Value, 'On') && isempty(app.PlayerListBox.ItemsData)
                
                status(app, 'No videos to be played was selected, please add video files to the list.', 'r', 1, 0);
                
                app.PlayerListBox.BackgroundColor = 'r';
                pause(0.125);
                app.PlayerListBox.BackgroundColor = 'w';
                pause(0.125);
                app.PlayerListBox.BackgroundColor = 'r';
                pause(0.125);
                app.PlayerListBox.BackgroundColor = 'w';

                
            else % case everythings OK, prepare to run recorder function
                
                app.RunButton.Enable = 0;
                app.StopButton.Enable = 1;
                app.Status1.Value = ' ';
                app.Status2.Text = ' ';
                
                if strcmp(app.MemoryallocationEditField.Enable, 'on')
                %if app.MemoryallocationEditField.Enable == 1
                    app.Property.manual_memory_allocation = 1;
                    app.Property.allocation = uint32(str2double(app.MemoryallocationEditField.Value));
                else
                    app.Property.manual_memory_allocation = 0;
                end
                
                app.InitialintroscreenEditField.Enable = 0;
                app.InitialintroscreenEditFieldLabel.Enable = 0;
                app.PlaytimeDropDown.Enable = 0;
                app.PlaytimeLabel.Enable = 0;
                app.PausetimeEditField.Enable = 0;
                app.PausetimeEditFieldLabel.Enable = 0;
                app.FinalthankyouscreenEditField.Enable = 0;
                app.FinalthankyouscreenLabel.Enable = 0;
                app.VideofilesfolderEditField.Enable = 0;
                app.VideofilesfolderEditFieldLabel.Enable = 0;
                app.VerifyVLCfullscreenCheckBox.Enable = 0;
                app.Button_dir.Enable = 0;
                app.FilenameEditField.Enable = 0;
                app.FilenameEditFieldLabel.Enable = 0;
                app.MemoryallocationEditField.Enable = 0;
                app.MemoryallocationEditFieldLabel_2.Enable = 0;
                app.MemoryallocationEditFieldLabel.Enable = 0;
                app.FramerateDropDown.Enable = 0;
                app.FramerateDropDownLabel.Enable = 0;
                app.SaveSwitch.Enable = 0;
                app.PlayvideosSwitch.Enable = 0;
                app.RGBcameraSwitch.Enable = 0;
                app.LWIRcameraSwitch.Enable = 0;
                app.NIRcameraSwitch.Enable = 0;
                app.LiveviewSwitch.Enable = 0;
                app.QuestionsPopupCheckBox.Enable = 0;
                app.PopuppositionEditField.Enable = 0;
                app.PopuppositionEditFieldLabel.Enable = 0;
                app.CheckButton.Enable = 0;
                app.SetButton.Enable = 0;
                
                app.DeviceDropDown.Enable = 0;
                app.DeviceDropDownLabel.Enable = 0;
                app.ResolutionDropDown.Enable = 0;
                app.ResolutionDropDownLabel.Enable = 0;
                app.cameraRefresh.Enable = 0;
                app.CropCheckBox.Enable = 0;
                app.Button_crop.Enable = 0;
                app.CroppingcoordinatesEditField.Enable = 0;
                app.CroppingcoordinatesEditFieldLabel.Enable = 0;
                app.RGB2grayCheckBox.Enable = 0;
                
                app.DeviceDropDown_2.Enable = 0;
                app.DeviceDropDown_2Label.Enable = 0;
                app.ResolutionDropDown_2.Enable = 0;
                app.ResolutionDropDown_2Label.Enable = 0;
                app.cameraRefresh_2.Enable = 0;
                app.CropCheckBox_2.Enable = 0;
                app.Button_crop_2.Enable = 0;
                app.CroppingcoordinatesEditField_2.Enable = 0;
                app.CroppingcoordinatesEditField_2Label.Enable = 0;
                app.RGB2grayCheckBox_2.Enable = 0;
                
                app.DeviceDropDown_3.Enable = 0;
                app.DeviceDropDown_3Label.Enable = 0;
                app.ResolutionDropDown_3.Enable = 0;
                app.ResolutionDropDown_3Label.Enable = 0;
                app.cameraRefresh_3.Enable = 0;
                app.LWIRimageasLabel.Enable = 0;
                
                app.FolderListBox.Enable = 0;
                app.FolderListBoxLabel.Enable = 0;
                app.PlayerListBox.Enable = 0;
                app.PlayerListBoxLabel.Enable = 0;
                app.Button_right.Enable = 0;
                app.Button_right_2.Enable = 0;
                app.Button_left.Enable = 0;
                app.Button_left_2.Enable = 0;
                app.Button_refresh_list.Enable = 0;
                app.StopafterCheckBox.Enable = 0;
                app.EditField_stop.Enable = 0;
                app.SecondsButton_stop.Enable = 0;
                app.FramesButton_stop.Enable = 0;
                app.Label.Enable = 0;
                app.WarmupCheckBox.Enable = 0;
                app.EditField_start.Enable = 0;
                app.SecondsButton_start.Enable = 0;
                app.FramesButton_start.Enable = 0;
                app.Label_2.Enable = 0;
                app.TemperatureButton.Enable = 0;
                app.ButtonGroup_4.ForegroundColor = [0.65, 0.65, 0.65];
                app.ColorButton.Enable = 0;
                app.SavewhileblackscreenCheckBoxave.Enable = 0;
                app.OrderButton.Enable = 0;
                app.FilenameButton.Enable = 0;
                app.SavevideodatabyLabel.Enable = 0;
                app.DonotrecordonblackscreenCheckBox.Enable = 0;
                app.Initial_BS_units.Enable = 0;
                app.Play_time_units.Enable = 0;
                app.Pause_time_units.Enable = 0;
                app.Last_BS_units.Enable = 0;
                app.FlagIRcameraonblackscreenCheckBox.Enable = 0;
                app.FPSdelaycorrectorEditField.Enable = 0;
                app.FPSdelaycorrectorLabel.Enable = 0;
                app.FPSdelaycorrectorstepEditField.Enable = 0;
                app.FPSdelaycorrectorstepEditFieldLabel.Enable = 0;
                
                app.Property.desired_file_name = app.FilenameEditField.Value; % file name to be saved
                app.Property.pauseTime = app.PausetimeEditField.Value; % black screen time between videos
                app.Property.lastBlackScreen = app.FinalthankyouscreenEditField.Value; % last black screen duration
                app.Property.vids_hd_location = app.VideofilesfolderEditField.Value; % video files location on drive
                app.Property.initialIntroScreen = app.InitialintroscreenEditField.Value; % first black screen duration
                app.Property.delay_corrector_start = str2double(app.FPSdelaycorrectorEditField.Value);
                app.Property.delay_corrector_step = str2double(app.FPSdelaycorrectorstepEditField.Value);
                app.Property.RGB_camera2connect = app.DeviceDropDown.Value; % choose VIS camera
                app.Property.NIR_camera2connect = app.DeviceDropDown_2.Value; % choose VIS camera
                app.Property.LWIR_camera2connect = app.DeviceDropDown_3.Value; % choose VIS camera
                
                % Boolean options:
                app.Property.LWIR_tempORcolor = app.TemperatureButton.Value;
                app.Property.verifyFullscreen = app.VerifyVLCfullscreenCheckBox.Value; 
                app.Property.stop_after = app.StopafterCheckBox.Value;
                app.Property.saveONblack = app.SavewhileblackscreenCheckBoxave.Value;
                app.Property.do_not_record_on_black = app.DonotrecordonblackscreenCheckBox.Value;
                app.Property.warm_up = app.WarmupCheckBox.Value;
                app.Property.warm_up_duration = app.EditField_start.Value;
                app.Property.warm_up_unit_sec = app.SecondsButton_start.Value;
                app.Property.stop_after_unit_sec = app.SecondsButton_stop.Value;
                app.Property.questions_popup = app.QuestionsPopupCheckBox.Value;
                app.Property.crop = app.CropCheckBox.Value;
                app.Property.flag_IR_camera_on_black = app.FlagIRcameraonblackscreenCheckBox.Value;
                app.Property.RGB_camera2gray = app.RGB2grayCheckBox.Value;
                app.Property.NIR_camera2gray = app.RGB2grayCheckBox_2.Value;

                res_A = str2double(extractAfter(app.ResolutionDropDown.Value,"x"));
                res_B = str2double(extractBefore(app.ResolutionDropDown.Value,"x"));
                app.Property.RGB_resolution = [res_A, res_B];
                
                res_A = str2double(extractAfter(app.ResolutionDropDown_2.Value,"x"));
                res_B = str2double(extractBefore(app.ResolutionDropDown_2.Value,"x"));
                app.Property.NIR_resolution = [res_A, res_B];
                
                res_A = str2double(extractAfter(app.ResolutionDropDown_3.Value,"x"));
                res_B = str2double(extractBefore(app.ResolutionDropDown_3.Value,"x"));
                app.Property.LWIR_resolution = [res_A, res_B];
                
                if app.StopafterCheckBox.Value == 1
                    app.Property.stop_after_duration = uint32(app.EditField_stop.Value);
                else
                    app.Property.stop_after_duration = 0;
                end
                
                if strcmp(app.PlaytimeDropDown.Value, 'Auto')
                    app.Property.playTime = 0; % 0 for automatic mode, else enter a value
                else
                    app.Property.playTime = uint32(str2double(app.PlaytimeDropDown.Value));
                end
                
                if app.OrderButton.Value == 1
                    app.Property.save_vid_by_order = 1;
                else
                    app.Property.save_vid_by_order = 0;
                end
                
                if app.CropCheckBox.Value == 1
                    app.Property.RGB_crop_cor = app.CroppingcoordinatesEditField.Value;
                else
                    app.Property.RGB_crop_cor = 0;
                end
                
                if app.CropCheckBox_2.Value == 1
                    app.Property.NIR_crop_cor = app.CroppingcoordinatesEditField_2.Value;
                else
                    app.Property.NIR_crop_cor = 0;
                end
                
                if app.WarmupCheckBox.Value == 1
                    app.Property.warm_up = 1;
                    app.Property.warm_up_period = app.EditField_start.Value;
                    if app.SecondsButton_start.Value == 1
                        app.Property.warm_up_seconds = 1;
                    else
                        app.Property.warm_up_seconds = 0;
                    end
                else
                    app.Property.warm_up = 0;
                end
                
                if app.StopafterCheckBox.Value == 1
                    app.Property.force_end = 1;
                    app.Property.force_end_period = app.EditField_stop.Value;
                    if app.SecondsButton_stop.Value == 1
                        app.Property.force_end_seconds = 1;
                    else
                        app.Property.force_end_seconds = 0;
                    end
                else
                    app.Property.force_end = 0;
                end
                
                if strcmp(app.FramerateDropDown.Value, 'Max')
                    app.Property.constantFrameRate = 0; % 0 = max recording frame rate possible. else, enter any other positive number
                else
                    app.Property.constantFrameRate = str2double(app.FramerateDropDown.Value); % 0 = max recording frame rate possible. else, enter any other positive number
                end
                
                if strcmp(app.SaveSwitch.Value, 'On')
                    app.Property.save_data = 1; % 1 = yes, 0 = no
                    app.StopButton.Text = 'Save & Stop';
                    app.ExitButton.Text = 'Save & Exit';
                else
                    app.Property.save_data = 0; % 1 = yes, 0 = no
                    app.StopButton.Text = 'Stop';
                    app.ExitButton.Text = 'Exit';
                end
                
                if strcmp(app.RGBcameraSwitch.Value, 'On')
                    app.Property.RGB_camera = 1; % 1 = yes, 0 = no
                else
                    app.Property.RGB_camera = 0; % 1 = yes, 0 = no
                end
                
                if strcmp(app.NIRcameraSwitch.Value, 'On')
                    app.Property.NIR_camera = 1; % 1 = yes, 0 = no
                else
                    app.Property.NIR_camera = 0; % 1 = yes, 0 = no
                end
                
                if strcmp(app.LWIRcameraSwitch.Value, 'On')
                    app.Property.LWIR_camera = 1; % 1 = yes, 0 = no
                else
                    app.Property.LWIR_camera = 0; % 1 = yes, 0 = no
                end
                
                if strcmp(app.LiveviewSwitch.Value, 'On')
                    app.Property.live_view = 1; % 1 = yes, 0 = no
                else
                    app.Property.live_view = 0; % 1 = yes, 0 = no
                end
                
                if strcmp(app.PlayvideosSwitch.Value, 'On')
                    app.Property.playVideofiles = 1; % 1 = yes, 0 = no
                else
                    app.Property.playVideofiles = 0; % 1 = yes, 0 = no
                end

                if app.QuestionsPopupCheckBox.Value == 1
                    app.Property.popup = 1;
                    app.Property.pos = app.PopuppositionEditField.Value; % send popup position
                else
                    app.Property.popup = 0;
                end
                
                % save('lastrunvar','-v7.3','app'); % saves configuration status
                
                recorder(app, app.Property); % calls the recorder function

            end
        end

        % Button pushed function: ExitButton
        function ExitButtonPushed(app, event)
            
            global viewer_is_running;
            viewer_is_running = 0;
            
            closereq
        end

        % Value changed function: SaveSwitch
        function SaveSwitchValueChanged(app, event)
            value = app.SaveSwitch.Value;
            
            if strcmp(value, 'On')
                app.Lamp.Color = 'g';
                app.FilenameEditField.Enable = 1;
                app.FilenameEditFieldLabel.Enable = 1;
                app.RemarksEditField.Enable = 1;
                app.RemarksEditFieldLabel.Enable = 1;
                
                if ~strcmp(app.FramerateDropDown.Value, 'Max')
                    app.FPSdelaycorrectorEditField.Enable = 1;
                    app.FPSdelaycorrectorLabel.Enable = 1;
                    app.FPSdelaycorrectorstepEditField.Enable = 1;
                    app.FPSdelaycorrectorstepEditFieldLabel.Enable = 1;
                end
                
                if strcmp(app.PlayvideosSwitch.Value, 'On')
                    
                    if app.DonotrecordonblackscreenCheckBox.Value == 1
                        app.SavewhileblackscreenCheckBoxave.Enable = 1;
                        app.OrderButton.Enable = 1;
                        app.FilenameButton.Enable = 1;
                        app.SavevideodatabyLabel.Enable = 1;
                    end
                    
                    if app.DonotrecordonblackscreenCheckBox.Value == 1 && strcmp(app.LWIRcameraSwitch.Value, 'On')
                        app.FlagIRcameraonblackscreenCheckBox.Enable = 1;
                    end
                    
                    app.DonotrecordonblackscreenCheckBox.Enable = 1;
                    
                end
                
            else
                app.Lamp.Color = 'r';
                app.FilenameEditField.Enable = 0;
                app.FilenameEditFieldLabel.Enable = 0;
                app.SavewhileblackscreenCheckBoxave.Enable = 0;
                app.OrderButton.Enable = 0;
                app.FilenameButton.Enable = 0;
                app.SavevideodatabyLabel.Enable = 0;
                app.DonotrecordonblackscreenCheckBox.Enable = 0;
                app.RemarksEditField.Enable = 0;
                app.RemarksEditFieldLabel.Enable = 0;
                app.FlagIRcameraonblackscreenCheckBox.Enable = 0;
                app.FPSdelaycorrectorEditField.Enable = 0;
                app.FPSdelaycorrectorLabel.Enable = 0;
                app.FPSdelaycorrectorstepEditField.Enable = 0;
                app.FPSdelaycorrectorstepEditFieldLabel.Enable = 0;
            end
            
            if (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'Off')...
                    && (strcmp(app.FramerateDropDown.Value, 'Max') || app.StopafterCheckBox.Value == 0))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                
            elseif (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'On')...
                    && strcmp(app.FramerateDropDown.Value, 'Max'))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                
            else 
                
                app.MemoryallocationEditField.Enable = 0;
                app.MemoryallocationEditFieldLabel_2.Enable = 0;
                app.MemoryallocationEditFieldLabel.Enable = 0;
                
            end
            
        end

        % Callback function
        function SavetimestampSwitchValueChanged(app, event)
            
        end

        % Value changed function: RGBcameraSwitch
        function RGBcameraSwitchValueChanged(app, event)
            value = app.RGBcameraSwitch.Value;
            
            if strcmp(value, 'On')
                app.Lamp_3.Color = 'g';
                app.DeviceDropDown.Enable = 1;
                app.cameraRefresh.Enable = 1;
                app.DeviceDropDownLabel.Enable = 1;
                app.ResolutionDropDown.Enable = 1;
                app.ResolutionDropDownLabel.Enable = 1;
                app.CropCheckBox.Enable = 1;
                app.RGB2grayCheckBox.Enable = 1;
                
                if app.CropCheckBox.Value == 1
                    app.Button_crop.Enable = 1;
                    app.CroppingcoordinatesEditField.Enable = 1;
                    app.CroppingcoordinatesEditFieldLabel.Enable = 1;
                end
                
            else
                app.Lamp_3.Color = 'r';
                app.DeviceDropDown.Enable = 0;
                app.cameraRefresh.Enable = 0;
                app.DeviceDropDownLabel.Enable = 0;
                app.ResolutionDropDown.Enable = 0;
                app.ResolutionDropDownLabel.Enable = 0;
                app.CropCheckBox.Enable = 0;
                app.Button_crop.Enable = 0;
                app.CroppingcoordinatesEditField.Enable = 0;
                app.CroppingcoordinatesEditFieldLabel.Enable = 0;
                app.RGB2grayCheckBox.Enable = 0;
            end
            

        end

        % Value changed function: LiveviewSwitch
        function LiveviewSwitchValueChanged(app, event)
            value = app.LiveviewSwitch.Value;
            
            if strcmp(value, 'On')
                app.Lamp_4.Color = 'g';
            else
                app.Lamp_4.Color = 'r';
            end
        end

        % Value changed function: PlayvideosSwitch
        function PlayvideosSwitchValueChanged(app, event)
            value = app.PlayvideosSwitch.Value;
            
            if strcmp(value, 'On')
                app.Lamp_5.Color = 'g';
                app.InitialintroscreenEditField.Enable = 1;
                app.InitialintroscreenEditFieldLabel.Enable = 1;
                app.PlaytimeDropDown.Enable = 1;
                app.PlaytimeLabel.Enable = 1;
                app.PausetimeEditField.Enable = 1;
                app.PausetimeEditFieldLabel.Enable = 1;
                app.FinalthankyouscreenEditField.Enable = 1;
                app.FinalthankyouscreenLabel.Enable = 1;
                app.VideofilesfolderEditField.Enable = 1;
                app.VideofilesfolderEditFieldLabel.Enable = 1;
                app.VerifyVLCfullscreenCheckBox.Enable = 1;
                app.Button_dir.Enable = 1;
                app.QuestionsPopupCheckBox.Enable = 1;
                app.FolderListBox.Enable = 1;
                app.FolderListBoxLabel.Enable = 1;
                app.PlayerListBox.Enable = 1;
                app.PlayerListBoxLabel.Enable = 1;
                app.Button_right.Enable = 1;
                app.Button_right_2.Enable = 1;
                app.Button_left.Enable = 1;
                app.Button_left_2.Enable = 1;
                app.Button_refresh_list.Enable = 1;
                app.Initial_BS_units.Enable = 1;
                app.Play_time_units.Enable = 1;
                app.Pause_time_units.Enable = 1;
                app.Last_BS_units.Enable = 1;
                
                if app.QuestionsPopupCheckBox.Value == 1
                    app.PopuppositionEditField.Enable = 1;
                    app.PopuppositionEditFieldLabel.Enable = 1;
                    app.CheckButton.Enable = 1;
                    app.SetButton.Enable = 1;
                else
                    app.PopuppositionEditField.Enable = 0;
                    app.PopuppositionEditFieldLabel.Enable = 0;
                    app.CheckButton.Enable = 0;
                    app.SetButton.Enable = 0;
                end
                
                if strcmp(app.SaveSwitch.Value, 'On')
                    
                    if app.DonotrecordonblackscreenCheckBox.Value == 1
                        app.SavewhileblackscreenCheckBoxave.Enable = 1;
                        app.OrderButton.Enable = 1;
                        app.FilenameButton.Enable = 1;
                        app.SavevideodatabyLabel.Enable = 1;
                    end
                    
                    if app.DonotrecordonblackscreenCheckBox.Value == 1 && strcmp(app.LWIRcameraSwitch.Value, 'On')
                        app.FlagIRcameraonblackscreenCheckBox.Enable = 1;
                    end
                    
                    app.DonotrecordonblackscreenCheckBox.Enable = 1;
                    
                end

            else
                app.Lamp_5.Color = 'r';
                app.InitialintroscreenEditField.Enable = 0;
                app.InitialintroscreenEditFieldLabel.Enable = 0;
                app.PlaytimeDropDown.Enable = 0;
                app.PlaytimeLabel.Enable = 0;
                app.PausetimeEditField.Enable = 0;
                app.PausetimeEditFieldLabel.Enable = 0;
                app.FinalthankyouscreenEditField.Enable = 0;
                app.FinalthankyouscreenLabel.Enable = 0;
                app.VideofilesfolderEditField.Enable = 0;
                app.VideofilesfolderEditFieldLabel.Enable = 0;
                app.VerifyVLCfullscreenCheckBox.Enable = 0;
                app.Button_dir.Enable = 0;
                app.QuestionsPopupCheckBox.Enable = 0;
                app.PopuppositionEditField.Enable = 0;
                app.PopuppositionEditFieldLabel.Enable = 0;
                app.CheckButton.Enable = 0;
                app.SetButton.Enable = 0;
                app.FolderListBox.Enable = 0;
                app.FolderListBoxLabel.Enable = 0;
                app.PlayerListBox.Enable = 0;
                app.PlayerListBoxLabel.Enable = 0;
                app.Button_right.Enable = 0;
                app.Button_right_2.Enable = 0;
                app.Button_left.Enable = 0;
                app.Button_left_2.Enable = 0;
                app.Button_refresh_list.Enable = 0;
                app.SavewhileblackscreenCheckBoxave.Enable = 0;
                app.OrderButton.Enable = 0;
                app.FilenameButton.Enable = 0;
                app.SavevideodatabyLabel.Enable = 0;
                app.DonotrecordonblackscreenCheckBox.Enable = 0;
                app.Initial_BS_units.Enable = 0;
                app.Play_time_units.Enable = 0;
                app.Pause_time_units.Enable = 0;
                app.Last_BS_units.Enable = 0;
                app.FlagIRcameraonblackscreenCheckBox.Enable = 0;
                
            end

            if (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'Off')...
                    && (strcmp(app.FramerateDropDown.Value, 'Max') || app.StopafterCheckBox.Value == 0))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                
            elseif (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'On')...
                    && strcmp(app.FramerateDropDown.Value, 'Max'))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                %{
            elseif (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'On')...
                    && ~strcmp(app.FramerateDropDown.Value, 'Max') && ...
                    (app.StopafterCheckBox.Value == 0 && strcmp(app.PlaytimeDropDown.Value, 'Auto')))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                %}
            else 
                
                app.MemoryallocationEditField.Enable = 0;
                app.MemoryallocationEditFieldLabel_2.Enable = 0;
                app.MemoryallocationEditFieldLabel.Enable = 0;
                
            end
            
        end

        % Button pushed function: Button_dir
        function Button_dirPushed(app, event)
            
            try
                dname = uigetdir('C:\Users\owner\Documents\GitHub\Experiment-control-panel-real-time-LWIR-NIR-RGB-video-recorder-with-external-monitor-video-player\Video files\', 'Select a folder with video files to be played');
                figure(app.ExperimentcontrolpanelUIFigure); % gets the focus back to the UI window
                app.VideofilesfolderEditField.Value = dname;
                status(app, 'Loading video files from selected folder...', 'g', 1, 0);
            catch
                status(app, 'Error selecting this folder.', 'r', 1, 0);
            end
            
            Button_refresh_listPushed(app, event)
        end

        % Callback function
        function LoadlastrunButtonPushed(app, event)
           
           
        end

        % Value changed function: LWIRcameraSwitch
        function LWIRcameraSwitchValueChanged(app, event)
            value = app.LWIRcameraSwitch.Value;
            
            if strcmp(value, 'On')
                app.Lamp_6.Color = 'g';
                %app.ButtonGroup_4.Visible
                app.TemperatureButton.Enable = 1;
                app.ButtonGroup_4.ForegroundColor = [0, 0, 0];
                app.ColorButton.Enable = 1;
                app.DeviceDropDown_3.Enable = 1;
                app.DeviceDropDown_3Label.Enable = 1;
                app.ResolutionDropDown_3.Enable = 1;
                app.ResolutionDropDown_3Label.Enable = 1;
                app.cameraRefresh_3.Enable = 1;
                app.LWIRimageasLabel.Enable = 1;

                if strcmp(app.PlayvideosSwitch.Value, 'On') && strcmp(app.SaveSwitch.Value, 'On')
                    app.FlagIRcameraonblackscreenCheckBox.Enable = 1;
                end
                
            else
                app.Lamp_6.Color = 'r';
                app.TemperatureButton.Enable = 0;
                app.ButtonGroup_4.ForegroundColor = [0.65, 0.65, 0.65];
                app.ColorButton.Enable = 0;
                app.FlagIRcameraonblackscreenCheckBox.Enable = 0;
                app.DeviceDropDown_3.Enable = 0;
                app.DeviceDropDown_3Label.Enable = 0;
                app.ResolutionDropDown_3.Enable = 0;
                app.ResolutionDropDown_3Label.Enable = 0;
                app.cameraRefresh_3.Enable = 0;
                app.LWIRimageasLabel.Enable = 0;
            end
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            
            app.ExitButton.Text = 'Exit';
            
            app.RunButton.Enable = 1;
            app.StopButton.Enable = 0;
            
            app.FramerateDropDown.Enable = 1;
            app.FramerateDropDownLabel.Enable = 1;
            app.SaveSwitch.Enable = 1;
            app.PlayvideosSwitch.Enable = 1;
            app.RGBcameraSwitch.Enable = 1;
            app.LWIRcameraSwitch.Enable = 1;
            app.NIRcameraSwitch.Enable = 1;
            app.LiveviewSwitch.Enable = 1;
            app.StopafterCheckBox.Enable = 1;
            app.WarmupCheckBox.Enable = 1;
            
            if strcmp(app.PlayvideosSwitch.Value, 'On')
                app.InitialintroscreenEditField.Enable = 1;
                app.InitialintroscreenEditFieldLabel.Enable = 1;
                app.PlaytimeDropDown.Enable = 1;
                app.PlaytimeLabel.Enable = 1;
                app.PausetimeEditField.Enable = 1;
                app.PausetimeEditFieldLabel.Enable = 1;
                app.FinalthankyouscreenEditField.Enable = 1;
                app.FinalthankyouscreenLabel.Enable = 1;
                app.VideofilesfolderEditField.Enable = 1;
                app.VideofilesfolderEditFieldLabel.Enable = 1;
                app.VerifyVLCfullscreenCheckBox.Enable = 1;
                app.Button_dir.Enable = 1;
                app.QuestionsPopupCheckBox.Enable = 1;
                app.FolderListBox.Enable = 1;
                app.FolderListBoxLabel.Enable = 1;
                app.PlayerListBox.Enable = 1;
                app.PlayerListBoxLabel.Enable = 1;
                app.Button_right.Enable = 1;
                app.Button_right_2.Enable = 1;
                app.Button_left.Enable = 1;
                app.Button_left_2.Enable = 1;
                app.Button_refresh_list.Enable = 1;
                app.Initial_BS_units.Enable = 1;
                app.Play_time_units.Enable = 1;
                app.Pause_time_units.Enable = 1;
                app.Last_BS_units.Enable = 1;
                
                if app.QuestionsPopupCheckBox.Value == 1
                    app.PopuppositionEditField.Enable = 1;
                    app.PopuppositionEditFieldLabel.Enable = 1;
                    app.CheckButton.Enable = 1;
                    app.SetButton.Enable = 1;
                end
                
                if strcmp(app.SaveSwitch.Value, 'On')
                    
                    if app.DonotrecordonblackscreenCheckBox.Value == 1
                        app.SavewhileblackscreenCheckBoxave.Enable = 1;
                        app.OrderButton.Enable = 1;
                        app.FilenameButton.Enable = 1;
                        app.SavevideodatabyLabel.Enable = 1;
                    end
                    
                    if app.DonotrecordonblackscreenCheckBox.Value == 1 && strcmp(app.LWIRcameraSwitch.Value, 'On')
                        app.FlagIRcameraonblackscreenCheckBox.Enable = 1;
                    end
                    
                    app.DonotrecordonblackscreenCheckBox.Enable = 1;
                    app.RemarksEditField.Enable = 1;
                    app.RemarksEditFieldLabel.Enable = 1;
                    
                end
                
            end
            
            if strcmp(app.RGBcameraSwitch.Value, 'On')
                app.RGB2grayCheckBox.Enable = 1;
                app.DeviceDropDown.Enable = 1;
                app.DeviceDropDownLabel.Enable = 1;
                app.ResolutionDropDown.Enable = 1;
                app.ResolutionDropDownLabel.Enable = 1;
                app.cameraRefresh.Enable = 1;
                app.CropCheckBox.Enable = 1;
                
                if app.CropCheckBox.Value == 1
                    app.Button_crop.Enable = 1;
                    app.CroppingcoordinatesEditField.Enable = 1;
                    app.CroppingcoordinatesEditFieldLabel.Enable = 1;
                end
                
            end
            
            if strcmp(app.NIRcameraSwitch.Value, 'On')
                app.RGB2grayCheckBox_2.Enable = 1;
                app.DeviceDropDown_2.Enable = 1;
                app.DeviceDropDown_2Label.Enable = 1;
                app.ResolutionDropDown_2.Enable = 1;
                app.ResolutionDropDown_2Label.Enable = 1;
                app.cameraRefresh_2.Enable = 1;
                app.CropCheckBox_2.Enable = 1;
                
                if app.CropCheckBox_2.Value == 1
                    app.Button_crop_2.Enable = 1;
                    app.CroppingcoordinatesEditField_2.Enable = 1;
                    app.CroppingcoordinatesEditField_2Label.Enable = 1;
                end
                
            end
            
            if strcmp(app.SaveSwitch.Value, 'On')
                app.FilenameEditField.Enable = 1;
                app.FilenameEditFieldLabel.Enable = 1;
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                app.RemarksEditField.Enable = 1;
                app.RemarksEditFieldLabel.Enable = 1;
            end
            
            if strcmp(app.LWIRcameraSwitch.Value, 'On')
                app.TemperatureButton.Enable = 1;
                app.ButtonGroup_4.ForegroundColor = [0, 0, 0];
                app.ColorButton.Enable = 1;
                app.DeviceDropDown_3.Enable = 1;
                app.DeviceDropDown_3Label.Enable = 1;
                app.cameraRefresh_3.Enable = 1;
                app.ResolutionDropDown_3.Enable = 1;
                app.ResolutionDropDown_3Label.Enable = 1;
                app.LWIRimageasLabel.Enable = 1;
            end
            
            if ~strcmp(app.FramerateDropDown.Value, 'Max') && strcmp(app.SaveSwitch.Value, 'On')
                    app.FPSdelaycorrectorEditField.Enable = 1;
                    app.FPSdelaycorrectorLabel.Enable = 1;
                    app.FPSdelaycorrectorstepEditField.Enable = 1;
                    app.FPSdelaycorrectorstepEditFieldLabel.Enable = 1;
            end
            
            if app.StopafterCheckBox.Value == 1
                app.EditField_stop.Enable = 1;
                app.SecondsButton_stop.Enable = 1;
                app.FramesButton_stop.Enable = 1;
                app.Label.Enable = 1;
            end
            
            if app.WarmupCheckBox.Value == 1
                app.EditField_start.Enable = 1;
                app.SecondsButton_start.Enable = 1;
                app.FramesButton_start.Enable = 1;
                app.Label_2.Enable = 1;
            end
            
            if (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'Off')...
                    && (strcmp(app.FramerateDropDown.Value, 'Max') || app.StopafterCheckBox.Value == 0))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                
            elseif (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'On')...
                    && strcmp(app.FramerateDropDown.Value, 'Max'))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;

            else 
                
                app.MemoryallocationEditField.Enable = 0;
                app.MemoryallocationEditFieldLabel_2.Enable = 0;
                app.MemoryallocationEditFieldLabel.Enable = 0;
                
            end
            
            global viewer_is_running;
            viewer_is_running = 0;
            
        end

        % Value changed function: VerifyVLCfullscreenCheckBox
        function VerifyVLCfullscreenCheckBoxValueChanged(app, event)
            
        end

        % Value changed function: QuestionsPopupCheckBox
        function QuestionsPopupCheckBoxValueChanged(app, event)
            value = app.QuestionsPopupCheckBox.Value;
            if value == 1
                app.PopuppositionEditField.Enable = 1;
                app.PopuppositionEditFieldLabel.Enable = 1;
                app.CheckButton.Enable = 1;
                app.SetButton.Enable = 1;
            else
                app.PopuppositionEditField.Enable = 0;
                app.PopuppositionEditFieldLabel.Enable = 0;
                app.CheckButton.Enable = 0;
                app.SetButton.Enable = 0;
            end
        end

        % Button pushed function: CheckButton
        function CheckButtonPushed(app, event)
            
            coordinates = str2num(app.PopuppositionEditField.Value);
            coordinates(3) = 860;
            coordinates(4) = 325;
                
            if isfield(app.Property,'popup_fig') == 0
                
                app.Property.popup_fig = popup_fig_finder(app, 'popup_fig.mlapp', 'Popup_questions', true); % opens popup UI figure with always-on-top mode
                
                app.Property.popup_fig.Position = coordinates; % locate it where it should be
                
            else
                if isfield(app.Property.popup_fig,'Popup_questionsUIFigure') == 0
                    app.Property.popup_fig =  popup_fig_finder(app, 'popup_fig.mlapp', 'Popup_questions', true); % opens popup UI figure with always-on-top mode
                    app.Property.popup_fig.Position = coordinates;
                else
                    app.Property.popup_fig.Position = coordinates;
                end
                
            end
            
        end

        % Button pushed function: cameraRefresh
        function cameraRefreshPushed(app, event)
            web_cam_list = webcamlist;
            app.DeviceDropDown.Items = web_cam_list;
            
            expected_device1 = 'USB Capture HDMI'; % RGB camera
            expected_device2 = 'HD USB Camera'; % NIR camera
            expected_device3 = 'PI IMAGER'; % IR camera
            devices_found = size(web_cam_list, 1);
            
            VIS_found = find(ismember(app.DeviceDropDown.Items, expected_device1), 1);
            if ~isempty(VIS_found)
                app.DeviceDropDown.Value = expected_device1;
            else
                for i=1:devices_found
                    if strcmp(app.DeviceDropDown.Value, app.DeviceDropDown_2.Value) | strcmp(app.DeviceDropDown.Value, expected_device3)
                        app.DeviceDropDown.Value = app.DeviceDropDown.Items(i);
                    else
                        break;
                    end
                end
            end
            
            VIS_cam = app.DeviceDropDown_2.Value;
            if ~strcmp(VIS_cam, expected_device3)
                try
                    cam = webcam(VIS_cam);
                    app.ResolutionDropDown.Items = cam.AvailableResolutions;
                    clear('cam');
                catch
                end
            end

            LWIR_found = find(ismember(app.DeviceDropDown.Items, expected_device3), 1);
            if ~isempty(LWIR_found)
                app.DeviceDropDown.Items(LWIR_found) = [];
            end
            
        end

        % Value changed function: DeviceDropDown
        function DeviceDropDownValueChanged(app, event)
            value = app.DeviceDropDown.Value;
            try
                cam = webcam(value);
                app.ResolutionDropDown.Items = cam.AvailableResolutions;
                clear('cam');
            catch
                app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                app.Status1.Value = sprintf('%s', ['Error connecting to ' value]);
            end
            
        end

        % Button pushed function: Button_crop
        function Button_cropPushed(app, event)
            
            try
                cam = webcam(app.DeviceDropDown.Value);
                cam.Resolution = app.ResolutionDropDown.Value;
                frame = snapshot(cam); % get imgage from VIS camera
                crop_cor = ROIcrop(app, frame);
                app.CroppingcoordinatesEditField.Value = num2str(crop_cor);
            catch
                status(app, 'Error connecting to VIS camera.', 'r', 1, 0);
            end

        end

        % Value changed function: CropCheckBox
        function CropCheckBoxValueChanged(app, event)
            value = app.CropCheckBox.Value;
            
            if value == 1
               app.Button_crop.Enable = 1;
               app.CroppingcoordinatesEditField.Enable = 1;
               app.CroppingcoordinatesEditFieldLabel.Enable = 1;
            else
               app.Button_crop.Enable = 0;
               app.CroppingcoordinatesEditField.Enable = 0;
               app.CroppingcoordinatesEditFieldLabel.Enable = 0;
            end
            
        end

        % Value changed function: VideofilesfolderEditField
        function VideofilesfolderEditFieldValueChanged(app, event)

            
            
        end

        % Button pushed function: Button_refresh_list
        function Button_refresh_listPushed(app, event)
            try
                app.Property = rmfield(app.Property,'list_name');
                app.Property = rmfield(app.Property,'list_idx');
                app.Property = rmfield(app.Property,'playlist_name');
                app.Property = rmfield(app.Property,'playlist_idx');
            catch
            end
            
            app.FolderListBox.Items = cellstr(' ');
            app.PlayerListBox.Items = cellstr(' ');
            
            value = app.VideofilesfolderEditField.Value; % value is directory location
            app.Property.list = folder2list(app, value); % calling playlist function
            
            [r, c] = size(app.Property.list);
            
            if r == 1 && c == 1 && app.Property.list(1,1) == 0
                app.FolderListBox.Items = cellstr(' ');
                status(app, 'Error loading video files from folder.', 'r', 1, 0);
            else
                
                for i=1:r
                    app.Property.list_name(i) = cellstr(app.Property.list(i).name);
                    app.Property.list_idx(i) = app.Property.list(i).idx;
                end
                
                app.FolderListBox.Items = app.Property.list_name; % name vector
                len = length(app.FolderListBox.Items);
                app.FolderListBox.ItemsData = linspace(1,len,len); % idx vector
                
                status(app, 'Video files folder content loaded successfully.', 'g', 1, 0);
            end
            
            %catch
            %end
            
        end

        % Button pushed function: Button_right
        function Button_rightPushed(app, event)
            value = app.FolderListBox.Value;
            try
                
                if isfield(app.Property,'playlist_name') == 0
                    app.Property.playlist_name = cellstr(app.Property.list_name(value)); % create the vector for the first time
                    app.Property.playlist_idx = app.Property.list_idx(value);
                else
                    len = length(app.Property.playlist_name);
                    app.Property.playlist_name(len + 1) = cellstr(app.Property.list_name(value)); % add item to the vector
                    app.Property.playlist_idx(len + 1) = app.Property.list_idx(value);
                end
                
                app.PlayerListBox.Items = app.Property.playlist_name;% update list
                len = length(app.PlayerListBox.Items);
                app.PlayerListBox.ItemsData = linspace(1,len,len);
                                
            catch
            end
            
        end

        % Button pushed function: Button_left
        function Button_leftPushed(app, event)
            value = app.PlayerListBox.Value;

            try
                
                if isempty(app.Property.playlist_name) == 0
                    len = length(app.Property.playlist_name);
                    
                    for i=0:len-value-1
                        app.Property.playlist_name(value + i) = app.Property.playlist_name(value + 1 + i); % move items up one by one
                        app.Property.playlist_idx(value + i) = app.Property.playlist_idx(value + 1 + i);
                    end
                    
                    app.Property.playlist_name(len) = []; % remove last item
                    app.Property.playlist_idx(len) = [];
                    
                end
                
                app.PlayerListBox.Items = app.Property.playlist_name; % update list
                len = length(app.PlayerListBox.Items);
                app.PlayerListBox.ItemsData = linspace(1,len,len);
                
            catch
            end
            
        end

        % Value changed function: StopafterCheckBox
        function StopafterCheckBoxValueChanged(app, event)
            value = app.StopafterCheckBox.Value;
            
            if value == 1
                app.EditField_stop.Enable = 1;
                app.SecondsButton_stop.Enable = 1;
                app.FramesButton_stop.Enable = 1;
                app.Label.Enable = 1;
            else
                app.EditField_stop.Enable = 0;
                app.SecondsButton_stop.Enable = 0;
                app.FramesButton_stop.Enable = 0;
                app.Label.Enable = 0;
            end
            
            if (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'Off')...
                    && (strcmp(app.FramerateDropDown.Value, 'Max') || app.StopafterCheckBox.Value == 0))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                
            elseif (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'On')...
                    && strcmp(app.FramerateDropDown.Value, 'Max'))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;

            else 
                
                app.MemoryallocationEditField.Enable = 0;
                app.MemoryallocationEditFieldLabel_2.Enable = 0;
                app.MemoryallocationEditFieldLabel.Enable = 0;
                
            end
            
        end

        % Value changed function: WarmupCheckBox
        function WarmupCheckBoxValueChanged(app, event)
            value = app.WarmupCheckBox.Value;
                        
            if value == 1
                app.EditField_start.Enable = 1;
                app.SecondsButton_start.Enable = 1;
                app.FramesButton_start.Enable = 1;
                app.Label_2.Enable = 1;
            else
                app.EditField_start.Enable = 0;
                app.SecondsButton_start.Enable = 0;
                app.FramesButton_start.Enable = 0;
                app.Label_2.Enable = 0;
            end
        end

        % Button pushed function: Button_right_2
        function Button_right_2Pushed(app, event)

            try
                
                if isfield(app.Property,'playlist_name') == 0
                    app.Property.playlist_name = cellstr(app.Property.list_name); % create the vector for the first time
                    app.Property.playlist_idx = app.Property.list_idx;
                else
                    len = length(app.Property.playlist_name);
                    len2 = length(app.Property.list_name);
                    
                    app.Property.playlist_name(len + 1:len + len2) = cellstr(app.Property.list_name); % add item to the vector
                    app.Property.playlist_idx(len + 1:len + len2) = app.Property.list_idx;
                end
                
                app.PlayerListBox.Items = app.Property.playlist_name; % update list
                len = length(app.PlayerListBox.Items);
                app.PlayerListBox.ItemsData = linspace(1,len,len);
                                
            catch
            end
            
            
        end

        % Button pushed function: SetButton
        function SetButtonPushed(app, event)
            coordinates = join(string([app.Property.popup_fig.Position(1), app.Property.popup_fig.Position(2)]));
            
            app.PopuppositionEditField.Value = coordinates;
            close(app.Property.popup_fig);
            app.Property = rmfield(app.Property,'popup_fig');

        end

        % Value changed function: DonotrecordonblackscreenCheckBox
        function DonotrecordonblackscreenCheckBoxValueChanged(app, event)
            value = app.DonotrecordonblackscreenCheckBox.Value;
            
            if value == 1
                app.SavewhileblackscreenCheckBoxave.Enable = 1;
                app.OrderButton.Enable = 1;
                app.FilenameButton.Enable = 1;
                app.SavevideodatabyLabel.Enable = 1;
                
                if strcmp(app.LWIRcameraSwitch.Value, 'On')
                    app.FlagIRcameraonblackscreenCheckBox.Enable = 1;
                end
                
            else
                app.SavewhileblackscreenCheckBoxave.Enable = 0;
                app.OrderButton.Enable = 0;
                app.FilenameButton.Enable = 0;
                app.SavevideodatabyLabel.Enable = 0;
                app.FlagIRcameraonblackscreenCheckBox.Enable = 0;
            end
        end

        % Value changed function: FlagIRcameraonblackscreenCheckBox
        function FlagIRcameraonblackscreenCheckBoxValueChanged(app, event)
    
        end

        % Value changed function: PlaytimeDropDown
        function PlaytimeDropDownValueChanged(app, event)
            
        end

        % Value changed function: FramerateDropDown
        function FramerateDropDownValueChanged(app, event)
            
            if ~strcmp(app.FramerateDropDown.Value, 'Max') && strcmp(app.SaveSwitch.Value, 'On')
                    app.FPSdelaycorrectorEditField.Enable = 1;
                    app.FPSdelaycorrectorLabel.Enable = 1;
                    app.FPSdelaycorrectorstepEditField.Enable = 1;
                    app.FPSdelaycorrectorstepEditFieldLabel.Enable = 1;
            end
            
            if (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'Off')...
                    && (strcmp(app.FramerateDropDown.Value, 'Max') || app.StopafterCheckBox.Value == 0))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;
                
            elseif (strcmp(app.SaveSwitch.Value, 'On') && strcmp(app.PlayvideosSwitch.Value, 'On')...
                    && strcmp(app.FramerateDropDown.Value, 'Max'))
                
                app.MemoryallocationEditField.Enable = 1;
                app.MemoryallocationEditFieldLabel_2.Enable = 1;
                app.MemoryallocationEditFieldLabel.Enable = 1;

            else 
                
                app.MemoryallocationEditField.Enable = 0;
                app.MemoryallocationEditFieldLabel_2.Enable = 0;
                app.MemoryallocationEditFieldLabel.Enable = 0;
                
            end
            
        end

        % Value changed function: NIRcameraSwitch
        function NIRcameraSwitchValueChanged(app, event)
            value = app.NIRcameraSwitch.Value;
            
            if strcmp(value, 'On')
                app.Lamp_7.Color = 'g';
                app.DeviceDropDown_2.Enable = 1;
                app.cameraRefresh_2.Enable = 1;
                app.DeviceDropDown_2Label.Enable = 1;
                app.ResolutionDropDown_2.Enable = 1;
                app.ResolutionDropDown_2Label.Enable = 1;
                app.CropCheckBox_2.Enable = 1;
                app.RGB2grayCheckBox_2.Enable = 1;
                
                if app.CropCheckBox_2.Value == 1
                    app.Button_crop_2.Enable = 1;
                    app.CroppingcoordinatesEditField_2.Enable = 1;
                    app.CroppingcoordinatesEditField_2Label.Enable = 1;
                end
                
            else
                app.Lamp_7.Color = 'r';
                app.DeviceDropDown_2.Enable = 0;
                app.cameraRefresh_2.Enable = 0;
                app.DeviceDropDown_2Label.Enable = 0;
                app.ResolutionDropDown_2.Enable = 0;
                app.ResolutionDropDown_2Label.Enable = 0;
                app.CropCheckBox_2.Enable = 0;
                app.Button_crop_2.Enable = 0;
                app.CroppingcoordinatesEditField_2.Enable = 0;
                app.CroppingcoordinatesEditField_2Label.Enable = 0;
                app.RGB2grayCheckBox_2.Enable = 0;
            end
        end

        % Value changed function: CropCheckBox_2
        function CropCheckBox_2ValueChanged(app, event)
            value = app.CropCheckBox_2.Value;
            
            if value == 1
               app.Button_crop_2.Enable = 1;
               app.CroppingcoordinatesEditField_2.Enable = 1;
               app.CroppingcoordinatesEditField_2Label.Enable = 1;
            else
               app.Button_crop_2.Enable = 0;
               app.CroppingcoordinatesEditField_2.Enable = 0;
               app.CroppingcoordinatesEditField_2Label.Enable = 0;
            end
            
        end

        % Button pushed function: cameraRefresh_2
        function cameraRefresh_2ButtonPushed(app, event)
            web_cam_list = webcamlist;
            app.DeviceDropDown_2.Items = web_cam_list;
            
            expected_device1 = 'USB Capture HDMI'; % RGB camera
            expected_device2 = 'HD USB Camera'; % NIR camera
            expected_device3 = 'PI IMAGER'; % IR camera
            devices_found = size(web_cam_list, 1);
            
            NIR_found = find(ismember(app.DeviceDropDown_2.Items, expected_device2), 1);
            if ~isempty(NIR_found)
                app.DeviceDropDown_2.Value = expected_device2;
            else
                for i=1:devices_found
                    if strcmp(app.DeviceDropDown_2.Value, app.DeviceDropDown.Value) | strcmp(app.DeviceDropDown_2.Value, expected_device3)
                        app.DeviceDropDown_2.Value = app.DeviceDropDown_2.Items(i);
                    else
                        break;
                    end
                end
            end
            
            NIR_cam = app.DeviceDropDown_2.Value;
            if ~strcmp(NIR_cam, expected_device3)
                try
                    cam = webcam(NIR_cam);
                    app.ResolutionDropDown_2.Items = cam.AvailableResolutions;
                    clear('cam');
                catch
                end
            else
                app.DeviceDropDown_2.Items = web_cam_list(1);
                try
                    NIR_cam = app.DeviceDropDown_2.Value;
                    cam = webcam(NIR_cam);
                    app.ResolutionDropDown_2.Items = cam.AvailableResolutions;
                    clear('cam');
                catch
                end
            end
            
            LWIR_found = find(ismember(app.DeviceDropDown_2.Items, expected_device3), 1);
            if ~isempty(LWIR_found)
                app.DeviceDropDown_2.Items(LWIR_found) = [];
            end
            
        end

        % Value changed function: DeviceDropDown_2
        function DeviceDropDown_2ValueChanged(app, event)
            value = app.DeviceDropDown_2.Value;
            
            try
                cam = webcam(value);
                app.ResolutionDropDown_2.Items = cam.AvailableResolutions;
                clear('cam');
            catch
                app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                app.Status1.Value = sprintf('%s', ['Error connecting to ' value]);
            end
        end

        % Button pushed function: Button_crop_2
        function Button_crop_2Pushed(app, event)
            try
                cam = webcam(app.DeviceDropDown_2.Value);
                cam.Resolution = app.ResolutionDropDown_2.Value;
                for i=1:20
                    frame = snapshot(cam); % get image from NIR camera - take 20 frames since our specific camera needs several frames to work properly
                end
                crop_cor = ROIcrop(app, frame);
                app.CroppingcoordinatesEditField_2.Value = num2str(crop_cor);
            catch
                status(app, 'Error connecting to NIR camera.', 'r', 1, 0);
            end
            
            
        end

        % Button pushed function: cameraRefresh_3
        function cameraRefresh_3ButtonPushed(app, event)
            app.DeviceDropDown_3.Items = webcamlist;
            
            expected_device1 = 'USB Capture HDMI'; % RGB camera
            expected_device2 = 'HD USB Camera'; % NIR camera
            expected_device3 = 'PI IMAGER'; % IR camera
            
            LWIR_found = find(ismember(app.DeviceDropDown_3.Items, expected_device3), 1);
            if ~isempty(LWIR_found)
                app.DeviceDropDown_3.Value = expected_device3;
                
                VIS_found = find(ismember(app.DeviceDropDown_3.Items, expected_device1), 1);
                NIR_found = find(ismember(app.DeviceDropDown_3.Items, expected_device2), 1);
                app.DeviceDropDown_3.Items(VIS_found) = [];
                app.DeviceDropDown_3.Items(NIR_found) = [];
                
                LWIR_cam = app.DeviceDropDown_3.Value;
                try
                    cam = webcam(LWIR_cam);
                    res = cam.AvailableResolutions;
                    app.ResolutionDropDown_3.Items = res;
                    clear('cam');
                catch
                    app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                    app.Status1.Value = sprintf('%s', 'Error connecting to LWIR camera, or no camera connected to your system.');
                end
                
            else
                app.DeviceDropDown_3.Items(:) = [];
            end
            
            value = app.DeviceDropDown_3.Value;
            try
                cam = webcam(value);
                app.ResolutionDropDown_3.Items = cam.AvailableResolutions;
                clear('cam');
            catch
            end
            
            
        end

        % Value changed function: DeviceDropDown_3
        function DeviceDropDown_3ValueChanged(app, event)
            value = app.DeviceDropDown_3.Value;
            
            try
                cam = webcam(value);
                app.ResolutionDropDown_3.Items = cam.AvailableResolutions;
                clear('cam');
            catch
                app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
                app.Status1.Value = sprintf('%s', ['Error connecting to ' value]);
            end
        end

        % Button pushed function: Button_left_2
        function Button_left_2Pushed(app, event)
            try

                app.Property = rmfield(app.Property, 'playlist_name');
                app.Property = rmfield(app.Property, 'playlist_idx');
                
                app.PlayerListBox.Items(:) = [];
                app.PlayerListBox.ItemsData(:)  = [];
                
            catch
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ExperimentcontrolpanelUIFigure and hide until all components are created
            app.ExperimentcontrolpanelUIFigure = uifigure('Visible', 'off');
            app.ExperimentcontrolpanelUIFigure.Position = [600 300 1290 594];
            app.ExperimentcontrolpanelUIFigure.Name = 'Experiment control panel';
            app.ExperimentcontrolpanelUIFigure.Scrollable = 'on';

            % Create RunButton
            app.RunButton = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.Position = [228 35 100 33];
            app.RunButton.Text = 'Run';

            % Create SaveSwitchLabel
            app.SaveSwitchLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.SaveSwitchLabel.HorizontalAlignment = 'center';
            app.SaveSwitchLabel.Position = [64 530 33 22];
            app.SaveSwitchLabel.Text = 'Save';

            % Create SaveSwitch
            app.SaveSwitch = uiswitch(app.ExperimentcontrolpanelUIFigure, 'slider');
            app.SaveSwitch.ValueChangedFcn = createCallbackFcn(app, @SaveSwitchValueChanged, true);
            app.SaveSwitch.Position = [134 530 45 20];

            % Create RGBcameraSwitchLabel
            app.RGBcameraSwitchLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.RGBcameraSwitchLabel.HorizontalAlignment = 'center';
            app.RGBcameraSwitchLabel.Position = [23.5 399 75 22];
            app.RGBcameraSwitchLabel.Text = 'RGB camera';

            % Create RGBcameraSwitch
            app.RGBcameraSwitch = uiswitch(app.ExperimentcontrolpanelUIFigure, 'slider');
            app.RGBcameraSwitch.ValueChangedFcn = createCallbackFcn(app, @RGBcameraSwitchValueChanged, true);
            app.RGBcameraSwitch.Position = [129 400 45 20];
            app.RGBcameraSwitch.Value = 'On';

            % Create Lamp
            app.Lamp = uilamp(app.ExperimentcontrolpanelUIFigure);
            app.Lamp.Position = [211 531 20 20];
            app.Lamp.Color = [1 0 0];

            % Create Lamp_3
            app.Lamp_3 = uilamp(app.ExperimentcontrolpanelUIFigure);
            app.Lamp_3.Position = [211 401 20 20];

            % Create PlayvideosSwitchLabel
            app.PlayvideosSwitchLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.PlayvideosSwitchLabel.HorizontalAlignment = 'center';
            app.PlayvideosSwitchLabel.Position = [23 267 67 22];
            app.PlayvideosSwitchLabel.Text = 'Play videos';

            % Create PlayvideosSwitch
            app.PlayvideosSwitch = uiswitch(app.ExperimentcontrolpanelUIFigure, 'slider');
            app.PlayvideosSwitch.ValueChangedFcn = createCallbackFcn(app, @PlayvideosSwitchValueChanged, true);
            app.PlayvideosSwitch.Position = [130 267 45 20];

            % Create VideofilesfolderEditFieldLabel
            app.VideofilesfolderEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.VideofilesfolderEditFieldLabel.HorizontalAlignment = 'right';
            app.VideofilesfolderEditFieldLabel.Enable = 'off';
            app.VideofilesfolderEditFieldLabel.Position = [260 231 97 22];
            app.VideofilesfolderEditFieldLabel.Text = 'Video files folder:';

            % Create VideofilesfolderEditField
            app.VideofilesfolderEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.VideofilesfolderEditField.ValueChangedFcn = createCallbackFcn(app, @VideofilesfolderEditFieldValueChanged, true);
            app.VideofilesfolderEditField.Enable = 'off';
            app.VideofilesfolderEditField.Position = [370 231 823 22];
            app.VideofilesfolderEditField.Value = 'C:\Users\owner\Documents\GitHub\Experiment-control-panel---IR-VIS-camera-reconder-with-emotions-arousing-player\Video files';

            % Create FilenameEditFieldLabel
            app.FilenameEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.FilenameEditFieldLabel.Enable = 'off';
            app.FilenameEditFieldLabel.Position = [239 531 58 22];
            app.FilenameEditFieldLabel.Text = 'File name';

            % Create FilenameEditField
            app.FilenameEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.FilenameEditField.Enable = 'off';
            app.FilenameEditField.Position = [309 531 254 22];
            app.FilenameEditField.Value = 'Experiment file name goes here';

            % Create FramerateDropDownLabel
            app.FramerateDropDownLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FramerateDropDownLabel.HorizontalAlignment = 'right';
            app.FramerateDropDownLabel.Position = [246 448 68 22];
            app.FramerateDropDownLabel.Text = 'Frame rate:';

            % Create FramerateDropDown
            app.FramerateDropDown = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.FramerateDropDown.Items = {'Max', '30'};
            app.FramerateDropDown.Editable = 'on';
            app.FramerateDropDown.ValueChangedFcn = createCallbackFcn(app, @FramerateDropDownValueChanged, true);
            app.FramerateDropDown.BackgroundColor = [1 1 1];
            app.FramerateDropDown.Position = [318 448 66 22];
            app.FramerateDropDown.Value = '30';

            % Create Lamp_4
            app.Lamp_4 = uilamp(app.ExperimentcontrolpanelUIFigure);
            app.Lamp_4.Position = [211 450 20 20];

            % Create LiveviewSwitchLabel
            app.LiveviewSwitchLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.LiveviewSwitchLabel.HorizontalAlignment = 'center';
            app.LiveviewSwitchLabel.Position = [38 448 55 22];
            app.LiveviewSwitchLabel.Text = 'Live view';

            % Create LiveviewSwitch
            app.LiveviewSwitch = uiswitch(app.ExperimentcontrolpanelUIFigure, 'slider');
            app.LiveviewSwitch.ValueChangedFcn = createCallbackFcn(app, @LiveviewSwitchValueChanged, true);
            app.LiveviewSwitch.Position = [133 449 45 20];
            app.LiveviewSwitch.Value = 'On';

            % Create InitialintroscreenEditFieldLabel
            app.InitialintroscreenEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.InitialintroscreenEditFieldLabel.HorizontalAlignment = 'right';
            app.InitialintroscreenEditFieldLabel.Enable = 'off';
            app.InitialintroscreenEditFieldLabel.Position = [260 188 103 22];
            app.InitialintroscreenEditFieldLabel.Text = 'Initial intro screen:';

            % Create InitialintroscreenEditField
            app.InitialintroscreenEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'numeric');
            app.InitialintroscreenEditField.HorizontalAlignment = 'left';
            app.InitialintroscreenEditField.Enable = 'off';
            app.InitialintroscreenEditField.Position = [374 189 59 22];
            app.InitialintroscreenEditField.Value = 10;

            % Create PausetimeEditFieldLabel
            app.PausetimeEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.PausetimeEditFieldLabel.HorizontalAlignment = 'right';
            app.PausetimeEditFieldLabel.Enable = 'off';
            app.PausetimeEditFieldLabel.Position = [300 152 69 22];
            app.PausetimeEditFieldLabel.Text = 'Pause time:';

            % Create PausetimeEditField
            app.PausetimeEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'numeric');
            app.PausetimeEditField.HorizontalAlignment = 'left';
            app.PausetimeEditField.Enable = 'off';
            app.PausetimeEditField.Position = [374 152 59 22];

            % Create FinalthankyouscreenLabel
            app.FinalthankyouscreenLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FinalthankyouscreenLabel.HorizontalAlignment = 'right';
            app.FinalthankyouscreenLabel.Enable = 'off';
            app.FinalthankyouscreenLabel.Position = [521 188 130 22];
            app.FinalthankyouscreenLabel.Text = 'Final thank you screen:';

            % Create FinalthankyouscreenEditField
            app.FinalthankyouscreenEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'numeric');
            app.FinalthankyouscreenEditField.HorizontalAlignment = 'left';
            app.FinalthankyouscreenEditField.Enable = 'off';
            app.FinalthankyouscreenEditField.Position = [657 188 68 22];
            app.FinalthankyouscreenEditField.Value = 10;

            % Create Lamp_5
            app.Lamp_5 = uilamp(app.ExperimentcontrolpanelUIFigure);
            app.Lamp_5.Position = [211 267 20 20];
            app.Lamp_5.Color = [1 0 0];

            % Create ExitButton
            app.ExitButton = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.ExitButton.ButtonPushedFcn = createCallbackFcn(app, @ExitButtonPushed, true);
            app.ExitButton.Position = [691 35 100 33];
            app.ExitButton.Text = 'Exit';

            % Create VerifyVLCfullscreenCheckBox
            app.VerifyVLCfullscreenCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.VerifyVLCfullscreenCheckBox.ValueChangedFcn = createCallbackFcn(app, @VerifyVLCfullscreenCheckBoxValueChanged, true);
            app.VerifyVLCfullscreenCheckBox.Enable = 'off';
            app.VerifyVLCfullscreenCheckBox.Text = 'Verify VLC full screen';
            app.VerifyVLCfullscreenCheckBox.Position = [673 270 137 22];
            app.VerifyVLCfullscreenCheckBox.Value = true;

            % Create Button_dir
            app.Button_dir = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_dir.ButtonPushedFcn = createCallbackFcn(app, @Button_dirPushed, true);
            app.Button_dir.Icon = 'foldericon.png';
            app.Button_dir.Enable = 'off';
            app.Button_dir.Position = [1197 231 34 22];
            app.Button_dir.Text = '';

            % Create ExperimentcontrolpanelLabel
            app.ExperimentcontrolpanelLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.ExperimentcontrolpanelLabel.FontSize = 14;
            app.ExperimentcontrolpanelLabel.FontWeight = 'bold';
            app.ExperimentcontrolpanelLabel.Position = [600 567 174 22];
            app.ExperimentcontrolpanelLabel.Text = 'Experiment control panel';

            % Create WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel
            app.WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel.HorizontalAlignment = 'center';
            app.WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel.FontColor = [0.8 0.8 0.8];
            app.WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel.Position = [362 1 706 22];
            app.WrittenbyShaulShvimmerElectroOpticalengineeringMScstudentLabel.Text = 'Written in MATLAB 2020a by Shaul Shvimmer, Electro-Optical engineering M.Sc student, saulsh@post.bgu.ac.il';

            % Create PlaytimeLabel
            app.PlaytimeLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.PlaytimeLabel.HorizontalAlignment = 'right';
            app.PlaytimeLabel.Enable = 'off';
            app.PlaytimeLabel.Position = [562 153 58 22];
            app.PlaytimeLabel.Text = 'Play time:';

            % Create PlaytimeDropDown
            app.PlaytimeDropDown = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.PlaytimeDropDown.Items = {'Auto'};
            app.PlaytimeDropDown.Editable = 'on';
            app.PlaytimeDropDown.ValueChangedFcn = createCallbackFcn(app, @PlaytimeDropDownValueChanged, true);
            app.PlaytimeDropDown.Enable = 'off';
            app.PlaytimeDropDown.BackgroundColor = [1 1 1];
            app.PlaytimeDropDown.Position = [655 153 69 22];
            app.PlaytimeDropDown.Value = 'Auto';

            % Create LWIRcameraSwitchLabel
            app.LWIRcameraSwitchLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.LWIRcameraSwitchLabel.HorizontalAlignment = 'center';
            app.LWIRcameraSwitchLabel.Position = [20 309 78 22];
            app.LWIRcameraSwitchLabel.Text = 'LWIR camera';

            % Create LWIRcameraSwitch
            app.LWIRcameraSwitch = uiswitch(app.ExperimentcontrolpanelUIFigure, 'slider');
            app.LWIRcameraSwitch.ValueChangedFcn = createCallbackFcn(app, @LWIRcameraSwitchValueChanged, true);
            app.LWIRcameraSwitch.Position = [131 312 45 20];
            app.LWIRcameraSwitch.Value = 'On';

            % Create Lamp_6
            app.Lamp_6 = uilamp(app.ExperimentcontrolpanelUIFigure);
            app.Lamp_6.Position = [211 313 20 20];

            % Create StopButton
            app.StopButton = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Enable = 'off';
            app.StopButton.Position = [460 35 100 33];
            app.StopButton.Text = 'Stop';

            % Create PopuppositionEditFieldLabel
            app.PopuppositionEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.PopuppositionEditFieldLabel.HorizontalAlignment = 'right';
            app.PopuppositionEditFieldLabel.Enable = 'off';
            app.PopuppositionEditFieldLabel.Position = [980 270 92 22];
            app.PopuppositionEditFieldLabel.Text = 'Pop-up position:';

            % Create PopuppositionEditField
            app.PopuppositionEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.PopuppositionEditField.Enable = 'off';
            app.PopuppositionEditField.Position = [1079 270 76 22];
            app.PopuppositionEditField.Value = '2780,666';

            % Create QuestionsPopupCheckBox
            app.QuestionsPopupCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.QuestionsPopupCheckBox.ValueChangedFcn = createCallbackFcn(app, @QuestionsPopupCheckBoxValueChanged, true);
            app.QuestionsPopupCheckBox.Enable = 'off';
            app.QuestionsPopupCheckBox.Text = 'Questions Pop-up';
            app.QuestionsPopupCheckBox.Position = [837 270 117 22];
            app.QuestionsPopupCheckBox.Value = true;

            % Create DeviceDropDownLabel
            app.DeviceDropDownLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.DeviceDropDownLabel.HorizontalAlignment = 'right';
            app.DeviceDropDownLabel.Position = [247 401 46 22];
            app.DeviceDropDownLabel.Text = 'Device:';

            % Create DeviceDropDown
            app.DeviceDropDown = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.DeviceDropDown.Items = {};
            app.DeviceDropDown.ValueChangedFcn = createCallbackFcn(app, @DeviceDropDownValueChanged, true);
            app.DeviceDropDown.Position = [308 401 189 22];
            app.DeviceDropDown.Value = {};

            % Create CheckButton
            app.CheckButton = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.CheckButton.ButtonPushedFcn = createCallbackFcn(app, @CheckButtonPushed, true);
            app.CheckButton.Enable = 'off';
            app.CheckButton.Position = [1169 270 44 22];
            app.CheckButton.Text = 'Check';

            % Create ResolutionDropDownLabel
            app.ResolutionDropDownLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.ResolutionDropDownLabel.HorizontalAlignment = 'right';
            app.ResolutionDropDownLabel.Position = [561 401 66 22];
            app.ResolutionDropDownLabel.Text = 'Resolution:';

            % Create ResolutionDropDown
            app.ResolutionDropDown = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.ResolutionDropDown.Items = {};
            app.ResolutionDropDown.Position = [643 401 142 22];
            app.ResolutionDropDown.Value = {};

            % Create cameraRefresh
            app.cameraRefresh = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.cameraRefresh.ButtonPushedFcn = createCallbackFcn(app, @cameraRefreshPushed, true);
            app.cameraRefresh.Icon = 'refreshicon.png';
            app.cameraRefresh.Position = [510 401 34 22];
            app.cameraRefresh.Text = '';

            % Create Button_crop
            app.Button_crop = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_crop.ButtonPushedFcn = createCallbackFcn(app, @Button_cropPushed, true);
            app.Button_crop.Icon = 'cropicon.png';
            app.Button_crop.Enable = 'off';
            app.Button_crop.Position = [1143 402 34 21];
            app.Button_crop.Text = '';

            % Create CroppingcoordinatesEditFieldLabel
            app.CroppingcoordinatesEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.CroppingcoordinatesEditFieldLabel.HorizontalAlignment = 'right';
            app.CroppingcoordinatesEditFieldLabel.Enable = 'off';
            app.CroppingcoordinatesEditFieldLabel.Position = [851 401 120 22];
            app.CroppingcoordinatesEditFieldLabel.Text = 'Cropping coordinates';

            % Create CroppingcoordinatesEditField
            app.CroppingcoordinatesEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.CroppingcoordinatesEditField.Enable = 'off';
            app.CroppingcoordinatesEditField.Position = [986 401 138 22];

            % Create CropCheckBox
            app.CropCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.CropCheckBox.ValueChangedFcn = createCallbackFcn(app, @CropCheckBoxValueChanged, true);
            app.CropCheckBox.Text = 'Crop';
            app.CropCheckBox.Position = [803 401 48 22];

            % Create StatusLabel
            app.StatusLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.StatusLabel.HorizontalAlignment = 'right';
            app.StatusLabel.Position = [178 83 43 22];
            app.StatusLabel.Text = 'Status:';

            % Create Status1
            app.Status1 = uitextarea(app.ExperimentcontrolpanelUIFigure);
            app.Status1.FontSize = 14;
            app.Status1.FontWeight = 'bold';
            app.Status1.Position = [228 82 563 24];

            % Create RGB2grayCheckBox
            app.RGB2grayCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.RGB2grayCheckBox.Text = 'RGB2gray';
            app.RGB2grayCheckBox.Position = [1195 401 78 22];

            % Create TimeLabel_2
            app.TimeLabel_2 = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.TimeLabel_2.Position = [58 83 35 22];
            app.TimeLabel_2.Text = 'Time:';

            % Create Status2
            app.Status2 = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.Status2.HorizontalAlignment = 'center';
            app.Status2.FontSize = 14;
            app.Status2.FontWeight = 'bold';
            app.Status2.Position = [95 83 32 22];
            app.Status2.Text = '';

            % Create FolderListBoxLabel
            app.FolderListBoxLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FolderListBoxLabel.Enable = 'off';
            app.FolderListBoxLabel.Position = [832 191 70 22];
            app.FolderListBoxLabel.Text = 'Folder:';

            % Create FolderListBox
            app.FolderListBox = uilistbox(app.ExperimentcontrolpanelUIFigure);
            app.FolderListBox.Items = {};
            app.FolderListBox.Enable = 'off';
            app.FolderListBox.Position = [832 49 164 142];
            app.FolderListBox.Value = {};

            % Create SecLabel
            app.SecLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.SecLabel.Position = [139 83 36 22];
            app.SecLabel.Text = '[Sec].';

            % Create PlayerListBoxLabel
            app.PlayerListBoxLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.PlayerListBoxLabel.Enable = 'off';
            app.PlayerListBoxLabel.Position = [1084 191 70 22];
            app.PlayerListBoxLabel.Text = 'Player:';

            % Create PlayerListBox
            app.PlayerListBox = uilistbox(app.ExperimentcontrolpanelUIFigure);
            app.PlayerListBox.Items = {};
            app.PlayerListBox.Enable = 'off';
            app.PlayerListBox.Position = [1075 49 164 142];
            app.PlayerListBox.Value = {};

            % Create Button_right
            app.Button_right = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_right.ButtonPushedFcn = createCallbackFcn(app, @Button_rightPushed, true);
            app.Button_right.Icon = 'right-arrow-icon.png';
            app.Button_right.Enable = 'off';
            app.Button_right.Position = [1016 163 40 28];
            app.Button_right.Text = '';

            % Create Button_left
            app.Button_left = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_left.ButtonPushedFcn = createCallbackFcn(app, @Button_leftPushed, true);
            app.Button_left.Icon = 'left-arrow-icon.png';
            app.Button_left.Enable = 'off';
            app.Button_left.Position = [1017 125 40 28];
            app.Button_left.Text = '';

            % Create Button_refresh_list
            app.Button_refresh_list = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_refresh_list.ButtonPushedFcn = createCallbackFcn(app, @Button_refresh_listPushed, true);
            app.Button_refresh_list.Icon = 'refreshicon.png';
            app.Button_refresh_list.Enable = 'off';
            app.Button_refresh_list.Position = [1240 231 34 22];
            app.Button_refresh_list.Text = '';

            % Create StopafterCheckBox
            app.StopafterCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.StopafterCheckBox.ValueChangedFcn = createCallbackFcn(app, @StopafterCheckBoxValueChanged, true);
            app.StopafterCheckBox.Text = 'Stop after:';
            app.StopafterCheckBox.Position = [784 448 77 22];

            % Create EditField_stop
            app.EditField_stop = uieditfield(app.ExperimentcontrolpanelUIFigure, 'numeric');
            app.EditField_stop.HorizontalAlignment = 'center';
            app.EditField_stop.Enable = 'off';
            app.EditField_stop.Position = [864 448 73 22];

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.ExperimentcontrolpanelUIFigure);
            app.ButtonGroup.Position = [947 444 180 30];

            % Create SecondsButton_stop
            app.SecondsButton_stop = uiradiobutton(app.ButtonGroup);
            app.SecondsButton_stop.Enable = 'off';
            app.SecondsButton_stop.Text = 'Seconds';
            app.SecondsButton_stop.Position = [11 3 69 22];
            app.SecondsButton_stop.Value = true;

            % Create FramesButton_stop
            app.FramesButton_stop = uiradiobutton(app.ButtonGroup);
            app.FramesButton_stop.Enable = 'off';
            app.FramesButton_stop.Text = 'Frames';
            app.FramesButton_stop.Position = [109 3 65 22];

            % Create Label
            app.Label = uilabel(app.ButtonGroup);
            app.Label.Enable = 'off';
            app.Label.Position = [89 3 10 22];
            app.Label.Text = '/';

            % Create WarmupCheckBox
            app.WarmupCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.WarmupCheckBox.ValueChangedFcn = createCallbackFcn(app, @WarmupCheckBoxValueChanged, true);
            app.WarmupCheckBox.Text = 'Warm up:';
            app.WarmupCheckBox.Position = [416 448 74 22];

            % Create EditField_start
            app.EditField_start = uieditfield(app.ExperimentcontrolpanelUIFigure, 'numeric');
            app.EditField_start.HorizontalAlignment = 'center';
            app.EditField_start.Enable = 'off';
            app.EditField_start.Position = [496 448 73 22];
            app.EditField_start.Value = 30;

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.ExperimentcontrolpanelUIFigure);
            app.ButtonGroup_2.Position = [579 444 180 30];

            % Create SecondsButton_start
            app.SecondsButton_start = uiradiobutton(app.ButtonGroup_2);
            app.SecondsButton_start.Enable = 'off';
            app.SecondsButton_start.Text = 'Seconds';
            app.SecondsButton_start.Position = [11 3 69 22];
            app.SecondsButton_start.Value = true;

            % Create FramesButton_start
            app.FramesButton_start = uiradiobutton(app.ButtonGroup_2);
            app.FramesButton_start.Enable = 'off';
            app.FramesButton_start.Text = 'Frames';
            app.FramesButton_start.Position = [109 3 65 22];

            % Create Label_2
            app.Label_2 = uilabel(app.ButtonGroup_2);
            app.Label_2.Enable = 'off';
            app.Label_2.Position = [89 3 10 22];
            app.Label_2.Text = '/';

            % Create ButtonGroup_4
            app.ButtonGroup_4 = uibuttongroup(app.ExperimentcontrolpanelUIFigure);
            app.ButtonGroup_4.TitlePosition = 'centertop';
            app.ButtonGroup_4.Position = [901 305 173 30];

            % Create TemperatureButton
            app.TemperatureButton = uiradiobutton(app.ButtonGroup_4);
            app.TemperatureButton.Text = 'Temperature';
            app.TemperatureButton.Position = [7 3 89 22];
            app.TemperatureButton.Value = true;

            % Create ColorButton
            app.ColorButton = uiradiobutton(app.ButtonGroup_4);
            app.ColorButton.Text = 'Color';
            app.ColorButton.Position = [117 4 51 22];

            % Create SavewhileblackscreenCheckBoxave
            app.SavewhileblackscreenCheckBoxave = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.SavewhileblackscreenCheckBoxave.Enable = 'off';
            app.SavewhileblackscreenCheckBoxave.Text = 'Clear RAM while black screen';
            app.SavewhileblackscreenCheckBoxave.Position = [462 270 182 22];
            app.SavewhileblackscreenCheckBoxave.Value = true;

            % Create Button_right_2
            app.Button_right_2 = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_right_2.ButtonPushedFcn = createCallbackFcn(app, @Button_right_2Pushed, true);
            app.Button_right_2.Icon = 'two-right-arrows-icon.png';
            app.Button_right_2.Enable = 'off';
            app.Button_right_2.Position = [1016 88 40 28];
            app.Button_right_2.Text = '';

            % Create SetButton
            app.SetButton = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.SetButton.ButtonPushedFcn = createCallbackFcn(app, @SetButtonPushed, true);
            app.SetButton.Enable = 'off';
            app.SetButton.Position = [1222 271 44 22];
            app.SetButton.Text = 'Set';

            % Create DonotrecordonblackscreenCheckBox
            app.DonotrecordonblackscreenCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.DonotrecordonblackscreenCheckBox.ValueChangedFcn = createCallbackFcn(app, @DonotrecordonblackscreenCheckBoxValueChanged, true);
            app.DonotrecordonblackscreenCheckBox.Enable = 'off';
            app.DonotrecordonblackscreenCheckBox.Text = 'Do not record on black screen';
            app.DonotrecordonblackscreenCheckBox.Position = [259 270 182 22];
            app.DonotrecordonblackscreenCheckBox.Value = true;

            % Create MemoryallocationEditFieldLabel
            app.MemoryallocationEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.MemoryallocationEditFieldLabel.HorizontalAlignment = 'right';
            app.MemoryallocationEditFieldLabel.Enable = 'off';
            app.MemoryallocationEditFieldLabel.Position = [853 531 106 22];
            app.MemoryallocationEditFieldLabel.Text = 'Memory allocation:';

            % Create MemoryallocationEditField
            app.MemoryallocationEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.MemoryallocationEditField.Enable = 'off';
            app.MemoryallocationEditField.Position = [972 531 67 22];
            app.MemoryallocationEditField.Value = '1000';

            % Create MemoryallocationEditFieldLabel_2
            app.MemoryallocationEditFieldLabel_2 = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.MemoryallocationEditFieldLabel_2.HorizontalAlignment = 'right';
            app.MemoryallocationEditFieldLabel_2.Enable = 'off';
            app.MemoryallocationEditFieldLabel_2.Position = [1044 531 46 22];
            app.MemoryallocationEditFieldLabel_2.Text = 'Frames';

            % Create FramerateLabel
            app.FramerateLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FramerateLabel.Position = [25 54 68 22];
            app.FramerateLabel.Text = 'Frame rate:';

            % Create FPS_status
            app.FPS_status = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FPS_status.HorizontalAlignment = 'center';
            app.FPS_status.FontSize = 14;
            app.FPS_status.FontWeight = 'bold';
            app.FPS_status.Position = [95 54 32 22];
            app.FPS_status.Text = '';

            % Create FPSLabel
            app.FPSLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FPSLabel.Position = [139 54 39 22];
            app.FPSLabel.Text = '[FPS].';

            % Create Initial_BS_units
            app.Initial_BS_units = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.Initial_BS_units.HorizontalAlignment = 'right';
            app.Initial_BS_units.Enable = 'off';
            app.Initial_BS_units.Position = [443 189 26 22];
            app.Initial_BS_units.Text = 'Sec';

            % Create Play_time_units
            app.Play_time_units = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.Play_time_units.HorizontalAlignment = 'right';
            app.Play_time_units.Enable = 'off';
            app.Play_time_units.Position = [730 153 26 22];
            app.Play_time_units.Text = 'Sec';

            % Create Pause_time_units
            app.Pause_time_units = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.Pause_time_units.HorizontalAlignment = 'right';
            app.Pause_time_units.Enable = 'off';
            app.Pause_time_units.Position = [440 153 26 22];
            app.Pause_time_units.Text = 'Sec';

            % Create Last_BS_units
            app.Last_BS_units = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.Last_BS_units.HorizontalAlignment = 'right';
            app.Last_BS_units.Enable = 'off';
            app.Last_BS_units.Position = [734 188 26 22];
            app.Last_BS_units.Text = 'Sec';

            % Create RemarksEditFieldLabel
            app.RemarksEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.RemarksEditFieldLabel.HorizontalAlignment = 'right';
            app.RemarksEditFieldLabel.Enable = 'off';
            app.RemarksEditFieldLabel.Position = [237 494 57 22];
            app.RemarksEditFieldLabel.Text = 'Remarks:';

            % Create RemarksEditField
            app.RemarksEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.RemarksEditField.Enable = 'off';
            app.RemarksEditField.Position = [301 494 763 22];

            % Create ButtonGroup_3
            app.ButtonGroup_3 = uibuttongroup(app.ExperimentcontrolpanelUIFigure);
            app.ButtonGroup_3.Position = [686 527 155 30];

            % Create OrderButton
            app.OrderButton = uiradiobutton(app.ButtonGroup_3);
            app.OrderButton.Enable = 'off';
            app.OrderButton.Text = 'Order';
            app.OrderButton.Position = [11 3 58 22];

            % Create FilenameButton
            app.FilenameButton = uiradiobutton(app.ButtonGroup_3);
            app.FilenameButton.Enable = 'off';
            app.FilenameButton.Text = 'File name';
            app.FilenameButton.Position = [77 3 75 22];
            app.FilenameButton.Value = true;

            % Create SavevideodatabyLabel
            app.SavevideodatabyLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.SavevideodatabyLabel.Enable = 'off';
            app.SavevideodatabyLabel.Position = [573 530 111 22];
            app.SavevideodatabyLabel.Text = 'Save video data by:';

            % Create FlagIRcameraonblackscreenCheckBox
            app.FlagIRcameraonblackscreenCheckBox = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.FlagIRcameraonblackscreenCheckBox.ValueChangedFcn = createCallbackFcn(app, @FlagIRcameraonblackscreenCheckBoxValueChanged, true);
            app.FlagIRcameraonblackscreenCheckBox.Enable = 'off';
            app.FlagIRcameraonblackscreenCheckBox.Text = 'Flag IR camera on black screen';
            app.FlagIRcameraonblackscreenCheckBox.Position = [1089 308 192 22];
            app.FlagIRcameraonblackscreenCheckBox.Value = true;

            % Create FPSdelaycorrectorLabel
            app.FPSdelaycorrectorLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FPSdelaycorrectorLabel.HorizontalAlignment = 'right';
            app.FPSdelaycorrectorLabel.Enable = 'off';
            app.FPSdelaycorrectorLabel.Position = [1101 532 115 22];
            app.FPSdelaycorrectorLabel.Text = 'FPS delay corrector:';

            % Create FPSdelaycorrectorEditField
            app.FPSdelaycorrectorEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.FPSdelaycorrectorEditField.HorizontalAlignment = 'center';
            app.FPSdelaycorrectorEditField.Enable = 'off';
            app.FPSdelaycorrectorEditField.Position = [1226 531 50 22];
            app.FPSdelaycorrectorEditField.Value = '0.96';

            % Create FPSdelaycorrectorstepEditFieldLabel
            app.FPSdelaycorrectorstepEditFieldLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.FPSdelaycorrectorstepEditFieldLabel.HorizontalAlignment = 'right';
            app.FPSdelaycorrectorstepEditFieldLabel.Enable = 'off';
            app.FPSdelaycorrectorstepEditFieldLabel.Position = [1075 495 141 22];
            app.FPSdelaycorrectorstepEditFieldLabel.Text = 'FPS delay corrector step:';

            % Create FPSdelaycorrectorstepEditField
            app.FPSdelaycorrectorstepEditField = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.FPSdelaycorrectorstepEditField.HorizontalAlignment = 'center';
            app.FPSdelaycorrectorstepEditField.Enable = 'off';
            app.FPSdelaycorrectorstepEditField.Position = [1226 494 50 22];
            app.FPSdelaycorrectorstepEditField.Value = '0.003';

            % Create Lamp_7
            app.Lamp_7 = uilamp(app.ExperimentcontrolpanelUIFigure);
            app.Lamp_7.Position = [211 357 20 20];

            % Create NIRcameraSwitchLabel
            app.NIRcameraSwitchLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.NIRcameraSwitchLabel.HorizontalAlignment = 'center';
            app.NIRcameraSwitchLabel.Position = [27 355 70 22];
            app.NIRcameraSwitchLabel.Text = 'NIR camera';

            % Create NIRcameraSwitch
            app.NIRcameraSwitch = uiswitch(app.ExperimentcontrolpanelUIFigure, 'slider');
            app.NIRcameraSwitch.ValueChangedFcn = createCallbackFcn(app, @NIRcameraSwitchValueChanged, true);
            app.NIRcameraSwitch.Position = [132 358 45 20];
            app.NIRcameraSwitch.Value = 'On';

            % Create LWIRimageasLabel
            app.LWIRimageasLabel = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.LWIRimageasLabel.Position = [803 309 90 22];
            app.LWIRimageasLabel.Text = 'LWIR image as:';

            % Create cameraRefresh_2
            app.cameraRefresh_2 = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.cameraRefresh_2.ButtonPushedFcn = createCallbackFcn(app, @cameraRefresh_2ButtonPushed, true);
            app.cameraRefresh_2.Icon = 'refreshicon.png';
            app.cameraRefresh_2.Position = [511 356 34 22];
            app.cameraRefresh_2.Text = '';

            % Create Button_crop_2
            app.Button_crop_2 = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_crop_2.ButtonPushedFcn = createCallbackFcn(app, @Button_crop_2Pushed, true);
            app.Button_crop_2.Icon = 'cropicon.png';
            app.Button_crop_2.Position = [1144 358 34 21];
            app.Button_crop_2.Text = '';

            % Create CropCheckBox_2
            app.CropCheckBox_2 = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.CropCheckBox_2.ValueChangedFcn = createCallbackFcn(app, @CropCheckBox_2ValueChanged, true);
            app.CropCheckBox_2.Text = 'Crop';
            app.CropCheckBox_2.Position = [804 357 48 22];
            app.CropCheckBox_2.Value = true;

            % Create RGB2grayCheckBox_2
            app.RGB2grayCheckBox_2 = uicheckbox(app.ExperimentcontrolpanelUIFigure);
            app.RGB2grayCheckBox_2.Text = 'RGB2gray';
            app.RGB2grayCheckBox_2.Position = [1196 357 78 22];

            % Create DeviceDropDown_2Label
            app.DeviceDropDown_2Label = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.DeviceDropDown_2Label.HorizontalAlignment = 'right';
            app.DeviceDropDown_2Label.Position = [248 356 46 22];
            app.DeviceDropDown_2Label.Text = 'Device:';

            % Create DeviceDropDown_2
            app.DeviceDropDown_2 = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.DeviceDropDown_2.Items = {};
            app.DeviceDropDown_2.ValueChangedFcn = createCallbackFcn(app, @DeviceDropDown_2ValueChanged, true);
            app.DeviceDropDown_2.Position = [309 356 189 22];
            app.DeviceDropDown_2.Value = {};

            % Create ResolutionDropDown_2Label
            app.ResolutionDropDown_2Label = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.ResolutionDropDown_2Label.HorizontalAlignment = 'right';
            app.ResolutionDropDown_2Label.Position = [562 356 66 22];
            app.ResolutionDropDown_2Label.Text = 'Resolution:';

            % Create ResolutionDropDown_2
            app.ResolutionDropDown_2 = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.ResolutionDropDown_2.Items = {};
            app.ResolutionDropDown_2.Position = [644 356 142 22];
            app.ResolutionDropDown_2.Value = {};

            % Create CroppingcoordinatesEditField_2Label
            app.CroppingcoordinatesEditField_2Label = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.CroppingcoordinatesEditField_2Label.HorizontalAlignment = 'right';
            app.CroppingcoordinatesEditField_2Label.Position = [852 357 120 22];
            app.CroppingcoordinatesEditField_2Label.Text = 'Cropping coordinates';

            % Create CroppingcoordinatesEditField_2
            app.CroppingcoordinatesEditField_2 = uieditfield(app.ExperimentcontrolpanelUIFigure, 'text');
            app.CroppingcoordinatesEditField_2.Position = [987 357 138 22];

            % Create cameraRefresh_3
            app.cameraRefresh_3 = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.cameraRefresh_3.ButtonPushedFcn = createCallbackFcn(app, @cameraRefresh_3ButtonPushed, true);
            app.cameraRefresh_3.Icon = 'refreshicon.png';
            app.cameraRefresh_3.Position = [510 312 34 22];
            app.cameraRefresh_3.Text = '';

            % Create DeviceDropDown_3Label
            app.DeviceDropDown_3Label = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.DeviceDropDown_3Label.HorizontalAlignment = 'right';
            app.DeviceDropDown_3Label.Position = [247 312 46 22];
            app.DeviceDropDown_3Label.Text = 'Device:';

            % Create DeviceDropDown_3
            app.DeviceDropDown_3 = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.DeviceDropDown_3.Items = {};
            app.DeviceDropDown_3.ValueChangedFcn = createCallbackFcn(app, @DeviceDropDown_3ValueChanged, true);
            app.DeviceDropDown_3.Position = [308 312 189 22];
            app.DeviceDropDown_3.Value = {};

            % Create ResolutionDropDown_3Label
            app.ResolutionDropDown_3Label = uilabel(app.ExperimentcontrolpanelUIFigure);
            app.ResolutionDropDown_3Label.HorizontalAlignment = 'right';
            app.ResolutionDropDown_3Label.Position = [561 311 66 22];
            app.ResolutionDropDown_3Label.Text = 'Resolution:';

            % Create ResolutionDropDown_3
            app.ResolutionDropDown_3 = uidropdown(app.ExperimentcontrolpanelUIFigure);
            app.ResolutionDropDown_3.Items = {};
            app.ResolutionDropDown_3.Position = [643 311 142 22];
            app.ResolutionDropDown_3.Value = {};

            % Create Button_left_2
            app.Button_left_2 = uibutton(app.ExperimentcontrolpanelUIFigure, 'push');
            app.Button_left_2.ButtonPushedFcn = createCallbackFcn(app, @Button_left_2Pushed, true);
            app.Button_left_2.Icon = 'two-left-arrows-icon.png';
            app.Button_left_2.Enable = 'off';
            app.Button_left_2.Position = [1016 51 40 28];
            app.Button_left_2.Text = '';

            % Show the figure after all components are created
            app.ExperimentcontrolpanelUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = main

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ExperimentcontrolpanelUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ExperimentcontrolpanelUIFigure)
        end
    end
end