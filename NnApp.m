classdef NnApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ShearStiffnessDegradationUIFigure  matlab.ui.Figure
        OutputCurvePanel                matlab.ui.container.Panel
        UIAxes                          matlab.ui.control.UIAxes
        DatasetSettingsPanel            matlab.ui.container.Panel
        FilterDataToggle                matlab.ui.control.StateButton
        LoadedLabel                     matlab.ui.control.Label
        datasetStatsPanel               matlab.ui.container.Panel
        GridLayout5                     matlab.ui.container.GridLayout
        final_datapoints                matlab.ui.control.NumericEditField
        filteres_datapoints             matlab.ui.control.NumericEditField
        init_datapoints                 matlab.ui.control.NumericEditField
        FinalnodatapointsLabel          matlab.ui.control.Label
        FiltereddatapointsLabel         matlab.ui.control.Label
        LoadeddatapointsLabel           matlab.ui.control.Label
        PleasespecifycellarraynamesPanel  matlab.ui.container.Panel
        GridLayout4                     matlab.ui.container.GridLayout
        rawdataLamp                     matlab.ui.control.Lamp
        RawdatainexpectedformatLampLabel  matlab.ui.control.Label
        curvesNameField                 matlab.ui.control.EditField
        propertiesNameField             matlab.ui.control.EditField
        NameofcurvedatacellarrayLabel   matlab.ui.control.Label
        NameofpropertiescellarrayLabel  matlab.ui.control.Label
        notLoadedLabel                  matlab.ui.control.Label
        FilterPanel                     matlab.ui.container.Panel
        GridLayout3                     matlab.ui.container.GridLayout
        G0Panel                         matlab.ui.container.Panel
        GridLayoutG0                    matlab.ui.container.GridLayout
        G0_max                          matlab.ui.control.NumericEditField
        G0_min                          matlab.ui.control.NumericEditField
        CuPanel                         matlab.ui.container.Panel
        GridLayoutCu                    matlab.ui.container.GridLayout
        Cu_max                          matlab.ui.control.NumericEditField
        Cu_min                          matlab.ui.control.NumericEditField
        D50Panel                        matlab.ui.container.Panel
        GridLayoutD50                   matlab.ui.container.GridLayout
        D50_max                         matlab.ui.control.NumericEditField
        D50_min                         matlab.ui.control.NumericEditField
        DrPanel                         matlab.ui.container.Panel
        GridLayoutDr                    matlab.ui.container.GridLayout
        Dr_max                          matlab.ui.control.NumericEditField
        Dr_min                          matlab.ui.control.NumericEditField
        ePanel                          matlab.ui.container.Panel
        GridLayoute                     matlab.ui.container.GridLayout
        e_max                           matlab.ui.control.NumericEditField
        e_min                           matlab.ui.control.NumericEditField
        OCRPanel                        matlab.ui.container.Panel
        GridLayout_OCR                  matlab.ui.container.GridLayout
        OCR_max                         matlab.ui.control.NumericEditField
        OCR_min                         matlab.ui.control.NumericEditField
        PPaPanel                        matlab.ui.container.Panel
        GridLayoutPPa                   matlab.ui.container.GridLayout
        PPa_max                         matlab.ui.control.NumericEditField
        PPa_min                         matlab.ui.control.NumericEditField
        PPanel                          matlab.ui.container.Panel
        GridLayoutP                     matlab.ui.container.GridLayout
        P_max                           matlab.ui.control.NumericEditField
        P_min                           matlab.ui.control.NumericEditField
        PreprocessDataButton            matlab.ui.control.Button
        LoadDataButton                  matlab.ui.control.Button
        Example                         matlab.ui.control.Button
        InputSoilParametersPanel        matlab.ui.container.Panel
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
        OutputDataPanel                 matlab.ui.container.Panel
        CopydatatoClipboardButton       matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        NeuralNetworkStatisticsPanel    matlab.ui.container.Panel
        Performance                     matlab.ui.control.NumericEditField
        PerformanceMSEEditFieldLabel    matlab.ui.control.Label
        UIAxes2                         matlab.ui.control.UIAxes
        Panel                           matlab.ui.container.Panel
        DatasetSettingsButton           matlab.ui.control.StateButton
        NeuralNetworkSettingsButton     matlab.ui.control.StateButton
        RunButton                       matlab.ui.control.Button
        DisplayDropDown                 matlab.ui.control.DropDown
        ResetButton                     matlab.ui.control.Button
        ResetAllButton                  matlab.ui.control.Button
        NeuralNetworkSettingsPanel      matlab.ui.container.Panel
        OutputCurveResolutionPanel      matlab.ui.container.Panel
        EditField                       matlab.ui.control.NumericEditField
        EditFieldLabel                  matlab.ui.control.Label
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
    end


    properties (Access = private)
        data;
        %data=load('StiffnessNNAppData.mat','data'); % Load training data
        dataLoaded=false;
        rawLoadedData;
        preprocessedData;
        rawDataCellNamesBool=[false false false];
        inclusion=true(1,8); % array containing boolean values altered by checkboxes
        paramVals=[0 0 0 0 0 0 0 0]; % array containing input parameters
        paramLimits=[0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
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
            app.strain= logspace(-4,1,app.EditField.Value);
            app.GGo=[];
            for s=app.strain
                app.GGo=[app.GGo net([properties(propSelect) s]')];
            end

            app.plotHolder=plot(app.UIAxes,app.data.input(:,9),app.data.output,app.strain,app.GGo);
            app.plotHolder(1).LineStyle='none';
            app.plotHolder(1).Marker='o';
            app.plotHolder(1).MarkerSize=3;
            app.plotHolder(2).LineStyle='-';
            app.plotHolder(2).LineWidth=4;
            b=table(app.strain', app.GGo');
            app.UITable.Data=b;
        end

        function regressionPlot(app,NNoutputs)
            p = polyfit(app.data.output,NNoutputs,1);
            f = polyval(p,[0 1.1]);

            app.regHolder=plot(app.UIAxes2,app.data.output,NNoutputs,[0 1.1],[0 1.1],[0 1.1],f);
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
            app.Nodes1.Enable=bool;
            app.Nodes2.Enable=bool;
            app.EditField.Enable=bool;
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
                app.OutputCurvePanel.Visible='on';
                app.UIAxes.Visible='on';
                if size(app.UIAxes.Children)~=0
                    app.UIAxes.Children(1, 1).Visible='on';
                    app.UIAxes.Children(2, 1).Visible='on';
                end
            else
                app.OutputCurvePanel.Visible='off';
                app.UIAxes.Visible='off';
                if size(app.UIAxes.Children)~=0
                    app.UIAxes.Children(1, 1).Visible='off';
                    app.UIAxes.Children(2, 1).Visible='off';
                end
            end
        end

        function ValuesDisplay(app,S)
            if S
                app.OutputDataPanel.Visible = 'on';
                %app.UITable.Visible = 'on';
                %app.CopydatatoClipboardButton.Visible='on';
                app.CopydatatoClipboardButton.Enable=true;
            else
                app.OutputDataPanel.Visible = 'off';
                %app.UITable.Visible = 'off';
                %app.CopydatatoClipboardButton.Visible='off';
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

        function DatasetDisplay(app,S)
            if S
                app.DatasetSettingsPanel.Visible='on';
                app.DatasetSettingsButton.Value=true;
            else
                app.DatasetSettingsPanel.Visible='off';
                app.DatasetSettingsButton.Value=false;
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
                DatasetDisplay(app,false);
                CurveDisplay(app, true);

            elseif strcmp(app.DisplayDropDown.Value,'Show Values')
                CurveDisplay(app, false);
                NNstatsDisplay(app,false);
                SettingsDisplay(app,false);
                DatasetDisplay(app,false);
                ValuesDisplay(app, true);

            elseif strcmp(app.DisplayDropDown.Value,'Show NN Stats')
                CurveDisplay(app, false);
                ValuesDisplay(app, false);
                SettingsDisplay(app,false);
                DatasetDisplay(app,false);
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
            elseif app.ResilientBackpropagationButton.Value==1
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

        function  updateIsLoadedMessage(app, value)

            if value == true
                app.LoadedLabel.Visible=true;
                app.notLoadedLabel.Visible=false;

            elseif value == false
                app.LoadedLabel.Visible=false;
                app.notLoadedLabel.Visible=true;

            end

        end

        function checkCellArrayLabels(app)

            vProperties=app.propertiesNameField.Value;
            vCurves=app.curvesNameField.Value;

            if ~strcmp(vProperties,vCurves)
                f=fieldnames(app.rawLoadedData);
                if any(strcmp(f,vProperties))
                    app.propertiesNameField.BackgroundColor=[0.76, 1, 0.76];
                    app.rawDataCellNamesBool(1)=true;
                else
                    app.propertiesNameField.BackgroundColor=[1.00,0.76,0.76];
                    app.rawDataCellNamesBool(1)=false;
                end
                if any(strcmp(f,vCurves))
                    app.curvesNameField.BackgroundColor=[0.76, 1, 0.76];
                    app.rawDataCellNamesBool(2)=true;
                else
                    app.curvesNameField.BackgroundColor=[1.00,0.76,0.76];
                    app.rawDataCellNamesBool(2)=false;
                end
            else
                app.curvesNameField.BackgroundColor=[1.00,0.76,0.76];
                app.propertiesNameField.BackgroundColor=[1.00,0.76,0.76];
                app.rawDataCellNamesBool(1)=false;
                app.rawDataCellNamesBool(2)=false;
            end

        end

        function togglePreProcessButton(app, value)
            if value == true
                app.PreprocessDataButton.Enable=true;
            else
                app.PreprocessDataButton.Enable=false;
            end

        end

        function validateRawData(app)


            if all([app.dataLoaded app.rawDataCellNamesBool(1:2)])
                vProperties=app.propertiesNameField.Value;
                vCurves=app.curvesNameField.Value;
                properties=app.rawLoadedData.(vProperties);
                curves=app.rawLoadedData.(vCurves);
                if all([iscell(curves) iscell(properties) size(curves)==size(properties)])
                    ps = cell2mat(cellfun(@size,properties,'uni',false));
                    cs = cell2mat(cellfun(@size,curves,'uni',false));
                    if all(all(ps==cs))
                        curveSizes=[]; propSizes=[];
                        for l = 1:size(properties,1)
                            curveSizes=[curveSizes; cell2mat(cellfun(@size,curves{l},'uni',false))];
                            propSizes=[propSizes; cell2mat(cellfun(@size,properties{l},'uni',false))];
                        end
                        if all(all(propSizes==[8 1])) && all(curveSizes(:,2)==2)
                            app.rawdataLamp.Color=[0 1 0]; app.rawDataCellNamesBool(3)=true;
                        else
                            app.rawdataLamp.Color=[1 0 0]; app.rawDataCellNamesBool(3)=false;
                        end
                    else
                        app.rawdataLamp.Color=[1 0 0]; app.rawDataCellNamesBool(3)=false;
                    end


                else
                    app.rawdataLamp.Color=[1 0 0]; app.rawDataCellNamesBool(3)=false;
                end
            else
                app.rawdataLamp.Color=[1 0 0]; app.rawDataCellNamesBool(3)=false;
            end

            togglePreProcessButton(app,all([app.dataLoaded app.rawDataCellNamesBool]));

        end

        function updateVariableLimits(app)
            app.paramLimits=[app.P_min.Value app.PPa_min.Value app.OCR_min.Value app.e_min.Value app.Dr_min.Value app.D50_min.Value app.Cu_min.Value app.G0_min.Value;...
                app.P_max.Value app.PPa_max.Value app.OCR_max.Value app.e_max.Value app.Dr_max.Value app.D50_max.Value app.Cu_max.Value app.G0_max.Value];
        end

        function lockAllLimitsAndChecks(app)

            app.P_max.Enable = false;
            app.P_min.Enable = false;

            app.PPa_max.Enable = false;
            app.PPa_min.Enable = false;

            app.OCR_max.Enable = false;
            app.OCR_min.Enable = false;

            app.e_max.Enable = false;
            app.e_min.Enable = false;

            app.Dr_max.Enable = false;
            app.Dr_min.Enable = false;

            app.D50_max.Enable = false;
            app.D50_min.Enable = false;

            app.Cu_max.Enable = false;
            app.Cu_min.Enable = false;

            app.G0_max.Enable = false;
            app.G0_min.Enable = false;

            app.IncludeCheckBoxMES.Enable=false;
            app.IncludeCheckBoxMESRAP.Enable=false;
            app.IncludeCheckBoxOCR.Enable=false;
            app.IncludeCheckBoxVR.Enable=false;
            app.IncludeCheckBoxRD.Enable=false;
            app.IncludeCheckBoxAGS.Enable=false;
            app.IncludeCheckBoxUC.Enable=false;
            app.IncludeCheckBoxIESM.Enable=false;
        end

        function resetDatasetSettings(app)

            app.P_max.Enable = true;
            app.P_min.Enable = true;
            app.PPaPanel.Enable = 'on';
            app.PPa_max.Enable = true;
            app.PPa_min.Enable = true;
            app.PPaPanel.Enable = 'on';
            app.OCR_max.Enable = true;
            app.OCR_min.Enable = true;
            app.OCRPanel.Enable = 'on';
            app.e_max.Enable = true;
            app.e_min.Enable = true;
            app.ePanel.Enable = 'on';
            app.Dr_max.Enable = true;
            app.Dr_min.Enable = true;
            app.DrPanel.Enable = 'on';
            app.D50_max.Enable = true;
            app.D50_min.Enable = true;
            app.D50Panel.Enable = 'on';
            app.Cu_max.Enable = true;
            app.Cu_min.Enable = true;
            app.CuPanel.Enable = 'on';
            app.G0_max.Enable = true;
            app.G0_min.Enable = true;
            app.G0Panel.Enable = 'on';
            app.FilterDataToggle.Enable=true;

            app.init_datapoints.Value=0;
            app.filteres_datapoints.Value=0;
            app.final_datapoints.Value=0;


            app.propertiesNameField.Enable=true;
            app.curvesNameField.Enable=true;
        end
        
        function setAllLimits(app,inclusion,bool)
            offOn={'off';'on'};
            
            app.P_max.Enable = all([inclusion(1) bool]);
            app.P_min.Enable = all([inclusion(1) bool]);
            app.PPaPanel.Enable = offOn{inclusion(1)+1};
            app.PPa_max.Enable = all([inclusion(2) bool]);
            app.PPa_min.Enable = all([inclusion(2) bool]);
            app.PPaPanel.Enable = offOn{inclusion(2)+1};
            app.OCR_max.Enable = all([inclusion(3) bool]);
            app.OCR_min.Enable = all([inclusion(3) bool]);
            app.OCRPanel.Enable = offOn{inclusion(3)+1};
            app.e_max.Enable = all([inclusion(4) bool]);
            app.e_min.Enable = all([inclusion(4) bool]);
            app.ePanel.Enable = offOn{inclusion(4)+1};
            app.Dr_max.Enable = all([inclusion(5) bool]);
            app.Dr_min.Enable = all([inclusion(5) bool]);
            app.DrPanel.Enable = offOn{inclusion(5)+1};
            app.D50_max.Enable = all([inclusion(6) bool]);
            app.D50_min.Enable = all([inclusion(6) bool]);
            app.D50Panel.Enable = offOn{inclusion(6)+1};
            app.Cu_max.Enable = all([inclusion(7) bool]);
            app.Cu_min.Enable = all([inclusion(7) bool]);
            app.CuPanel.Enable = offOn{inclusion(7)+1};
            app.G0_max.Enable = all([inclusion(8) bool]);
            app.G0_min.Enable = all([inclusion(8) bool]);
            app.G0Panel.Enable = offOn{inclusion(8)+1};
            
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
                app.P_max.Enable = false;
                app.PPanel.Enable= 'off';
                app.P_min.Enable = false;
                app.inclusion(1,1)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldMES.Enable = true;
                app.PPanel.Enable = 'on';
                app.P_max.Enable = true;
                app.P_min.Enable = true;
                app.inclusion(1,1)=true;
            end
        end

        % Value changed function: IncludeCheckBoxMESRAP
        function IncludeCheckBoxMESRAPValueChanged(app, event)
            value = app.IncludeCheckBoxMESRAP.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldMESRAP.Enable = false;
                app.PPaPanel.Enable= 'off';
                app.PPa_max.Enable = false;
                app.PPa_min.Enable = false;
                app.inclusion(1,2)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldMESRAP.Enable = true;
                app.PPaPanel.Enable = 'on';
                app.PPa_max.Enable = true;
                app.PPa_min.Enable = true;
                app.inclusion(1,2)=true;
            end
        end

        % Value changed function: IncludeCheckBoxOCR
        function IncludeCheckBoxOCRValueChanged(app, event)
            value = app.IncludeCheckBoxOCR.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldOCR.Enable = false;
                app.OCRPanel.Enable= 'off';
                app.OCR_max.Enable = false;
                app.OCR_min.Enable = false;
                app.inclusion(1,3)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldOCR.Enable = true;
                app.OCRPanel.Enable = 'on';
                app.OCR_max.Enable = true;
                app.OCR_min.Enable = true;
                app.inclusion(1,3)=true;
            end
        end

        % Value changed function: IncludeCheckBoxVR
        function IncludeCheckBoxVRValueChanged(app, event)
            value = app.IncludeCheckBoxVR.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldVR.Enable = false;
                app.ePanel.Enable='off';
                app.e_max.Enable = false;
                app.e_min.Enable = false;
                app.inclusion(1,4)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldVR.Enable = true;
                app.ePanel.Enable= 'on';
                app.e_max.Enable = true;
                app.e_min.Enable = true;
                app.inclusion(1,4)=true;
            end
        end

        % Value changed function: IncludeCheckBoxRD
        function IncludeCheckBoxRDValueChanged(app, event)
            value = app.IncludeCheckBoxRD.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldRD.Enable = false;
                app.DrPanel.Enable='off';
                app.Dr_max.Enable = false;
                app.Dr_min.Enable = false;
                app.inclusion(1,5)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldRD.Enable = true;
                app.DrPanel.Enable= 'on';
                app.Dr_max.Enable = true;
                app.Dr_min.Enable = true;
                app.inclusion(1,5)=true;
            end
        end

        % Value changed function: IncludeCheckBoxAGS
        function IncludeCheckBoxAGSValueChanged(app, event)
            value = app.IncludeCheckBoxAGS.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldAGS.Enable = false;
                app.D50Panel.Enable = 'off';
                app.D50_max.Enable = false;
                app.D50_min.Enable = false;
                app.inclusion(1,6)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldAGS.Enable = true;
                app.D50Panel.Enable = 'on';
                app.D50_max.Enable = true;
                app.D50_min.Enable = true;
                app.inclusion(1,6)=true;
            end
        end

        % Value changed function: IncludeCheckBoxUC
        function IncludeCheckBoxUCValueChanged(app, event)
            value = app.IncludeCheckBoxUC.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldUC.Enable = false;
                app.CuPanel.Enable='off';
                app.Cu_max.Enable = false;
                app.Cu_min.Enable = false;
                app.inclusion(1,7)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldUC.Enable = true;
                app.CuPanel.Enable= 'on';
                app.Cu_max.Enable = true;
                app.Cu_min.Enable = true;
                app.inclusion(1,7)=true;
            end
        end

        % Value changed function: IncludeCheckBoxIESM
        function IncludeCheckBoxIESMValueChanged(app, event)
            value = app.IncludeCheckBoxIESM.Value;
            if value == false
                % If checkbox is unchecked, make value eddit disable
                app.ValueEditFieldIESM.Enable = false;
                app.G0Panel.Enable= 'off';
                app.G0_max.Enable = false;
                app.G0_min.Enable = false;
                app.inclusion(1,8)=false;
            else
                % If checkbox is checked, make value eddit disable
                app.ValueEditFieldIESM.Enable = true;
                app.G0Panel.Enable= 'on';
                app.G0_max.Enable = true;
                app.G0_min.Enable = true;
                app.inclusion(1,8)=true;
            end
        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            enablePre(app,false);
            app.RunButton.Enable=false;
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
            [net,performance,output] = NNfit(app,app.data,props(logical(app.inclusion)),...
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

            setAllValues(app,[0.1 1.0194 1.0 0.76 0.6923 0.990 1.20 161.1269]);
            %setAllChecks(app,[true true true true true true true true]);


        end

        % Button pushed function: ResetAllButton
        function ResetAllButtonPushed(app, event)
            delete(app.plotHolder);
            delete(app.regHolder);
            setAllValues(app,[0 0 0 0 0 0 0 0]);
            setAllChecks(app,[true true true true true true true true]);
            app.dataLoaded=false;
            app.rawLoadedData=[];
            app.preprocessedData=[];
            app.rawDataCellNamesBool=[false false false];
            app.propertiesNameField.BackgroundColor=[1.00,0.76,0.76];
            app.curvesNameField.BackgroundColor=[1.00,0.76,0.76];
            app.paramVals=[0 0 0 0 0 0 0 0]; % array containing input parameters
            app.paramLimits=[0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
            app.Nodes1.Value=8;
            app.Nodes2.Value=3;
            app.BayesianRegularizationButton.Value=true;
            app.UseFixedSeedButton.Value=true;
            app.TrainingSlider.Value=70;
            app.ValidationSlider.Value=15;
            app.TestingSlider.Value=15;
            app.ShowAdvancedOptionsCheckBox.Value=false;
            app.NeuralNetworkRNGButtonGroup.Visible=app.ShowAdvancedOptionsCheckBox.Value;
            app.LoadDataButton.Enable=true;
            app.FilterDataToggle.Enable=true;
            validateRawData(app);
            updateIsLoadedMessage(app,false);
            resetDatasetSettings(app);

            app.EditField.Value=200;
            app.Performance.Value=0;
            enablePre(app,true);
            enablePost(app,false);
            app.RunButton.BackgroundColor = [0 1 0];
            app.RunButton.Enable=false;
            app.DisplayDropDown.Value='Show Curve';
            if ~any([app.DatasetSettingsButton.Value app.NeuralNetworkSettingsButton.Value])
                updateDisplay(app);
            end

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
            DatasetDisplay(app,false);
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

        % Value changed function: DatasetSettingsButton
        function DatasetSettingsButtonValueChanged(app, event)
            value = app.DatasetSettingsButton.Value;
            CurveDisplay(app,false);
            ValuesDisplay(app,false);
            NNstatsDisplay(app,false);
            SettingsDisplay(app,false);
            DatasetDisplay(app,value);
            if value==false
                updateDisplay(app);
            end

        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            delete(app.plotHolder);
            delete(app.regHolder);

            validateRawData(app);
            %resetDatasetSettings(app);

            app.Performance.Value=0;
            enablePre(app,true);
            enablePost(app,false);
            setAllChecks(app,app.inclusion);
            setAllLimits(app,app.inclusion,true)
            app.init_datapoints.Value=0;
            app.filteres_datapoints.Value=0;
            app.final_datapoints.Value=0;
            app.RunButton.BackgroundColor = [0 1 0];
            app.RunButton.Enable=false;
            app.FilterDataToggle.Enable=true;
            app.DisplayDropDown.Value='Show Curve';
            if ~any([app.DatasetSettingsButton.Value app.NeuralNetworkSettingsButton.Value])
                updateDisplay(app);
            end

        end

        % Button pushed function: LoadDataButton
        function LoadDataButtonPushed(app, event)
            [file,path] = uigetfile;
            app.rawLoadedData=load([path file]);
            app.dataLoaded=true;
            app.LoadDataButton.Enable=false;
            updateIsLoadedMessage(app,true);
            checkCellArrayLabels(app);
            validateRawData(app);
            %togglePreProcessButton(app,all([app.dataLoaded app.rawDataCellNamesBool]));

        end

        % Value changed function: propertiesNameField
        function propertiesNameFieldValueChanged(app, event)
            value = app.propertiesNameField.Value;
            if app.dataLoaded
                checkCellArrayLabels(app)
            end
            validateRawData(app);
            %togglePreProcessButton(app,all([app.dataLoaded app.rawDataCellNamesBool]));

        end

        % Value changed function: curvesNameField
        function curvesNameFieldValueChanged(app, event)
            value = app.curvesNameField.Value;
            if app.dataLoaded
                checkCellArrayLabels(app)
            end
            validateRawData(app);
            %togglePreProcessButton(app,all([app.dataLoaded app.rawDataCellNamesBool]));
        end

        % Button pushed function: PreprocessDataButton
        function PreprocessDataButtonPushed(app, event)
            vProperties=app.propertiesNameField.Value;
            vCurves=app.curvesNameField.Value;
            updateVariableLimits(app);
            properties=app.rawLoadedData.(vProperties);
            curves=app.rawLoadedData.(vCurves);
            processedData.input=[];processedData.output=[];
            loadedCount=0; filteredCount=0; finalCount=0;
            lockAllLimitsAndChecks(app);
            app.FilterDataToggle.Enable=false;
            for j = 1:size(properties,1)
                for k = 1:size(properties{j,1},1)

                    if ~any(isnan(properties{j,1}{k,1}(app.inclusion)))

                        if any([all([properties{j,1}{k,1}(app.inclusion)'>=app.paramLimits(1,app.inclusion) ...
                                properties{j,1}{k,1}(app.inclusion)'<=app.paramLimits(2,app.inclusion)]) ~app.FilterDataToggle.Value])

                            for l = 1:size(curves{j,1}{k,1},1)
                                processedData.input=[processedData.input; properties{j,1}{k,1}' curves{j,1}{k,1}(l,1)];
                                processedData.output=[processedData.output; curves{j,1}{k,1}(l,2)];
                                loadedCount=loadedCount+1; finalCount=finalCount+1;
                            end

                        else
                            filteredCount=filteredCount+size(curves{j,1}{k,1},1);
                            loadedCount=loadedCount+size(curves{j,1}{k,1},1);
                        end

                    else
                        filteredCount=filteredCount+size(curves{j,1}{k,1},1);
                        loadedCount=loadedCount+size(curves{j,1}{k,1},1);
                    end
                end
            end

            app.init_datapoints.Value=loadedCount;
            app.filteres_datapoints.Value=filteredCount;
            app.final_datapoints.Value=finalCount;


            app.propertiesNameField.Enable=false;
            app.curvesNameField.Enable=false;
            app.PreprocessDataButton.Enable=false;
            app.data=processedData;
            app.RunButton.Enable=true;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ShearStiffnessDegradationUIFigure and hide until all components are created
            app.ShearStiffnessDegradationUIFigure = uifigure('Visible', 'off');
            app.ShearStiffnessDegradationUIFigure.Position = [100 100 1000 550];
            app.ShearStiffnessDegradationUIFigure.Name = 'Shear Stiffness Degradation Curve Neural Network App';
            app.ShearStiffnessDegradationUIFigure.Icon = 'Icon.png';

            % Create NeuralNetworkSettingsPanel
            app.NeuralNetworkSettingsPanel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.NeuralNetworkSettingsPanel.Title = 'Neural Network Settings';
            app.NeuralNetworkSettingsPanel.Visible = 'off';
            app.NeuralNetworkSettingsPanel.FontWeight = 'bold';
            app.NeuralNetworkSettingsPanel.Position = [250 71 751 480];

            % Create TrainingAlgorithmButtonGroup
            app.TrainingAlgorithmButtonGroup = uibuttongroup(app.NeuralNetworkSettingsPanel);
            app.TrainingAlgorithmButtonGroup.Title = 'Training Algorithm';
            app.TrainingAlgorithmButtonGroup.FontWeight = 'bold';
            app.TrainingAlgorithmButtonGroup.Position = [10 330 230 120];

            % Create LevenbergMarquardtButton
            app.LevenbergMarquardtButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.LevenbergMarquardtButton.Text = 'Levenberg-Marquardt';
            app.LevenbergMarquardtButton.FontWeight = 'bold';
            app.LevenbergMarquardtButton.Position = [11 74 145 22];

            % Create BayesianRegularizationButton
            app.BayesianRegularizationButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.BayesianRegularizationButton.Text = 'Bayesian Regularization';
            app.BayesianRegularizationButton.FontWeight = 'bold';
            app.BayesianRegularizationButton.Position = [11 52 161 22];
            app.BayesianRegularizationButton.Value = true;

            % Create BFGSQuasiNewtonButton
            app.BFGSQuasiNewtonButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.BFGSQuasiNewtonButton.Text = 'BFGS Quasi-Newton';
            app.BFGSQuasiNewtonButton.FontWeight = 'bold';
            app.BFGSQuasiNewtonButton.Position = [11 30 139 22];

            % Create ResilientBackpropagationButton
            app.ResilientBackpropagationButton = uiradiobutton(app.TrainingAlgorithmButtonGroup);
            app.ResilientBackpropagationButton.Text = 'Resilient Backpropagation';
            app.ResilientBackpropagationButton.FontWeight = 'bold';
            app.ResilientBackpropagationButton.Position = [11 9 173 22];

            % Create HiddenNodesPanel
            app.HiddenNodesPanel = uipanel(app.NeuralNetworkSettingsPanel);
            app.HiddenNodesPanel.Title = 'Hidden Nodes';
            app.HiddenNodesPanel.FontWeight = 'bold';
            app.HiddenNodesPanel.Position = [10 220 230 90];

            % Create Layer1NodesLabel
            app.Layer1NodesLabel = uilabel(app.HiddenNodesPanel);
            app.Layer1NodesLabel.HorizontalAlignment = 'center';
            app.Layer1NodesLabel.FontWeight = 'bold';
            app.Layer1NodesLabel.Position = [3 39 131 22];
            app.Layer1NodesLabel.Text = 'Layer 1 Nodes';

            % Create Nodes1
            app.Nodes1 = uispinner(app.HiddenNodesPanel);
            app.Nodes1.Limits = [1 15];
            app.Nodes1.RoundFractionalValues = 'on';
            app.Nodes1.FontWeight = 'bold';
            app.Nodes1.Position = [136 39 57 22];
            app.Nodes1.Value = 8;

            % Create Layer2NodesLabel
            app.Layer2NodesLabel = uilabel(app.HiddenNodesPanel);
            app.Layer2NodesLabel.HorizontalAlignment = 'center';
            app.Layer2NodesLabel.FontWeight = 'bold';
            app.Layer2NodesLabel.Position = [3 7 131 22];
            app.Layer2NodesLabel.Text = 'Layer 2 Nodes';

            % Create Nodes2
            app.Nodes2 = uispinner(app.HiddenNodesPanel);
            app.Nodes2.Limits = [0 15];
            app.Nodes2.RoundFractionalValues = 'on';
            app.Nodes2.Position = [136 7 57 22];
            app.Nodes2.Value = 3;

            % Create InputDataDivisionPanel
            app.InputDataDivisionPanel = uipanel(app.NeuralNetworkSettingsPanel);
            app.InputDataDivisionPanel.Title = 'Input Data Division';
            app.InputDataDivisionPanel.FontWeight = 'bold';
            app.InputDataDivisionPanel.Position = [260 220 481 230];

            % Create TrainingSliderLabel
            app.TrainingSliderLabel = uilabel(app.InputDataDivisionPanel);
            app.TrainingSliderLabel.HorizontalAlignment = 'right';
            app.TrainingSliderLabel.FontWeight = 'bold';
            app.TrainingSliderLabel.Position = [17 180 52 22];
            app.TrainingSliderLabel.Text = 'Training';

            % Create TrainingSlider
            app.TrainingSlider = uislider(app.InputDataDivisionPanel);
            app.TrainingSlider.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.TrainingSlider.ValueChangedFcn = createCallbackFcn(app, @TrainingSliderValueChanged, true);
            app.TrainingSlider.FontWeight = 'bold';
            app.TrainingSlider.Position = [80 190 380 3];
            app.TrainingSlider.Value = 70;

            % Create ValidationSliderLabel
            app.ValidationSliderLabel = uilabel(app.InputDataDivisionPanel);
            app.ValidationSliderLabel.HorizontalAlignment = 'right';
            app.ValidationSliderLabel.FontWeight = 'bold';
            app.ValidationSliderLabel.Position = [7 105 62 22];
            app.ValidationSliderLabel.Text = 'Validation';

            % Create ValidationSlider
            app.ValidationSlider = uislider(app.InputDataDivisionPanel);
            app.ValidationSlider.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.ValidationSlider.ValueChangedFcn = createCallbackFcn(app, @ValidationSliderValueChanged, true);
            app.ValidationSlider.FontWeight = 'bold';
            app.ValidationSlider.Position = [80 115 380 3];
            app.ValidationSlider.Value = 15;

            % Create TestingSliderLabel
            app.TestingSliderLabel = uilabel(app.InputDataDivisionPanel);
            app.TestingSliderLabel.HorizontalAlignment = 'right';
            app.TestingSliderLabel.FontWeight = 'bold';
            app.TestingSliderLabel.Position = [23 30 47 22];
            app.TestingSliderLabel.Text = 'Testing';

            % Create TestingSlider
            app.TestingSlider = uislider(app.InputDataDivisionPanel);
            app.TestingSlider.MajorTicks = [0 10 20 30 40 50 60 70 80 90 100];
            app.TestingSlider.ValueChangedFcn = createCallbackFcn(app, @TestingSliderValueChanged, true);
            app.TestingSlider.FontWeight = 'bold';
            app.TestingSlider.Position = [80 40 380 3];
            app.TestingSlider.Value = 15;

            % Create ShowAdvancedOptionsCheckBox
            app.ShowAdvancedOptionsCheckBox = uicheckbox(app.NeuralNetworkSettingsPanel);
            app.ShowAdvancedOptionsCheckBox.ValueChangedFcn = createCallbackFcn(app, @ShowAdvancedOptionsCheckBoxValueChanged, true);
            app.ShowAdvancedOptionsCheckBox.Text = 'Show Advanced Options?';
            app.ShowAdvancedOptionsCheckBox.FontWeight = 'bold';
            app.ShowAdvancedOptionsCheckBox.Position = [260 176 186 22];

            % Create NeuralNetworkRNGButtonGroup
            app.NeuralNetworkRNGButtonGroup = uibuttongroup(app.NeuralNetworkSettingsPanel);
            app.NeuralNetworkRNGButtonGroup.Title = 'Neural Network RNG';
            app.NeuralNetworkRNGButtonGroup.Visible = 'off';
            app.NeuralNetworkRNGButtonGroup.FontWeight = 'bold';
            app.NeuralNetworkRNGButtonGroup.Position = [511 130 230 70];

            % Create UseFixedSeedButton
            app.UseFixedSeedButton = uiradiobutton(app.NeuralNetworkRNGButtonGroup);
            app.UseFixedSeedButton.Text = 'Use Fixed Seed';
            app.UseFixedSeedButton.Position = [11 24 107 22];
            app.UseFixedSeedButton.Value = true;

            % Create UseVaryingSeedButton
            app.UseVaryingSeedButton = uiradiobutton(app.NeuralNetworkRNGButtonGroup);
            app.UseVaryingSeedButton.Text = 'Use Varying Seed';
            app.UseVaryingSeedButton.Position = [11 2 118 22];

            % Create OutputCurveResolutionPanel
            app.OutputCurveResolutionPanel = uipanel(app.NeuralNetworkSettingsPanel);
            app.OutputCurveResolutionPanel.Title = 'Output Curve Resolution';
            app.OutputCurveResolutionPanel.FontWeight = 'bold';
            app.OutputCurveResolutionPanel.Position = [10 130 230 70];

            % Create EditFieldLabel
            app.EditFieldLabel = uilabel(app.OutputCurveResolutionPanel);
            app.EditFieldLabel.HorizontalAlignment = 'center';
            app.EditFieldLabel.FontWeight = 'bold';
            app.EditFieldLabel.Position = [71 21 25 22];
            app.EditFieldLabel.Text = '';

            % Create EditField
            app.EditField = uieditfield(app.OutputCurveResolutionPanel, 'numeric');
            app.EditField.Limits = [2 1000];
            app.EditField.Position = [10 15 173 28];
            app.EditField.Value = 200;

            % Create Panel
            app.Panel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.Panel.Position = [250 1 751 71];

            % Create ResetAllButton
            app.ResetAllButton = uibutton(app.Panel, 'push');
            app.ResetAllButton.ButtonPushedFcn = createCallbackFcn(app, @ResetAllButtonPushed, true);
            app.ResetAllButton.BackgroundColor = [1 0 0];
            app.ResetAllButton.FontSize = 14;
            app.ResetAllButton.FontWeight = 'bold';
            app.ResetAllButton.Tooltip = {'Reset everything'};
            app.ResetAllButton.Position = [635 10 105 50];
            app.ResetAllButton.Text = {'Reset'; 'All'};

            % Create ResetButton
            app.ResetButton = uibutton(app.Panel, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.BackgroundColor = [1 0 0];
            app.ResetButton.FontSize = 14;
            app.ResetButton.FontWeight = 'bold';
            app.ResetButton.Tooltip = {'Reset input parameters but keep all other settings and loaded data'};
            app.ResetButton.Position = [510 10 105 50];
            app.ResetButton.Text = 'Reset';

            % Create DisplayDropDown
            app.DisplayDropDown = uidropdown(app.Panel);
            app.DisplayDropDown.Items = {'Show Curve', 'Show Values', 'Show NN Stats'};
            app.DisplayDropDown.ValueChangedFcn = createCallbackFcn(app, @DisplayDropDownValueChanged, true);
            app.DisplayDropDown.Enable = 'off';
            app.DisplayDropDown.Tooltip = {'Switch between various output panels'};
            app.DisplayDropDown.FontWeight = 'bold';
            app.DisplayDropDown.Position = [385 10 105 50];
            app.DisplayDropDown.Value = 'Show Curve';

            % Create RunButton
            app.RunButton = uibutton(app.Panel, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);
            app.RunButton.BackgroundColor = [0 1 0];
            app.RunButton.FontSize = 14;
            app.RunButton.FontWeight = 'bold';
            app.RunButton.Enable = 'off';
            app.RunButton.Tooltip = {'Train the Neural Network model and plot the generated Stiffness Degradation curve'};
            app.RunButton.Position = [260 10 105 50];
            app.RunButton.Text = 'Run';

            % Create NeuralNetworkSettingsButton
            app.NeuralNetworkSettingsButton = uibutton(app.Panel, 'state');
            app.NeuralNetworkSettingsButton.ValueChangedFcn = createCallbackFcn(app, @NeuralNetworkSettingsButtonValueChanged, true);
            app.NeuralNetworkSettingsButton.Tooltip = {'Select Neural Network metaparameters'};
            app.NeuralNetworkSettingsButton.Text = {'Neural Network'; 'Settings'};
            app.NeuralNetworkSettingsButton.FontWeight = 'bold';
            app.NeuralNetworkSettingsButton.Position = [135 10 105 50];

            % Create DatasetSettingsButton
            app.DatasetSettingsButton = uibutton(app.Panel, 'state');
            app.DatasetSettingsButton.ValueChangedFcn = createCallbackFcn(app, @DatasetSettingsButtonValueChanged, true);
            app.DatasetSettingsButton.Tooltip = {'Load and filter the Neural network training dataset'};
            app.DatasetSettingsButton.Text = {'Dataset '; 'Settings'; ''};
            app.DatasetSettingsButton.FontWeight = 'bold';
            app.DatasetSettingsButton.Position = [10 10 105 50];

            % Create NeuralNetworkStatisticsPanel
            app.NeuralNetworkStatisticsPanel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.NeuralNetworkStatisticsPanel.Title = 'Neural Network Statistics';
            app.NeuralNetworkStatisticsPanel.Visible = 'off';
            app.NeuralNetworkStatisticsPanel.FontWeight = 'bold';
            app.NeuralNetworkStatisticsPanel.Position = [250 71 751 480];

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
            app.UIAxes2.XTickLabelRotation = 0;
            app.UIAxes2.XTickLabel = {'0'; '0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1'; '1.1'};
            app.UIAxes2.YTick = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
            app.UIAxes2.YTickLabelRotation = 0;
            app.UIAxes2.YTickLabel = {'0'; '0.1'; '0.2'; '0.3'; '0.4'; '0.5'; '0.6'; '0.7'; '0.8'; '0.9'; '1'; '1.1'};
            app.UIAxes2.ZTickLabelRotation = 0;
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

            % Create OutputDataPanel
            app.OutputDataPanel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.OutputDataPanel.Title = 'Output Data';
            app.OutputDataPanel.Visible = 'off';
            app.OutputDataPanel.FontWeight = 'bold';
            app.OutputDataPanel.Position = [250 71 751 480];

            % Create UITable
            app.UITable = uitable(app.OutputDataPanel);
            app.UITable.ColumnName = {'Strain'; 'G/G0'};
            app.UITable.RowName = {};
            app.UITable.Position = [2 4 463 453];

            % Create CopydatatoClipboardButton
            app.CopydatatoClipboardButton = uibutton(app.OutputDataPanel, 'push');
            app.CopydatatoClipboardButton.ButtonPushedFcn = createCallbackFcn(app, @CopydatatoClipboardButtonPushed, true);
            app.CopydatatoClipboardButton.FontWeight = 'bold';
            app.CopydatatoClipboardButton.Enable = 'off';
            app.CopydatatoClipboardButton.Position = [476 398 203 50];
            app.CopydatatoClipboardButton.Text = 'Copy data to Clipboard';

            % Create InputSoilParametersPanel
            app.InputSoilParametersPanel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.InputSoilParametersPanel.Title = 'Input Soil Parameters';
            app.InputSoilParametersPanel.FontWeight = 'bold';
            app.InputSoilParametersPanel.Position = [1 1 250 550];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.InputSoilParametersPanel);
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
            app.LabelMES.FontSize = 11;
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
            app.LabelMESRAP.FontSize = 11;
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
            app.LabelOCR.FontSize = 11;
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
            app.LabelVR.FontSize = 11;
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
            app.LabelRD.FontSize = 11;
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
            app.LabelRGS.FontSize = 11;
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
            app.LabelUC.FontSize = 11;
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
            app.LabelIESM.FontSize = 11;
            app.LabelIESM.FontWeight = 'bold';
            app.LabelIESM.FontAngle = 'italic';
            app.LabelIESM.Layout.Row = 1;
            app.LabelIESM.Layout.Column = 1;
            app.LabelIESM.Text = 'Innitial Shear Stiffness (G0)';

            % Create DatasetSettingsPanel
            app.DatasetSettingsPanel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.DatasetSettingsPanel.Title = 'Dataset Settings';
            app.DatasetSettingsPanel.Visible = 'off';
            app.DatasetSettingsPanel.FontWeight = 'bold';
            app.DatasetSettingsPanel.Position = [250 71 751 480];

            % Create Example
            app.Example = uibutton(app.DatasetSettingsPanel, 'push');
            app.Example.ButtonPushedFcn = createCallbackFcn(app, @ExampleButtonPushed, true);
            app.Example.FontWeight = 'bold';
            app.Example.Position = [10 10 105 50];
            app.Example.Text = {'Use Example'; 'Variables'};

            % Create LoadDataButton
            app.LoadDataButton = uibutton(app.DatasetSettingsPanel, 'push');
            app.LoadDataButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButtonPushed, true);
            app.LoadDataButton.FontWeight = 'bold';
            app.LoadDataButton.Tooltip = {'Click here to load a training dataset!'; 'The dataset should be a .mat file containing a cell array for test properties and a separate cell array for test stiffness curves. The names of these cell arrays should be specified below.'};
            app.LoadDataButton.Position = [10 410 105 40];
            app.LoadDataButton.Text = 'Load Data';

            % Create PreprocessDataButton
            app.PreprocessDataButton = uibutton(app.DatasetSettingsPanel, 'push');
            app.PreprocessDataButton.ButtonPushedFcn = createCallbackFcn(app, @PreprocessDataButtonPushed, true);
            app.PreprocessDataButton.FontWeight = 'bold';
            app.PreprocessDataButton.Enable = 'off';
            app.PreprocessDataButton.Position = [260 10 105 50];
            app.PreprocessDataButton.Text = {'Preprocess '; 'Data'};

            % Create FilterPanel
            app.FilterPanel = uipanel(app.DatasetSettingsPanel);
            app.FilterPanel.Title = 'Filter data by minimum and maximum allowable parameter values:';
            app.FilterPanel.Position = [10 80 730 160];

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.FilterPanel);
            app.GridLayout3.ColumnWidth = {'1x', '1x', '1x', '1x'};

            % Create PPanel
            app.PPanel = uipanel(app.GridLayout3);
            app.PPanel.Title = 'P''';
            app.PPanel.Layout.Row = 1;
            app.PPanel.Layout.Column = 1;
            app.PPanel.FontWeight = 'bold';

            % Create GridLayoutP
            app.GridLayoutP = uigridlayout(app.PPanel);
            app.GridLayoutP.RowHeight = {'1x'};
            app.GridLayoutP.Padding = [0 0 0 0];

            % Create P_min
            app.P_min = uieditfield(app.GridLayoutP, 'numeric');
            app.P_min.Tooltip = {'Minimum allowed P'' value'};
            app.P_min.Layout.Row = 1;
            app.P_min.Layout.Column = 1;

            % Create P_max
            app.P_max = uieditfield(app.GridLayoutP, 'numeric');
            app.P_max.Tooltip = {'Maximum allowed P'' value'};
            app.P_max.Layout.Row = 1;
            app.P_max.Layout.Column = 2;
            app.P_max.Value = 1;

            % Create PPaPanel
            app.PPaPanel = uipanel(app.GridLayout3);
            app.PPaPanel.Title = 'P''/Pa';
            app.PPaPanel.Layout.Row = 1;
            app.PPaPanel.Layout.Column = 2;
            app.PPaPanel.FontWeight = 'bold';

            % Create GridLayoutPPa
            app.GridLayoutPPa = uigridlayout(app.PPaPanel);
            app.GridLayoutPPa.RowHeight = {'1x'};
            app.GridLayoutPPa.Padding = [0 0 0 0];

            % Create PPa_min
            app.PPa_min = uieditfield(app.GridLayoutPPa, 'numeric');
            app.PPa_min.Tooltip = {'Minimum allowed P''/Pa value'};
            app.PPa_min.Layout.Row = 1;
            app.PPa_min.Layout.Column = 1;

            % Create PPa_max
            app.PPa_max = uieditfield(app.GridLayoutPPa, 'numeric');
            app.PPa_max.Tooltip = {'Maximum allowed P''/Pa value'};
            app.PPa_max.Layout.Row = 1;
            app.PPa_max.Layout.Column = 2;
            app.PPa_max.Value = 2;

            % Create OCRPanel
            app.OCRPanel = uipanel(app.GridLayout3);
            app.OCRPanel.Title = 'OCR';
            app.OCRPanel.Layout.Row = 1;
            app.OCRPanel.Layout.Column = 3;
            app.OCRPanel.FontWeight = 'bold';

            % Create GridLayout_OCR
            app.GridLayout_OCR = uigridlayout(app.OCRPanel);
            app.GridLayout_OCR.RowHeight = {'1x'};
            app.GridLayout_OCR.Padding = [0 0 0 0];

            % Create OCR_min
            app.OCR_min = uieditfield(app.GridLayout_OCR, 'numeric');
            app.OCR_min.Tooltip = {'Minimum allowed OCR value'};
            app.OCR_min.Layout.Row = 1;
            app.OCR_min.Layout.Column = 1;

            % Create OCR_max
            app.OCR_max = uieditfield(app.GridLayout_OCR, 'numeric');
            app.OCR_max.Tooltip = {'Maximum allowed OCR value'};
            app.OCR_max.Layout.Row = 1;
            app.OCR_max.Layout.Column = 2;
            app.OCR_max.Value = 2;

            % Create ePanel
            app.ePanel = uipanel(app.GridLayout3);
            app.ePanel.Title = 'e';
            app.ePanel.Layout.Row = 1;
            app.ePanel.Layout.Column = 4;
            app.ePanel.FontWeight = 'bold';

            % Create GridLayoute
            app.GridLayoute = uigridlayout(app.ePanel);
            app.GridLayoute.RowHeight = {'1x'};
            app.GridLayoute.Padding = [0 0 0 0];

            % Create e_min
            app.e_min = uieditfield(app.GridLayoute, 'numeric');
            app.e_min.Tooltip = {'Minimum allowed e value'};
            app.e_min.Layout.Row = 1;
            app.e_min.Layout.Column = 1;

            % Create e_max
            app.e_max = uieditfield(app.GridLayoute, 'numeric');
            app.e_max.Tooltip = {'Maximum allowed e value'};
            app.e_max.Layout.Row = 1;
            app.e_max.Layout.Column = 2;
            app.e_max.Value = 1;

            % Create DrPanel
            app.DrPanel = uipanel(app.GridLayout3);
            app.DrPanel.Title = 'Dr%';
            app.DrPanel.Layout.Row = 2;
            app.DrPanel.Layout.Column = 1;
            app.DrPanel.FontWeight = 'bold';

            % Create GridLayoutDr
            app.GridLayoutDr = uigridlayout(app.DrPanel);
            app.GridLayoutDr.RowHeight = {'1x'};
            app.GridLayoutDr.Padding = [0 0 0 0];

            % Create Dr_min
            app.Dr_min = uieditfield(app.GridLayoutDr, 'numeric');
            app.Dr_min.Tooltip = {'Minimum allowed Dr% value'};
            app.Dr_min.Layout.Row = 1;
            app.Dr_min.Layout.Column = 1;

            % Create Dr_max
            app.Dr_max = uieditfield(app.GridLayoutDr, 'numeric');
            app.Dr_max.Tooltip = {'Maximum allowed Dr% value'};
            app.Dr_max.Layout.Row = 1;
            app.Dr_max.Layout.Column = 2;
            app.Dr_max.Value = 1;

            % Create D50Panel
            app.D50Panel = uipanel(app.GridLayout3);
            app.D50Panel.Title = 'D50';
            app.D50Panel.Layout.Row = 2;
            app.D50Panel.Layout.Column = 2;
            app.D50Panel.FontWeight = 'bold';

            % Create GridLayoutD50
            app.GridLayoutD50 = uigridlayout(app.D50Panel);
            app.GridLayoutD50.RowHeight = {'1x'};
            app.GridLayoutD50.Padding = [0 0 0 0];

            % Create D50_min
            app.D50_min = uieditfield(app.GridLayoutD50, 'numeric');
            app.D50_min.Tooltip = {'Minimum allowed D50 value'};
            app.D50_min.Layout.Row = 1;
            app.D50_min.Layout.Column = 1;

            % Create D50_max
            app.D50_max = uieditfield(app.GridLayoutD50, 'numeric');
            app.D50_max.Layout.Row = 1;
            app.D50_max.Layout.Column = 2;
            app.D50_max.Value = 5;

            % Create CuPanel
            app.CuPanel = uipanel(app.GridLayout3);
            app.CuPanel.Title = 'Cu';
            app.CuPanel.Layout.Row = 2;
            app.CuPanel.Layout.Column = 3;
            app.CuPanel.FontWeight = 'bold';

            % Create GridLayoutCu
            app.GridLayoutCu = uigridlayout(app.CuPanel);
            app.GridLayoutCu.RowHeight = {'1x'};
            app.GridLayoutCu.Padding = [0 0 0 0];

            % Create Cu_min
            app.Cu_min = uieditfield(app.GridLayoutCu, 'numeric');
            app.Cu_min.Tooltip = {'Minimum allowed Cu value'};
            app.Cu_min.Layout.Row = 1;
            app.Cu_min.Layout.Column = 1;

            % Create Cu_max
            app.Cu_max = uieditfield(app.GridLayoutCu, 'numeric');
            app.Cu_max.Layout.Row = 1;
            app.Cu_max.Layout.Column = 2;
            app.Cu_max.Value = 2;

            % Create G0Panel
            app.G0Panel = uipanel(app.GridLayout3);
            app.G0Panel.Title = 'G0';
            app.G0Panel.Layout.Row = 2;
            app.G0Panel.Layout.Column = 4;
            app.G0Panel.FontWeight = 'bold';

            % Create GridLayoutG0
            app.GridLayoutG0 = uigridlayout(app.G0Panel);
            app.GridLayoutG0.RowHeight = {'1x'};
            app.GridLayoutG0.Padding = [0 0 0 0];

            % Create G0_min
            app.G0_min = uieditfield(app.GridLayoutG0, 'numeric');
            app.G0_min.Tooltip = {'Minimum allowed G0 value'};
            app.G0_min.Layout.Row = 1;
            app.G0_min.Layout.Column = 1;

            % Create G0_max
            app.G0_max = uieditfield(app.GridLayoutG0, 'numeric');
            app.G0_max.Layout.Row = 1;
            app.G0_max.Layout.Column = 2;
            app.G0_max.Value = 250;

            % Create notLoadedLabel
            app.notLoadedLabel = uilabel(app.DatasetSettingsPanel);
            app.notLoadedLabel.Position = [125 416 188 28];
            app.notLoadedLabel.Text = {'Dataset not loaded!'; 'Please load a dataset to continue.'};

            % Create PleasespecifycellarraynamesPanel
            app.PleasespecifycellarraynamesPanel = uipanel(app.DatasetSettingsPanel);
            app.PleasespecifycellarraynamesPanel.Title = 'Please specify cell array names.';
            app.PleasespecifycellarraynamesPanel.Position = [11 260 355 130];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.PleasespecifycellarraynamesPanel);
            app.GridLayout4.RowHeight = {'1x', '1x', '1x'};

            % Create NameofpropertiescellarrayLabel
            app.NameofpropertiescellarrayLabel = uilabel(app.GridLayout4);
            app.NameofpropertiescellarrayLabel.WordWrap = 'on';
            app.NameofpropertiescellarrayLabel.Layout.Row = 1;
            app.NameofpropertiescellarrayLabel.Layout.Column = 1;
            app.NameofpropertiescellarrayLabel.Text = 'Name of properties cell array:';

            % Create NameofcurvedatacellarrayLabel
            app.NameofcurvedatacellarrayLabel = uilabel(app.GridLayout4);
            app.NameofcurvedatacellarrayLabel.WordWrap = 'on';
            app.NameofcurvedatacellarrayLabel.Layout.Row = 2;
            app.NameofcurvedatacellarrayLabel.Layout.Column = 1;
            app.NameofcurvedatacellarrayLabel.Text = 'Name of curve data cell array:';

            % Create propertiesNameField
            app.propertiesNameField = uieditfield(app.GridLayout4, 'text');
            app.propertiesNameField.ValueChangedFcn = createCallbackFcn(app, @propertiesNameFieldValueChanged, true);
            app.propertiesNameField.BackgroundColor = [1 0.7608 0.7608];
            app.propertiesNameField.Layout.Row = 1;
            app.propertiesNameField.Layout.Column = 2;
            app.propertiesNameField.Value = 'properties';

            % Create curvesNameField
            app.curvesNameField = uieditfield(app.GridLayout4, 'text');
            app.curvesNameField.ValueChangedFcn = createCallbackFcn(app, @curvesNameFieldValueChanged, true);
            app.curvesNameField.BackgroundColor = [1 0.7608 0.7608];
            app.curvesNameField.Layout.Row = 2;
            app.curvesNameField.Layout.Column = 2;
            app.curvesNameField.Value = 'curves';

            % Create RawdatainexpectedformatLampLabel
            app.RawdatainexpectedformatLampLabel = uilabel(app.GridLayout4);
            app.RawdatainexpectedformatLampLabel.HorizontalAlignment = 'right';
            app.RawdatainexpectedformatLampLabel.Layout.Row = 3;
            app.RawdatainexpectedformatLampLabel.Layout.Column = 1;
            app.RawdatainexpectedformatLampLabel.Text = 'Raw data in expected format:';

            % Create rawdataLamp
            app.rawdataLamp = uilamp(app.GridLayout4);
            app.rawdataLamp.Tooltip = {'The loaded dataset will be validated with the following tests:'; ''; '1. Are there the same number of sub-datasets in each file (i.e. the same number of literature sources)?'; ''; '2. Are there the same number of sets of properties and sets of curves within each sub-dataset?'; ''; '3. Does each curve and property datapoint have the correct dimensins (2xn and 1x8 respectively)?'};
            app.rawdataLamp.Layout.Row = 3;
            app.rawdataLamp.Layout.Column = 2;
            app.rawdataLamp.Color = [1 0 0];

            % Create datasetStatsPanel
            app.datasetStatsPanel = uipanel(app.DatasetSettingsPanel);
            app.datasetStatsPanel.Position = [385 10 355 50];

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.datasetStatsPanel);
            app.GridLayout5.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout5.RowSpacing = 5;
            app.GridLayout5.Padding = [0 0 0 0];

            % Create LoadeddatapointsLabel
            app.LoadeddatapointsLabel = uilabel(app.GridLayout5);
            app.LoadeddatapointsLabel.HorizontalAlignment = 'center';
            app.LoadeddatapointsLabel.Layout.Row = 1;
            app.LoadeddatapointsLabel.Layout.Column = 1;
            app.LoadeddatapointsLabel.Text = 'Loaded datapoints';

            % Create FiltereddatapointsLabel
            app.FiltereddatapointsLabel = uilabel(app.GridLayout5);
            app.FiltereddatapointsLabel.HorizontalAlignment = 'center';
            app.FiltereddatapointsLabel.Layout.Row = 1;
            app.FiltereddatapointsLabel.Layout.Column = 2;
            app.FiltereddatapointsLabel.Text = 'Filtered datapoints';

            % Create FinalnodatapointsLabel
            app.FinalnodatapointsLabel = uilabel(app.GridLayout5);
            app.FinalnodatapointsLabel.HorizontalAlignment = 'center';
            app.FinalnodatapointsLabel.Layout.Row = 1;
            app.FinalnodatapointsLabel.Layout.Column = 3;
            app.FinalnodatapointsLabel.Text = 'Final no. datapoints';

            % Create init_datapoints
            app.init_datapoints = uieditfield(app.GridLayout5, 'numeric');
            app.init_datapoints.Editable = 'off';
            app.init_datapoints.Layout.Row = 2;
            app.init_datapoints.Layout.Column = 1;

            % Create filteres_datapoints
            app.filteres_datapoints = uieditfield(app.GridLayout5, 'numeric');
            app.filteres_datapoints.Editable = 'off';
            app.filteres_datapoints.Layout.Row = 2;
            app.filteres_datapoints.Layout.Column = 2;

            % Create final_datapoints
            app.final_datapoints = uieditfield(app.GridLayout5, 'numeric');
            app.final_datapoints.Editable = 'off';
            app.final_datapoints.Layout.Row = 2;
            app.final_datapoints.Layout.Column = 3;

            % Create LoadedLabel
            app.LoadedLabel = uilabel(app.DatasetSettingsPanel);
            app.LoadedLabel.Visible = 'off';
            app.LoadedLabel.Position = [125 421 90 22];
            app.LoadedLabel.Text = 'Dataset loaded!';

            % Create FilterDataToggle
            app.FilterDataToggle = uibutton(app.DatasetSettingsPanel, 'state');
            app.FilterDataToggle.Text = {'Filter Data By '; 'Parameter Values'; ''};
            app.FilterDataToggle.FontSize = 10;
            app.FilterDataToggle.FontWeight = 'bold';
            app.FilterDataToggle.Position = [135 10 105 50];

            % Create OutputCurvePanel
            app.OutputCurvePanel = uipanel(app.ShearStiffnessDegradationUIFigure);
            app.OutputCurvePanel.Title = 'Output Curve';
            app.OutputCurvePanel.FontWeight = 'bold';
            app.OutputCurvePanel.Position = [250 71 751 480];

            % Create UIAxes
            app.UIAxes = uiaxes(app.OutputCurvePanel);
            xlabel(app.UIAxes, 'Strain %')
            ylabel(app.UIAxes, 'G/G0')
            app.UIAxes.Toolbar.Visible = 'off';
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.XLim = [0.0001 10];
            app.UIAxes.YLim = [0 1.1];
            app.UIAxes.XTick = [0.0001 0.001 0.01 0.1 1 10];
            app.UIAxes.XTickLabelRotation = 0;
            app.UIAxes.XScale = 'log';
            app.UIAxes.XTickLabel = {'0.0001'; '0.001'; '0.01'; '0.1'; '1'; '10'};
            app.UIAxes.XMinorTick = 'on';
            app.UIAxes.YTick = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
            app.UIAxes.YTickLabelRotation = 0;
            app.UIAxes.ZTickLabelRotation = 0;
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [0 0 744 456];

            % Show the figure after all components are created
            app.ShearStiffnessDegradationUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = NnApp

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ShearStiffnessDegradationUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ShearStiffnessDegradationUIFigure)
        end
    end
end