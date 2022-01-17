classdef StiffnessNNApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure  matlab.ui.Figure
        NeuralNetworkStatisticsPanel    matlab.ui.container.Panel
        Performance                     matlab.ui.control.NumericEditField
        PerformanceMSEEditFieldLabel    matlab.ui.control.Label
        UIAxes2                         matlab.ui.control.UIAxes
        NeuralNetworkSettingsButton     matlab.ui.control.StateButton
        DisplayDropDown                 matlab.ui.control.DropDown
        NeuralNetworkSettingsPanel      matlab.ui.container.Panel
        NeuralNetworkRNGButtonGroup     matlab.ui.container.ButtonGroup
        UseVaryingSeedButton            matlab.ui.control.RadioButton
        UseFixedSeedButton              matlab.ui.control.RadioButton
        ShowAdvancedOptionsCheckBox     matlab.ui.control.CheckBox
        InputDataDivisionPanel          matlab.ui.container.Panel
        TestingSlider                   matlab.ui.control.Slider
        TestingSliderLabel              matlab.ui.control.Label
        ValidationSlider                matlab.ui.control.Slider
        ValidationSliderLabel           matlab.ui.control.Label
        TrainingSlider                  matlab.ui.control.Slider
        TrainingSliderLabel             matlab.ui.control.Label
        HiddenNodesPanel                matlab.ui.container.Panel
        Nodes2                          matlab.ui.control.Spinner
        Layer2NodesLabel                matlab.ui.control.Label
        Nodes1                          matlab.ui.control.Spinner
        Layer1NodesLabel                matlab.ui.control.Label
        TrainingAlgorithmButtonGroup    matlab.ui.container.ButtonGroup
        ResilientBackpropagationButton  matlab.ui.control.RadioButton
        BFGSQuasiNewtonButton           matlab.ui.control.RadioButton
        BayesianRegularizationButton    matlab.ui.control.RadioButton
        LevenbergMarquardtButton        matlab.ui.control.RadioButton
        CopydatatoClipboardButton       matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        OutputCurveResolutionEditField  matlab.ui.control.NumericEditField
        OutputCurveResolutionEditFieldLabel  matlab.ui.control.Label
        DropDown                        matlab.ui.control.DropDown
        Example                         matlab.ui.control.Button
        ResetButton                     matlab.ui.control.Button
        RunButton                       matlab.ui.control.Button
        StiffnessDegradationCurveGeneratorPanel  matlab.ui.container.Panel
        GridLayout                      matlab.ui.container.GridLayout
        GridLayoutIESM                  matlab.ui.container.GridLayout
        LabelIESM                       matlab.ui.control.Label
        GridLayoutIESM2                 matlab.ui.container.GridLayout
        IncludeCheckBoxIESM             matlab.ui.control.CheckBox
        ValueEditFieldIESM              matlab.ui.control.NumericEditField
        GridLayoutUC                    matlab.ui.container.GridLayout
        LabelUC                         matlab.ui.control.Label
        GridLayoutUC2                   matlab.ui.container.GridLayout
        IncludeCheckBoxUC               matlab.ui.control.CheckBox
        ValueEditFieldUC                matlab.ui.control.NumericEditField
        GridLayoutAGS                   matlab.ui.container.GridLayout
        LabelRGS                        matlab.ui.control.Label
        GridLayoutAGS2                  matlab.ui.container.GridLayout
        IncludeCheckBoxAGS              matlab.ui.control.CheckBox
        ValueEditFieldAGS               matlab.ui.control.NumericEditField
        GridLayoutRD                    matlab.ui.container.GridLayout
        LabelRD                         matlab.ui.control.Label
        GridLayoutRD2                   matlab.ui.container.GridLayout
        IncludeCheckBoxRD               matlab.ui.control.CheckBox
        ValueEditFieldRD                matlab.ui.control.NumericEditField
        GridLayoutVR                    matlab.ui.container.GridLayout
        LabelVR                         matlab.ui.control.Label
        GridLayoutVR2                   matlab.ui.container.GridLayout
        IncludeCheckBoxVR               matlab.ui.control.CheckBox
        ValueEditFieldVR                matlab.ui.control.NumericEditField
        GridLayoutOCR                   matlab.ui.container.GridLayout
        LabelOCR                        matlab.ui.control.Label
        GridLayoutOCR2                  matlab.ui.container.GridLayout
        IncludeCheckBoxOCR              matlab.ui.control.CheckBox
        ValueEditFieldOCR               matlab.ui.control.NumericEditField
        GridLayoutMESRAP                matlab.ui.container.GridLayout
        LabelMESRAP                     matlab.ui.control.Label
        GridLayout2                     matlab.ui.container.GridLayout
        IncludeCheckBoxMESRAP           matlab.ui.control.CheckBox
        ValueEditFieldMESRAP            matlab.ui.control.NumericEditField
        GridLayoutMES                   matlab.ui.container.GridLayout
        LabelMES                        matlab.ui.control.Label
        GridLayoutMESsplit              matlab.ui.container.GridLayout
        ValueEditFieldMES               matlab.ui.control.NumericEditField
        IncludeCheckBoxMES              matlab.ui.control.CheckBox
        UIAxes                          matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        data=load('StiffnessNNAppData.mat','data'); % Load training data
        inclusion=true(1,8); % array containing boolean values altered by checkboxes
        paramVals=[0 0 0 0 0 0 0 0]; % array containing input parameters
        plotHolder % Description
        OutputRes=200; % Description
        GraphValuesSwitch=1; % Description
        strain;
        GGo; % Description
        SettingsValueSwitch=0; % Description
        regHolder % Description
        oldTraining=70;
        oldTesting=15;
        oldValidation=15; % Description
    end
    
    methods (Access = private)
        
        function [net,performance,outputs] = NNfit(app,database,propSelect,layers,tMethod,division)
            
            inputs = database.input(:,[propSelect 9])';
            %(:,[1 3 4 6 8])
            targets = database.output';
            if layers(1,2)==0; layers=layers(1); end
            
            net = fitnet(layers);
            if length(layers)==1
                net.layers{1}.transferFcn = 'tansig';
                net.layers{2}.transferFcn = 'purelin';
                
            elseif length(layers)==2
                net.layers{1}.transferFcn = 'tansig';
                net.layers{2}.transferFcn = 'tansig';
                net.layers{3}.transferFcn = 'purelin';
            end
            
            % Set up Division of Data for Training, Validation, Testing
            net.divideParam.trainRatio = division(1,2);
            net.divideParam.valRatio = division(1,2);
            net.divideParam.testRatio = division(1,3);
            % Set training method
            net.trainFcn = tMethod;
            % Train the Network
            net.trainParam.showWindow=false;
            [net,tr] = train(net,inputs,targets);
            % Test the Network
            outputs = net(inputs);
            errors = gsubtract(outputs,targets);
            performance = perform(net,targets,outputs);
            
        end
        
        
        function curvePlot(app,net,properties,propSelect)
            app.strain= logspace(-4,1,app.OutputCurveResolutionEditField.Value);
            app.GGo=[];
            for s=app.strain
                app.GGo=[app.GGo net([properties(propSelect) s]')];
            end
            
            app.plotHolder=plot(app.UIAxes,app.data.data.input(:,9),app.data.data.output,app.strain,app.GGo);
            app.plotHolder(1).LineStyle='none';
            app.plotHolder(1).Marker='o';
            app.plotHolder(1).MarkerSize=3;
            app.plotHolder(2).LineStyle='-';
            app.plotHolder(2).LineWidth=4;
            b=table(app.strain', app.GGo');
            app.UITable.Data=b;
        end
        
        function regressionPlot(app,NNoutputs)
            p = polyfit(app.data.data.output,NNoutputs,1);
            f = polyval(p,[0 1.1]);
            
            app.regHolder=plot(app.UIAxes2,app.data.data.output,NNoutputs,[0 1.1],[0 1.1],[0 1.1],f);
            app.regHolder(1).LineStyle='none';
            app.regHolder(1).Marker='+';
            app.regHolder(1).MarkerSize=2;
            app.regHolder(2).LineStyle='--';
            app.regHolder(2).LineWidth=1;
            app.regHolder(3).LineStyle='-';
            app.regHolder(3).LineWidth=1; 
            Fit=['Fit: y = ' num2str(p(1)) 'x + ' num2str(p(2))];
            
            legend(app.UIAxes2,{'Data','Target=Output',Fit},'Location','northwest');

            
        end  
        
        function setAllValues(app,vals)
            app.ValueEditFieldMES.Value=vals(1,1);
            app.ValueEditFieldMESRAP.Value=vals(1,2);
            app.ValueEditFieldOCR.Value=vals(1,3);
            app.ValueEditFieldVR.Value=vals(1,4);
            app.ValueEditFieldRD.Value=vals(1,5);
            app.ValueEditFieldAGS.Value=vals(1,6);
            app.ValueEditFieldUC.Value=vals(1,7);
            app.ValueEditFieldIESM.Value=vals(1,8);
            app.paramVals=vals;
        end
        
        function setAllChecks(app,checks)
            app.IncludeCheckBoxMES.Value=checks(1,1);
            app.IncludeCheckBoxMESRAP.Value=checks(1,2);
            app.IncludeCheckBoxOCR.Value=checks(1,3);
            app.IncludeCheckBoxVR.Value=checks(1,4);
            app.IncludeCheckBoxRD.Value=checks(1,5);
            app.IncludeCheckBoxAGS.Value=checks(1,6);
            app.IncludeCheckBoxUC.Value=checks(1,7);
            app.IncludeCheckBoxIESM.Value=checks(1,8);
            app.inclusion=checks;
            app.ValueEditFieldMES.Enable=checks(1,1);
            app.ValueEditFieldMESRAP.Enable=checks(1,2);
            app.ValueEditFieldOCR.Enable=checks(1,3);
            app.ValueEditFieldVR.Enable=checks(1,4);
            app.ValueEditFieldRD.Enable=checks(1,5);
            app.ValueEditFieldAGS.Enable=checks(1,6);
            app.ValueEditFieldUC.Enable=checks(1,7);
            app.ValueEditFieldIESM.Enable=checks(1,8);
            
        end
        
        function enablePre(app,bool)
            app.ValueEditFieldMES.Enable=bool;
            app.ValueEditFieldMESRAP.Enable=bool;
            app.ValueEditFieldOCR.Enable=bool;
            app.ValueEditFieldVR.Enable=bool;
            app.ValueEditFieldRD.Enable=bool;
            app.ValueEditFieldAGS.Enable=bool;
            app.ValueEditFieldUC.Enable=bool;
            app.ValueEditFieldIESM.Enable=bool;
            app.IncludeCheckBoxMES.Enable=bool;
            app.IncludeCheckBoxMESRAP.Enable=bool;
            app.IncludeCheckBoxOCR.Enable=bool;
            app.IncludeCheckBoxVR.Enable=bool;
            app.IncludeCheckBoxRD.Enable=bool;
            app.IncludeCheckBoxAGS.Enable=bool;
            app.IncludeCheckBoxUC.Enable=bool;
            app.IncludeCheckBoxIESM.Enable=bool;
            app.Example.Enable=bool;
            app.DropDown.Enable=bool;
            app.Nodes1.Enable=bool;
            app.Nodes2.Enable=bool;
            app.OutputCurveResolutionEditField.Enable=bool;
            app.RunButton.Enable=bool;
            app.LevenbergMarquardtButton.Enable=bool;
            app.BayesianRegularizationButton.Enable=bool;
            app.BFGSQuasiNewtonButton.Enable=bool;
            app.ResilientBackpropagationButton.Enable=bool;
            app.TrainingSlider.Enable=bool;
            app.ValidationSlider.Enable=bool;
            app.TestingSlider.Enable=bool;
            app.UseFixedSeedButton.Enable=bool;
            app.UseVaryingSeedButton.Enable=bool;
            

            
        end
        function enablePost(app, bool)
            app.Performance.Enable=bool;
            app.PerformanceMSEEditFieldLabel.Enable=bool;
            app.DisplayDropDown.Enable=bool;
            
            
        end
        
        function CurveDisplay(app, S)
            if S
                app.UIAxes.Visible='on';
                if size(app.UIAxes.Children)~=0
                app.UIAxes.Children(1, 1).Visible='on';
                app.UIAxes.Children(2, 1).Visible='on';
                end
            else
                app.UIAxes.Visible='off';
                if size(app.UIAxes.Children)~=0
                app.UIAxes.Children(1, 1).Visible='off';
                app.UIAxes.Children(2, 1).Visible='off';
                end
            end
        end
        
        function ValuesDisplay(app,S)
            if S
                app.UITable.Visible = 'on';
                app.CopydatatoClipboardButton.Visible='on';
                app.CopydatatoClipboardButton.Enable=true;
            else
                app.UITable.Visible = 'off';
                app.CopydatatoClipboardButton.Visible='off';
                app.CopydatatoClipboardButton.Enable=false;  
            end            
        end
        
        function SettingsDisplay(app,S)
            if S
                app.NeuralNetworkSettingsPanel.Visible='on';
                app.NeuralNetworkSettingsButton.Value=true;
            else
                app.NeuralNetworkSettingsPanel.Visible='off';
                app.NeuralNetworkSettingsButton.Value=false;
            end                
            
        end
        function NNstatsDisplay(app, S)
            if S
                app.NeuralNetworkStatisticsPanel.Visible='on';
                if size(app.UIAxes2.Children)~=0
                app.UIAxes2.Children(1, 1).Visible='on';
                app.UIAxes2.Children(2, 1).Visible='on';
                app.UIAxes2.Children(3, 1).Visible='on';
                app.UIAxes2.Legend.Visible='on';
                end
            else
                app.NeuralNetworkStatisticsPanel.Visible='off';
                if size(app.UIAxes2.Children)~=0
                app.UIAxes2.Children(1, 1).Visible='off';
                app.UIAxes2.Children(2, 1).Visible='off';
                app.UIAxes2.Children(3, 1).Visible='off';
                app.UIAxes2.Legend.Visible='off';
                end                
            end                
            
            
        end
        
        function updateDisplay(app)
            if strcmp(app.DisplayDropDown.Value,'Show Curve')
                NNstatsDisplay(app,false);
                ValuesDisplay(app, false);
                SettingsDisplay(app,false);
                CurveDisplay(app, true);
                
            elseif strcmp(app.DisplayDropDown.Value,'Show Values')
                CurveDisplay(app, false);
                NNstatsDisplay(app,false);
                SettingsDisplay(app,false);
                ValuesDisplay(app, true);
                
            elseif strcmp(app.DisplayDropDown.Value,'Show NN Stats')
                CurveDisplay(app, false);
                ValuesDisplay(app, false);
                SettingsDisplay(app,false);
                NNstatsDisplay(app,true);
            end
            
        end
        

        

        

        
        function t = getTraining(app)
            if app.LevenbergMarquardtButton.Value==1
                t='trainlm';
            elseif app.BayesianRegularizationButton.Value==1
                t='trainbr';
            elseif app.BFGSQuasiNewtonButton.Value==1
                t='trainbfg';
            elseif app.ResilientBackpropagationButton.Vaue==1
                t='trainrp';
            end
            
        end
        
        function d=getDivision(app)
            d(1,1)=app.TrainingSlider.Value;
            d(1,2)=app.ValidationSlider.Value;
            d(1,3)=app.TestingSlider.Value;
            
        end
        
        function updateSliders(app)
            app.oldTraining=app.TrainingSlider.Value;
            app.oldValidation=app.ValidationSlider.Value;
            app.oldTesting=app.TestingSlider.Value;
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: IncludeCheckBoxMES
        function IncludeCheckBoxMESValueChanged(app, event)
            value = app.IncludeCheckBoxMES.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldMES.Enable = false;
                app.inclusion(1,1)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldMES.Enable = true;
                app.inclusion(1,1)=true;
            end
        end

        % Value changed function: IncludeCheckBoxMESRAP
        function IncludeCheckBoxMESRAPValueChanged(app, event)
            value = app.IncludeCheckBoxMESRAP.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldMESRAP.Enable = false;
                app.inclusion(1,2)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldMESRAP.Enable = true;
                app.inclusion(1,2)=true;
            end
        end

        % Value changed function: IncludeCheckBoxOCR
        function IncludeCheckBoxOCRValueChanged(app, event)
            value = app.IncludeCheckBoxOCR.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldOCR.Enable = false;
                app.inclusion(1,3)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldOCR.Enable = true;
                app.inclusion(1,3)=true;
            end
        end

        % Value changed function: IncludeCheckBoxVR
        function IncludeCheckBoxVRValueChanged(app, event)
            value = app.IncludeCheckBoxVR.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldVR.Enable = false;
                app.inclusion(1,4)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldVR.Enable = true;
                app.inclusion(1,4)=true;
            end
        end

        % Value changed function: IncludeCheckBoxRD
        function IncludeCheckBoxRDValueChanged(app, event)
            value = app.IncludeCheckBoxRD.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldRD.Enable = false;
                app.inclusion(1,5)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldRD.Enable = true;
                app.inclusion(1,5)=true;
            end
        end

        % Value changed function: IncludeCheckBoxAGS
        function IncludeCheckBoxAGSValueChanged(app, event)
            value = app.IncludeCheckBoxAGS.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldAGS.Enable = false;
                app.inclusion(1,6)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldAGS.Enable = true;
                app.inclusion(1,6)=true;
            end
        end

        % Value changed function: IncludeCheckBoxUC
        function IncludeCheckBoxUCValueChanged(app, event)
            value = app.IncludeCheckBoxUC.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldUC.Enable = false;
                app.inclusion(1,7)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldUC.Enable = true;
                app.inclusion(1,7)=true;
            end
        end

        % Value changed function: IncludeCheckBoxIESM
        function IncludeCheckBoxIESMValueChanged(app, event)
            value = app.IncludeCheckBoxIESM.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldIESM.Enable = false;
                app.inclusion(1,8)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldIESM.Enable = true;
                app.inclusion(1,8)=true;
            end
        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            enablePre(app,false);
            
            app.RunButton.BackgroundColor = [0.96 0.96 0.96];
            app.DisplayDropDown.Value='Show Curve';
            updateDisplay(app);
    
            props=[1 2 3 4 5 6 7 8];
            pause(0.01);
            if app.UseFixedSeedButton.Value==true
                rng(0);
            else
                rng(sum(clock));
            end
            [net,performance,output] = NNfit(app,app.data.data,props(logical(app.inclusion)),...
                [app.Nodes1.Value app.Nodes2.Value],getTraining(app),getDivision(app));
            %[net,performance,output] = NNfit(app,app.data.data,props(boolean(app.inclusion)),...
                %[app.Nodes1.Value app.Nodes2.Value],getTraining(app),getDivision(app));
            curvePlot(app,net,app.paramVals,logical(app.inclusion)); %curvePlot(app,net,app.paramVals,boolean(app.inclusion));
            regressionPlot(app,output);
            app.Performance.Value=performance;
            
            enablePost(app,true);
            

        end

        % Value changed function: ValueEditFieldMES
        function ValueEditFieldMESValueChanged(app, event)
            value = app.ValueEditFieldMES.Value;
            app.paramVals(1,1)=value;
        end

        % Value changed function: ValueEditFieldMESRAP
        function ValueEditFieldMESRAPValueChanged(app, event)
            value = app.ValueEditFieldMESRAP.Value;
            app.paramVals(1,2)=value;
        end

        % Value changed function: ValueEditFieldOCR
        function ValueEditFieldOCRValueChanged(app, event)
            value = app.ValueEditFieldOCR.Value;
            app.paramVals(1,3)=value;
        end

        % Value changed function: ValueEditFieldVR
        function ValueEditFieldVRValueChanged(app, event)
            value = app.ValueEditFieldVR.Value;
            app.paramVals(1,4)=value;
        end

        % Value changed function: ValueEditFieldRD
        function ValueEditFieldRDValueChanged(app, event)
            value = app.ValueEditFieldRD.Value;
            app.paramVals(1,5)=value;
        end

        % Value changed function: ValueEditFieldAGS
        function ValueEditFieldAGSValueChanged(app, event)
            value = app.ValueEditFieldAGS.Value;
            app.paramVals(1,6)=value;
        end

        % Value changed function: ValueEditFieldUC
        function ValueEditFieldUCValueChanged(app, event)
            value = app.ValueEditFieldUC.Value;
            app.paramVals(1,7)=value;
        end

        % Value changed function: ValueEditFieldIESM
        function ValueEditFieldIESMValueChanged(app, event)
            value = app.ValueEditFieldIESM.Value;
            app.paramVals(1,8)=value;
        end

        % Button pushed function: Example
        function ExampleButtonPushed(app, event)
            
            if app.DropDown.Value=='Example 1'
                setAllValues(app,[0.1 1.0194 1.0 0.76 0.6923 0.990 1.20 161.1269]);
                setAllChecks(app,[1 1 1 1 1 1 1 1]);
            elseif app.DropDown.Value=='Example 2'
                setAllValues(app,[0.0245 0.24975 1 0.68	0.875 0.162 1.46 74.1753]);
                setAllChecks(app,[0 1 0 1 1 0 1 0]);
            elseif app.DropDown.Value=='Example 3'
                setAllValues(app,[0.098 0.999 1 0.688 0.8011 0.2 1.3 104]);
                setAllChecks(app,[0 0 0 1 1 0 0 1]);
            elseif app.DropDown.Value=='Example 4'
                setAllValues(app,[0.0150 0.1529 1 0.6610 0.8495 0.1600 1.5 58.104]);
                setAllChecks(app,[1 0 1 0 0 1 0 1]);
            end
            
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            delete(app.plotHolder);
            delete(app.regHolder);
            setAllValues(app,[0 0 0 0 0 0 0 0]);
            setAllChecks(app,[true true true true true true true true]);
            app.DropDown.Value='Example 1';
            app.Nodes1.Value=8;
            app.Nodes2.Value=3;
            app.BayesianRegularizationButton.Value=true;
            app.UseFixedSeedButton.Value=true;
            app.TrainingSlider.Value=70;
            app.ValidationSlider.Value=15;
            app.TestingSlider.Value=15;
            app.ShowAdvancedOptionsCheckBox.Value=false;
            app.NeuralNetworkRNGButtonGroup.Visible=app.ShowAdvancedOptionsCheckBox.Value;
            
            app.OutputCurveResolutionEditField.Value=200;
            app.Performance.Value=0;
            enablePre(app,true);
            enablePost(app,false);
            app.RunButton.BackgroundColor = [0 1 0];
            app.DisplayDropDown.Value='Show Curve';
            updateDisplay(app);

        end

        % Callback function
        function ShowValuesButtonPushed(app, event)
            if app.GraphValuesSwitch==1
                app.GraphValuesSwitch=0;
                app.ShowValuesButton.Text={'Show'; 'Curve'};
                CurveDisplay(app, false);
                ValuesDisplay(app, true);
                
            else
                app.GraphValuesSwitch=1;
                app.ShowValuesButton.Text={'Show'; 'Values'};
                CurveDisplay(app, true);
                ValuesDisplay(app, false);
            end
        end

        % Button pushed function: CopydatatoClipboardButton
        function CopydatatoClipboardButtonPushed(app, event)
            clipboard('copy',[app.strain', app.GGo']);
        end

        % Value changed function: NeuralNetworkSettingsButton
        function NeuralNetworkSettingsButtonValueChanged(app, event)
            value = app.NeuralNetworkSettingsButton.Value;
            CurveDisplay(app,false);
            ValuesDisplay(app,false);
            NNstatsDisplay(app,false);
            SettingsDisplay(app,value);
            if value==false
                updateDisplay(app);
            end
            
        end

        % Value changed function: DisplayDropDown
        function DisplayDropDownValueChanged(app, event)
               updateDisplay(app);
        end

        % Value changed function: ShowAdvancedOptionsCheckBox
        function ShowAdvancedOptionsCheckBoxValueChanged(app, event)
            value = app.ShowAdvancedOptionsCheckBox.Value;
            app.NeuralNetworkRNGButtonGroup.Visible=value;
        end

        % Value changed function: TrainingSlider
        function TrainingSliderValueChanged(app, event)
            dTraining = app.TrainingSlider.Value - app.oldTraining;
            N1=app.oldValidation-dTraining/2;
            N2=app.oldTesting-dTraining/2;   
            if N1<=1
                N2=N2+N1; N1=1;
            elseif N2<=1
                N1=N1+N2; N2=1;
            elseif N1>=100
                N2=N2-N1+100; N1=100;
            elseif N2>=100
                N1=N1-N2+100; N2=100;
            end
            app.ValidationSlider.Value=N1;
            app.TestingSlider.Value=N2;
            if app.TrainingSlider.Value < 1; app.TrainingSlider.Value=1; end
            updateSliders(app);
        end

        % Value changed function: ValidationSlider
        function ValidationSliderValueChanged(app, event)
            dValidation = app.ValidationSlider.Value - app.oldValidation;
            N1=app.oldTraining-dValidation/2;
            N2=app.oldTesting-dValidation/2;
            if N1<=1
                N2=N2+N1; N1=1;
            elseif N2<=1
                N1=N1+N2; N2=1;
            elseif N1>=100
                N2=N2-N1+100; N1=100;
            elseif N2>=100
                N1=N1-N2+100; N2=100;
            end
            app.TrainingSlider.Value=N1;
            app.TestingSlider.Value=N2;
            if app.ValidationSlider.Value < 1; app.ValidationSlider.Value=1; end
            updateSliders(app);
        end

        % Value changed function: TestingSlider
        function TestingSliderValueChanged(app, event)
            dTesting = app.TestingSlider.Value - app.oldTesting;
            N1=app.oldValidation-dTesting/2;
            N2=app.oldTraining-dTesting/2;
            if N1<=1
                N2=N2+N1; N1=1;
            elseif N2<=1
                N1=N1+N2; N2=1;
            elseif N1>=100
                N2=N2-N1+100; N1=100;
            elseif N2>=100
                N1=N1-N2+100; N2=100;
            end
            app.ValidationSlider.Value=N1;
            app.TrainingSlider.Value=N2;
            if app.TestingSlider.Value < 1; app.TestingSlider.Value=1; end
            updateSliders(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure and hide until all components are created
            app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure = uifigure('Visible', 'off');
            app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure.Position = [100 100 963 548];
            app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure.Name = 'Shear Stiffness Degradation Curve Neural Network App';
            app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure.Icon = 'Icon.png';

            % Create UIAxes
            app.UIAxes = uiaxes(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            xlabel(app.UIAxes, 'Strain %')
            ylabel(app.UIAxes, 'G/G0')
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.XLim = [0.0001 10];
            app.UIAxes.YLim = [0 1.1];
            app.UIAxes.XTick = [0.0001 0.001 0.01 0.1 1 10];
            app.UIAxes.XScale = 'log';
            app.UIAxes.XTickLabel = {'0.0001'; '0.001'; '0.01'; '0.1'; '1'; '10'};
            app.UIAxes.XMinorTick = 'on';
            app.UIAxes.YTick = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [271 69 690 480];

            % Create StiffnessDegradationCurveGeneratorPanel
            app.StiffnessDegradationCurveGeneratorPanel = uipanel(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.StiffnessDegradationCurveGeneratorPanel.BorderType = 'none';
            app.StiffnessDegradationCurveGeneratorPanel.Title = 'Stiffness Degradation Curve Generator';
            app.StiffnessDegradationCurveGeneratorPanel.FontWeight = 'bold';
            app.StiffnessDegradationCurveGeneratorPanel.FontSize = 13.5;
            app.StiffnessDegradationCurveGeneratorPanel.Position = [1 69 270 480];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.StiffnessDegradationCurveGeneratorPanel);
            app.GridLayout.ColumnWidth = {'1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.RowSpacing = 5;
            app.GridLayout.Padding = [5 5 5 5];

            % Create GridLayoutMES
            app.GridLayoutMES = uigridlayout(app.GridLayout);
            app.GridLayoutMES.ColumnWidth = {'1x'};
            app.GridLayoutMES.ColumnSpacing = 1;
            app.GridLayoutMES.RowSpacing = 1;
            app.GridLayoutMES.Padding = [1 1 1 1];
            app.GridLayoutMES.Layout.Row = 1;
            app.GridLayoutMES.Layout.Column = 1;

            % Create GridLayoutMESsplit
            app.GridLayoutMESsplit = uigridlayout(app.GridLayoutMES);
            app.GridLayoutMESsplit.RowHeight = {'1x'};
            app.GridLayoutMESsplit.ColumnSpacing = 1;
            app.GridLayoutMESsplit.RowSpacing = 0;
            app.GridLayoutMESsplit.Padding = [0 0 0 0];
            app.GridLayoutMESsplit.Layout.Row = 2;
            app.GridLayoutMESsplit.Layout.Column = 1;

            % Create IncludeCheckBoxMES
            app.IncludeCheckBoxMES = uicheckbox(app.GridLayoutMESsplit);
            app.IncludeCheckBoxMES.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxMESValueChanged, true);
            app.IncludeCheckBoxMES.Text = 'Include';
            app.IncludeCheckBoxMES.Layout.Row = 1;
            app.IncludeCheckBoxMES.Layout.Column = 1;
            app.IncludeCheckBoxMES.Value = true;

            % Create ValueEditFieldMES
            app.ValueEditFieldMES = uieditfield(app.GridLayoutMESsplit, 'numeric');
            app.ValueEditFieldMES.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldMESValueChanged, true);
            app.ValueEditFieldMES.Layout.Row = 1;
            app.ValueEditFieldMES.Layout.Column = 2;

            % Create LabelMES
            app.LabelMES = uilabel(app.GridLayoutMES);
            app.LabelMES.FontWeight = 'bold';
            app.LabelMES.FontAngle = 'italic';
            app.LabelMES.Layout.Row = 1;
            app.LabelMES.Layout.Column = 1;
            app.LabelMES.Text = 'Mean Effective Stress (P'')';

            % Create GridLayoutMESRAP
            app.GridLayoutMESRAP = uigridlayout(app.GridLayout);
            app.GridLayoutMESRAP.ColumnWidth = {'1x'};
            app.GridLayoutMESRAP.ColumnSpacing = 1;
            app.GridLayoutMESRAP.RowSpacing = 1;
            app.GridLayoutMESRAP.Padding = [1 1 1 1];
            app.GridLayoutMESRAP.Layout.Row = 2;
            app.GridLayoutMESRAP.Layout.Column = 1;

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.GridLayoutMESRAP);
            app.GridLayout2.RowHeight = {'1x'};
            app.GridLayout2.ColumnSpacing = 1;
            app.GridLayout2.RowSpacing = 1;
            app.GridLayout2.Padding = [0 0 0 0];
            app.GridLayout2.Layout.Row = 2;
            app.GridLayout2.Layout.Column = 1;

            % Create ValueEditFieldMESRAP
            app.ValueEditFieldMESRAP = uieditfield(app.GridLayout2, 'numeric');
            app.ValueEditFieldMESRAP.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldMESRAPValueChanged, true);
            app.ValueEditFieldMESRAP.Layout.Row = 1;
            app.ValueEditFieldMESRAP.Layout.Column = 2;

            % Create IncludeCheckBoxMESRAP
            app.IncludeCheckBoxMESRAP = uicheckbox(app.GridLayout2);
            app.IncludeCheckBoxMESRAP.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxMESRAPValueChanged, true);
            app.IncludeCheckBoxMESRAP.Text = 'Include';
            app.IncludeCheckBoxMESRAP.Layout.Row = 1;
            app.IncludeCheckBoxMESRAP.Layout.Column = 1;
            app.IncludeCheckBoxMESRAP.Value = true;

            % Create LabelMESRAP
            app.LabelMESRAP = uilabel(app.GridLayoutMESRAP);
            app.LabelMESRAP.FontWeight = 'bold';
            app.LabelMESRAP.FontAngle = 'italic';
            app.LabelMESRAP.Layout.Row = 1;
            app.LabelMESRAP.Layout.Column = 1;
            app.LabelMESRAP.Text = 'Mean Effective Stress/Atmospheric (P''/Pa)';

            % Create GridLayoutOCR
            app.GridLayoutOCR = uigridlayout(app.GridLayout);
            app.GridLayoutOCR.ColumnWidth = {'1x'};
            app.GridLayoutOCR.ColumnSpacing = 1;
            app.GridLayoutOCR.RowSpacing = 1;
            app.GridLayoutOCR.Padding = [1 1 1 1];
            app.GridLayoutOCR.Layout.Row = 3;
            app.GridLayoutOCR.Layout.Column = 1;

            % Create GridLayoutOCR2
            app.GridLayoutOCR2 = uigridlayout(app.GridLayoutOCR);
            app.GridLayoutOCR2.RowHeight = {'1x'};
            app.GridLayoutOCR2.ColumnSpacing = 1;
            app.GridLayoutOCR2.RowSpacing = 1;
            app.GridLayoutOCR2.Padding = [0 0 0 0];
            app.GridLayoutOCR2.Layout.Row = 2;
            app.GridLayoutOCR2.Layout.Column = 1;

            % Create ValueEditFieldOCR
            app.ValueEditFieldOCR = uieditfield(app.GridLayoutOCR2, 'numeric');
            app.ValueEditFieldOCR.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldOCRValueChanged, true);
            app.ValueEditFieldOCR.Layout.Row = 1;
            app.ValueEditFieldOCR.Layout.Column = 2;

            % Create IncludeCheckBoxOCR
            app.IncludeCheckBoxOCR = uicheckbox(app.GridLayoutOCR2);
            app.IncludeCheckBoxOCR.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxOCRValueChanged, true);
            app.IncludeCheckBoxOCR.Text = 'Include';
            app.IncludeCheckBoxOCR.Layout.Row = 1;
            app.IncludeCheckBoxOCR.Layout.Column = 1;
            app.IncludeCheckBoxOCR.Value = true;

            % Create LabelOCR
            app.LabelOCR = uilabel(app.GridLayoutOCR);
            app.LabelOCR.FontWeight = 'bold';
            app.LabelOCR.FontAngle = 'italic';
            app.LabelOCR.Layout.Row = 1;
            app.LabelOCR.Layout.Column = 1;
            app.LabelOCR.Text = 'Overconsolidation Ratio (OCR)';

            % Create GridLayoutVR
            app.GridLayoutVR = uigridlayout(app.GridLayout);
            app.GridLayoutVR.ColumnWidth = {'1x'};
            app.GridLayoutVR.ColumnSpacing = 1;
            app.GridLayoutVR.RowSpacing = 1;
            app.GridLayoutVR.Padding = [1 1 1 1];
            app.GridLayoutVR.Layout.Row = 4;
            app.GridLayoutVR.Layout.Column = 1;

            % Create GridLayoutVR2
            app.GridLayoutVR2 = uigridlayout(app.GridLayoutVR);
            app.GridLayoutVR2.RowHeight = {'1x'};
            app.GridLayoutVR2.ColumnSpacing = 1;
            app.GridLayoutVR2.RowSpacing = 1;
            app.GridLayoutVR2.Padding = [0 0 0 0];
            app.GridLayoutVR2.Layout.Row = 2;
            app.GridLayoutVR2.Layout.Column = 1;

            % Create ValueEditFieldVR
            app.ValueEditFieldVR = uieditfield(app.GridLayoutVR2, 'numeric');
            app.ValueEditFieldVR.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldVRValueChanged, true);
            app.ValueEditFieldVR.Layout.Row = 1;
            app.ValueEditFieldVR.Layout.Column = 2;

            % Create IncludeCheckBoxVR
            app.IncludeCheckBoxVR = uicheckbox(app.GridLayoutVR2);
            app.IncludeCheckBoxVR.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxVRValueChanged, true);
            app.IncludeCheckBoxVR.Text = 'Include';
            app.IncludeCheckBoxVR.Layout.Row = 1;
            app.IncludeCheckBoxVR.Layout.Column = 1;
            app.IncludeCheckBoxVR.Value = true;

            % Create LabelVR
            app.LabelVR = uilabel(app.GridLayoutVR);
            app.LabelVR.FontWeight = 'bold';
            app.LabelVR.FontAngle = 'italic';
            app.LabelVR.Layout.Row = 1;
            app.LabelVR.Layout.Column = 1;
            app.LabelVR.Text = 'Void Ratio (e)';

            % Create GridLayoutRD
            app.GridLayoutRD = uigridlayout(app.GridLayout);
            app.GridLayoutRD.ColumnWidth = {'1x'};
            app.GridLayoutRD.ColumnSpacing = 1;
            app.GridLayoutRD.RowSpacing = 1;
            app.GridLayoutRD.Padding = [1 1 1 1];
            app.GridLayoutRD.Layout.Row = 5;
            app.GridLayoutRD.Layout.Column = 1;

            % Create GridLayoutRD2
            app.GridLayoutRD2 = uigridlayout(app.GridLayoutRD);
            app.GridLayoutRD2.RowHeight = {'1x'};
            app.GridLayoutRD2.ColumnSpacing = 1;
            app.GridLayoutRD2.RowSpacing = 1;
            app.GridLayoutRD2.Padding = [0 0 0 0];
            app.GridLayoutRD2.Layout.Row = 2;
            app.GridLayoutRD2.Layout.Column = 1;

            % Create ValueEditFieldRD
            app.ValueEditFieldRD = uieditfield(app.GridLayoutRD2, 'numeric');
            app.ValueEditFieldRD.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldRDValueChanged, true);
            app.ValueEditFieldRD.Layout.Row = 1;
            app.ValueEditFieldRD.Layout.Column = 2;

            % Create IncludeCheckBoxRD
            app.IncludeCheckBoxRD = uicheckbox(app.GridLayoutRD2);
            app.IncludeCheckBoxRD.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxRDValueChanged, true);
            app.IncludeCheckBoxRD.Text = 'Include';
            app.IncludeCheckBoxRD.Layout.Row = 1;
            app.IncludeCheckBoxRD.Layout.Column = 1;
            app.IncludeCheckBoxRD.Value = true;

            % Create LabelRD
            app.LabelRD = uilabel(app.GridLayoutRD);
            app.LabelRD.FontWeight = 'bold';
            app.LabelRD.FontAngle = 'italic';
            app.LabelRD.Layout.Row = 1;
            app.LabelRD.Layout.Column = 1;
            app.LabelRD.Text = 'Relative Density (Dr%)';

            % Create GridLayoutAGS
            app.GridLayoutAGS = uigridlayout(app.GridLayout);
            app.GridLayoutAGS.ColumnWidth = {'1x'};
            app.GridLayoutAGS.ColumnSpacing = 1;
            app.GridLayoutAGS.RowSpacing = 1;
            app.GridLayoutAGS.Padding = [1 1 1 1];
            app.GridLayoutAGS.Layout.Row = 6;
            app.GridLayoutAGS.Layout.Column = 1;

            % Create GridLayoutAGS2
            app.GridLayoutAGS2 = uigridlayout(app.GridLayoutAGS);
            app.GridLayoutAGS2.RowHeight = {'1x'};
            app.GridLayoutAGS2.ColumnSpacing = 1;
            app.GridLayoutAGS2.RowSpacing = 1;
            app.GridLayoutAGS2.Padding = [0 0 0 0];
            app.GridLayoutAGS2.Layout.Row = 2;
            app.GridLayoutAGS2.Layout.Column = 1;

            % Create ValueEditFieldAGS
            app.ValueEditFieldAGS = uieditfield(app.GridLayoutAGS2, 'numeric');
            app.ValueEditFieldAGS.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldAGSValueChanged, true);
            app.ValueEditFieldAGS.Layout.Row = 1;
            app.ValueEditFieldAGS.Layout.Column = 2;

            % Create IncludeCheckBoxAGS
            app.IncludeCheckBoxAGS = uicheckbox(app.GridLayoutAGS2);
            app.IncludeCheckBoxAGS.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxAGSValueChanged, true);
            app.IncludeCheckBoxAGS.Text = 'Include';
            app.IncludeCheckBoxAGS.Layout.Row = 1;
            app.IncludeCheckBoxAGS.Layout.Column = 1;
            app.IncludeCheckBoxAGS.Value = true;

            % Create LabelRGS
            app.LabelRGS = uilabel(app.GridLayoutAGS);
            app.LabelRGS.FontWeight = 'bold';
            app.LabelRGS.FontAngle = 'italic';
            app.LabelRGS.Layout.Row = 1;
            app.LabelRGS.Layout.Column = 1;
            app.LabelRGS.Text = 'Average Grain Size (D50)';

            % Create GridLayoutUC
            app.GridLayoutUC = uigridlayout(app.GridLayout);
            app.GridLayoutUC.ColumnWidth = {'1x'};
            app.GridLayoutUC.ColumnSpacing = 1;
            app.GridLayoutUC.RowSpacing = 1;
            app.GridLayoutUC.Padding = [1 1 1 1];
            app.GridLayoutUC.Layout.Row = 7;
            app.GridLayoutUC.Layout.Column = 1;

            % Create GridLayoutUC2
            app.GridLayoutUC2 = uigridlayout(app.GridLayoutUC);
            app.GridLayoutUC2.RowHeight = {'1x'};
            app.GridLayoutUC2.ColumnSpacing = 1;
            app.GridLayoutUC2.RowSpacing = 1;
            app.GridLayoutUC2.Padding = [0 0 0 0];
            app.GridLayoutUC2.Layout.Row = 2;
            app.GridLayoutUC2.Layout.Column = 1;

            % Create ValueEditFieldUC
            app.ValueEditFieldUC = uieditfield(app.GridLayoutUC2, 'numeric');
            app.ValueEditFieldUC.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldUCValueChanged, true);
            app.ValueEditFieldUC.Layout.Row = 1;
            app.ValueEditFieldUC.Layout.Column = 2;

            % Create IncludeCheckBoxUC
            app.IncludeCheckBoxUC = uicheckbox(app.GridLayoutUC2);
            app.IncludeCheckBoxUC.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxUCValueChanged, true);
            app.IncludeCheckBoxUC.Text = 'Include';
            app.IncludeCheckBoxUC.Layout.Row = 1;
            app.IncludeCheckBoxUC.Layout.Column = 1;
            app.IncludeCheckBoxUC.Value = true;

            % Create LabelUC
            app.LabelUC = uilabel(app.GridLayoutUC);
            app.LabelUC.FontWeight = 'bold';
            app.LabelUC.FontAngle = 'italic';
            app.LabelUC.Layout.Row = 1;
            app.LabelUC.Layout.Column = 1;
            app.LabelUC.Text = 'Uniformity Coefficient (Cu)';

            % Create GridLayoutIESM
            app.GridLayoutIESM = uigridlayout(app.GridLayout);
            app.GridLayoutIESM.ColumnWidth = {'1x'};
            app.GridLayoutIESM.ColumnSpacing = 1;
            app.GridLayoutIESM.RowSpacing = 1;
            app.GridLayoutIESM.Padding = [1 1 1 1];
            app.GridLayoutIESM.Layout.Row = 8;
            app.GridLayoutIESM.Layout.Column = 1;

            % Create GridLayoutIESM2
            app.GridLayoutIESM2 = uigridlayout(app.GridLayoutIESM);
            app.GridLayoutIESM2.RowHeight = {'1x'};
            app.GridLayoutIESM2.ColumnSpacing = 1;
            app.GridLayoutIESM2.RowSpacing = 1;
            app.GridLayoutIESM2.Padding = [0 0 0 0];
            app.GridLayoutIESM2.Layout.Row = 2;
            app.GridLayoutIESM2.Layout.Column = 1;

            % Create ValueEditFieldIESM
            app.ValueEditFieldIESM = uieditfield(app.GridLayoutIESM2, 'numeric');
            app.ValueEditFieldIESM.ValueChangedFcn = createCallbackFcn(app, @ValueEditFieldIESMValueChanged, true);
            app.ValueEditFieldIESM.Layout.Row = 1;
            app.ValueEditFieldIESM.Layout.Column = 2;

            % Create IncludeCheckBoxIESM
            app.IncludeCheckBoxIESM = uicheckbox(app.GridLayoutIESM2);
            app.IncludeCheckBoxIESM.ValueChangedFcn = createCallbackFcn(app, @IncludeCheckBoxIESMValueChanged, true);
            app.IncludeCheckBoxIESM.Text = 'Include';
            app.IncludeCheckBoxIESM.Layout.Row = 1;
            app.IncludeCheckBoxIESM.Layout.Column = 1;
            app.IncludeCheckBoxIESM.Value = true;

            % Create LabelIESM
            app.LabelIESM = uilabel(app.GridLayoutIESM);
            app.LabelIESM.FontWeight = 'bold';
            app.LabelIESM.FontAngle = 'italic';
            app.LabelIESM.Layout.Row = 1;
            app.LabelIESM.Layout.Column = 1;
            app.LabelIESM.Text = 'Innitial Shear Stiffness (G0)';

            % Create RunButton
            app.RunButton = uibutton(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.BackgroundColor = [0 1 0];
            app.RunButton.FontSize = 14;
            app.RunButton.FontWeight = 'bold';
            app.RunButton.Position = [565 9 120 50];
            app.RunButton.Text = 'Run';

            % Create ResetButton
            app.ResetButton = uibutton(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.BackgroundColor = [1 0 0];
            app.ResetButton.FontSize = 14;
            app.ResetButton.FontWeight = 'bold';
            app.ResetButton.Position = [831 9 120 50];
            app.ResetButton.Text = 'Reset';

            % Create Example
            app.Example = uibutton(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure, 'push');
            app.Example.ButtonPushedFcn = createCallbackFcn(app, @ExampleButtonPushed, true);
            app.Example.FontWeight = 'bold';
            app.Example.Position = [11 9 143 50];
            app.Example.Text = 'Use Example Variables';

            % Create DropDown
            app.DropDown = uidropdown(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.DropDown.Items = {'Example 1', 'Example 2', 'Example 3', 'Example 4'};
            app.DropDown.FontWeight = 'bold';
            app.DropDown.Position = [161 9 100 50];
            app.DropDown.Value = 'Example 1';

            % Create OutputCurveResolutionEditFieldLabel
            app.OutputCurveResolutionEditFieldLabel = uilabel(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.OutputCurveResolutionEditFieldLabel.HorizontalAlignment = 'center';
            app.OutputCurveResolutionEditFieldLabel.FontWeight = 'bold';
            app.OutputCurveResolutionEditFieldLabel.Position = [281 37 147 22];
            app.OutputCurveResolutionEditFieldLabel.Text = 'Output Curve Resolution';

            % Create OutputCurveResolutionEditField
            app.OutputCurveResolutionEditField = uieditfield(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure, 'numeric');
            app.OutputCurveResolutionEditField.Limits = [2 1000];
            app.OutputCurveResolutionEditField.Position = [281 7 142 22];
            app.OutputCurveResolutionEditField.Value = 200;

            % Create UITable
            app.UITable = uitable(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.UITable.ColumnName = {'Strain'; 'G/G0'};
            app.UITable.RowName = {};
            app.UITable.Visible = 'off';
            app.UITable.Position = [271 69 470 480];

            % Create CopydatatoClipboardButton
            app.CopydatatoClipboardButton = uibutton(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure, 'push');
            app.CopydatatoClipboardButton.ButtonPushedFcn = createCallbackFcn(app, @CopydatatoClipboardButtonPushed, true);
            app.CopydatatoClipboardButton.FontWeight = 'bold';
            app.CopydatatoClipboardButton.Enable = 'off';
            app.CopydatatoClipboardButton.Visible = 'off';
            app.CopydatatoClipboardButton.Position = [751 489 200 50];
            app.CopydatatoClipboardButton.Text = 'Copy data to Clipboard';

            % Create NeuralNetworkSettingsPanel
            app.NeuralNetworkSettingsPanel = uipanel(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.NeuralNetworkSettingsPanel.Title = 'Neural Network Settings';
            app.NeuralNetworkSettingsPanel.Visible = 'off';
            app.NeuralNetworkSettingsPanel.FontWeight = 'bold';
            app.NeuralNetworkSettingsPanel.Position = [271 69 692 480];

            % Create TrainingAlgorithmButtonGroup
            app.TrainingAlgorithmButtonGroup = uibuttongroup(app.NeuralNetworkSettingsPanel);
            app.TrainingAlgorithmButtonGroup.Title = 'Training Algorithm';
            app.TrainingAlgorithmButtonGroup.FontWeight = 'bold';
            app.TrainingAlgorithmButtonGroup.Position = [8 327 209 127];

            % Create LevenbergMarquardtButton
            app.LevenbergMarquardtButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.LevenbergMarquardtButton.Text = 'Levenberg-Marquardt';
            app.LevenbergMarquardtButton.FontWeight = 'bold';
            app.LevenbergMarquardtButton.Position = [11 81 145 22];

            % Create BayesianRegularizationButton
            app.BayesianRegularizationButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.BayesianRegularizationButton.Text = 'Bayesian Regularization';
            app.BayesianRegularizationButton.FontWeight = 'bold';
            app.BayesianRegularizationButton.Position = [11 59 161 22];
            app.BayesianRegularizationButton.Value = true;

            % Create BFGSQuasiNewtonButton
            app.BFGSQuasiNewtonButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.BFGSQuasiNewtonButton.Text = 'BFGS Quasi-Newton';
            app.BFGSQuasiNewtonButton.FontWeight = 'bold';
            app.BFGSQuasiNewtonButton.Position = [11 37 139 22];

            % Create ResilientBackpropagationButton
            app.ResilientBackpropagationButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.ResilientBackpropagationButton.Text = 'Resilient Backpropagation';
            app.ResilientBackpropagationButton.FontWeight = 'bold';
            app.ResilientBackpropagationButton.Position = [11 16 173 22];

            % Create HiddenNodesPanel
            app.HiddenNodesPanel = uipanel(app.NeuralNetworkSettingsPanel);
            app.HiddenNodesPanel.Title = 'Hidden Nodes';
            app.HiddenNodesPanel.FontWeight = 'bold';
            app.HiddenNodesPanel.Position = [9 228 208 91];

            % Create Layer1NodesLabel
            app.Layer1NodesLabel = uilabel(app.HiddenNodesPanel);
            app.Layer1NodesLabel.HorizontalAlignment = 'center';
            app.Layer1NodesLabel.FontWeight = 'bold';
            app.Layer1NodesLabel.Position = [3 40 131 22];
            app.Layer1NodesLabel.Text = 'Layer 1 Nodes';

            % Create Nodes1
            app.Nodes1 = uispinner(app.HiddenNodesPanel);
            app.Nodes1.Limits = [1 15];
            app.Nodes1.RoundFractionalValues = 'on';
            app.Nodes1.FontWeight = 'bold';
            app.Nodes1.Position = [136 40 57 22];
            app.Nodes1.Value = 8;

            % Create Layer2NodesLabel
            app.Layer2NodesLabel = uilabel(app.HiddenNodesPanel);
            app.Layer2NodesLabel.HorizontalAlignment = 'center';
            app.Layer2NodesLabel.FontWeight = 'bold';
            app.Layer2NodesLabel.Position = [3 8 131 22];
            app.Layer2NodesLabel.Text = 'Layer 2 Nodes';

            % Create Nodes2
            app.Nodes2 = uispinner(app.HiddenNodesPanel);
            app.Nodes2.Limits = [0 15];
            app.Nodes2.RoundFractionalValues = 'on';
            app.Nodes2.Position = [136 8 57 22];
            app.Nodes2.Value = 3;

            % Create InputDataDivisionPanel
            app.InputDataDivisionPanel = uipanel(app.NeuralNetworkSettingsPanel);
            app.InputDataDivisionPanel.Title = 'Input Data Division';
            app.InputDataDivisionPanel.FontWeight = 'bold';
            app.InputDataDivisionPanel.Position = [230 228 450 226];

            % Create TrainingSliderLabel
            app.TrainingSliderLabel = uilabel(app.InputDataDivisionPanel);
            app.TrainingSliderLabel.HorizontalAlignment = 'right';
            app.TrainingSliderLabel.FontWeight = 'bold';
            app.TrainingSliderLabel.Position = [17 168 52 22];
            app.TrainingSliderLabel.Text = 'Training';

            % Create TrainingSlider
            app.TrainingSlider = uislider(app.InputDataDivisionPanel);
            app.TrainingSlider.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.TrainingSlider.ValueChangedFcn = createCallbackFcn(app, @TrainingSliderValueChanged, true);
            app.TrainingSlider.FontWeight = 'bold';
            app.TrainingSlider.Position = [80 178 331 3];
            app.TrainingSlider.Value = 70;

            % Create ValidationSliderLabel
            app.ValidationSliderLabel = uilabel(app.InputDataDivisionPanel);
            app.ValidationSliderLabel.HorizontalAlignment = 'right';
            app.ValidationSliderLabel.FontWeight = 'bold';
            app.ValidationSliderLabel.Position = [7 101 62 22];
            app.ValidationSliderLabel.Text = 'Validation';

            % Create ValidationSlider
            app.ValidationSlider = uislider(app.InputDataDivisionPanel);
            app.ValidationSlider.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.ValidationSlider.ValueChangedFcn = createCallbackFcn(app, @ValidationSliderValueChanged, true);
            app.ValidationSlider.FontWeight = 'bold';
            app.ValidationSlider.Position = [80 111 331 3];
            app.ValidationSlider.Value = 15;

            % Create TestingSliderLabel
            app.TestingSliderLabel = uilabel(app.InputDataDivisionPanel);
            app.TestingSliderLabel.HorizontalAlignment = 'right';
            app.TestingSliderLabel.FontWeight = 'bold';
            app.TestingSliderLabel.Position = [23 34 47 22];
            app.TestingSliderLabel.Text = 'Testing';

            % Create TestingSlider
            app.TestingSlider = uislider(app.InputDataDivisionPanel);
            app.TestingSlider.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.TestingSlider.ValueChangedFcn = createCallbackFcn(app, @TestingSliderValueChanged, true);
            app.TestingSlider.FontWeight = 'bold';
            app.TestingSlider.Position = [79 43 332 3];
            app.TestingSlider.Value = 15;

            % Create ShowAdvancedOptionsCheckBox
            app.ShowAdvancedOptionsCheckBox = uicheckbox(app.NeuralNetworkSettingsPanel);
            app.ShowAdvancedOptionsCheckBox.ValueChangedFcn = createCallbackFcn(app, @ShowAdvancedOptionsCheckBoxValueChanged, true);
            app.ShowAdvancedOptionsCheckBox.Text = 'Show Advanced Options?';
            app.ShowAdvancedOptionsCheckBox.FontWeight = 'bold';
            app.ShowAdvancedOptionsCheckBox.Position = [11 198 171 22];

            % Create NeuralNetworkRNGButtonGroup
            app.NeuralNetworkRNGButtonGroup = uibuttongroup(app.NeuralNetworkSettingsPanel);
            app.NeuralNetworkRNGButtonGroup.Title = 'Neural Network RNG';
            app.NeuralNetworkRNGButtonGroup.Visible = 'off';
            app.NeuralNetworkRNGButtonGroup.FontWeight = 'bold';
            app.NeuralNetworkRNGButtonGroup.Position = [10 120 211 70];

            % Create UseFixedSeedButton
            app.UseFixedSeedButton = uiradiobutton(app.NeuralNetworkRNGButtonGroup);
            app.UseFixedSeedButton.Text = 'Use Fixed Seed';
            app.UseFixedSeedButton.Position = [11 24 107 22];
            app.UseFixedSeedButton.Value = true;

            % Create UseVaryingSeedButton
            app.UseVaryingSeedButton = uiradiobutton(app.NeuralNetworkRNGButtonGroup);
            app.UseVaryingSeedButton.Text = 'Use Varying Seed';
            app.UseVaryingSeedButton.Position = [11 2 118 22];

            % Create DisplayDropDown
            app.DisplayDropDown = uidropdown(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.DisplayDropDown.Items = {'Show Curve', 'Show Values', 'Show NN Stats'};
            app.DisplayDropDown.ValueChangedFcn = createCallbackFcn(app, @DisplayDropDownValueChanged, true);
            app.DisplayDropDown.Enable = 'off';
            app.DisplayDropDown.FontWeight = 'bold';
            app.DisplayDropDown.Position = [698 9 120 50];
            app.DisplayDropDown.Value = 'Show Curve';

            % Create NeuralNetworkSettingsButton
            app.NeuralNetworkSettingsButton = uibutton(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure, 'state');
            app.NeuralNetworkSettingsButton.ValueChangedFcn = createCallbackFcn(app, @NeuralNetworkSettingsButtonValueChanged, true);
            app.NeuralNetworkSettingsButton.Text = {'Neural Network'; 'Settings'};
            app.NeuralNetworkSettingsButton.FontWeight = 'bold';
            app.NeuralNetworkSettingsButton.Position = [431 9 120 50];

            % Create NeuralNetworkStatisticsPanel
            app.NeuralNetworkStatisticsPanel = uipanel(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure);
            app.NeuralNetworkStatisticsPanel.Title = 'Neural Network Statistics';
            app.NeuralNetworkStatisticsPanel.Visible = 'off';
            app.NeuralNetworkStatisticsPanel.FontWeight = 'bold';
            app.NeuralNetworkStatisticsPanel.Position = [271 69 690 480];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.NeuralNetworkStatisticsPanel);
            xlabel(app.UIAxes2, 'Target G/G0 Value')
            ylabel(app.UIAxes2, 'NN Output G/G0Value')
            app.UIAxes2.PlotBoxAspectRatio = [1.08393285371703 1 1];
            app.UIAxes2.FontWeight = 'bold';
            app.UIAxes2.XLim = [0 1.1];
            app.UIAxes2.YLim = [0 1.1];
            app.UIAxes2.ZLim = [0 1.1];
            app.UIAxes2.XTick = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
            app.UIAxes2.XTickLabel = {'0'; '0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1'; '1.1'};
            app.UIAxes2.YTick = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
            app.UIAxes2.YTickLabel = {'0'; '0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1'; '1.1'};
            app.UIAxes2.Position = [1 0 500 460];

            % Create PerformanceMSEEditFieldLabel
            app.PerformanceMSEEditFieldLabel = uilabel(app.NeuralNetworkStatisticsPanel);
            app.PerformanceMSEEditFieldLabel.HorizontalAlignment = 'center';
            app.PerformanceMSEEditFieldLabel.FontSize = 12.5;
            app.PerformanceMSEEditFieldLabel.FontWeight = 'bold';
            app.PerformanceMSEEditFieldLabel.Enable = 'off';
            app.PerformanceMSEEditFieldLabel.Position = [535 428 130 22];
            app.PerformanceMSEEditFieldLabel.Text = 'Performance (MSE)';

            % Create Performance
            app.Performance = uieditfield(app.NeuralNetworkStatisticsPanel, 'numeric');
            app.Performance.Editable = 'off';
            app.Performance.Enable = 'off';
            app.Performance.Position = [520 400 160 20];

            % Show the figure after all components are created
            app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = StiffnessNNApp

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ShearStiffnessDegradationCurveNeuralNetworkAppUIFigure)
        end
    end
end