clear all
close all
%load from folder Data
[path,~,~]=fileparts(matlab.desktop.editor.getActiveFilename);
cd(path);
cd ..\
file=fullfile(pwd,"\Data\ENZYMES.mat"); %change the filename acordding to the dataset
load(file,"Runs","folds","ValidationFrequency","miniBatchSize",...
    "maxEpochs","numHiddenUnits","LearnRateDropFactor","LearnRateDropPeriod", ...
    "InitialLearnRate",...
    "cvp","YData","XData");
%%uncommnet the following lines to tune the network training params
%load("MUTAG-DE.mat",XData,YData);
%Runs=1; 
%folds=10; 
%ValidationFrequency=7;
miniBatchSize = 300;
maxEpochs = 6000; 
%numHiddenUnits = 350; 
%LearnRateDropFactor=0.93; 
%LearnRateDropPeriod=100; 
%InitialLearnRate=0.01;
YData=categorical(YData);
numClasses=numel(unique(string(YData)));
numFeatures = size(XData{1},1);

%Define Network Architecture
layers = [ ...
    sequenceInputLayer(numFeatures)    
    bilstmLayer(numHiddenUnits,'OutputMode','last')    
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

count=1;
for k=1:Runs     
    %uncomment for suffle the data
    cvp = cvpartition(YData,'KFold',folds,'Stratify',true);
    for kfold=1:folds                  
        XTr=XData(training(cvp,kfold));
        XTs=XData(test(cvp,kfold));        
        YTr=YData(training(cvp,kfold));
        YTs=YData(test(cvp,kfold));  
        options = trainingOptions('adam', ...    
    'LearnRateSchedule',"piecewise", ...
    'LearnRateDropFactor',LearnRateDropFactor, ...
    'LearnRateDropPeriod',LearnRateDropPeriod,...
    'InitialLearnRate',InitialLearnRate,...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest', ...
    'Shuffle','every-epoch', ... 
    'Verbose',1, ...    
    'ValidationFrequency',ValidationFrequency,...
    "ExecutionEnvironment","auto",... 
    'OutputNetwork','best-validation-loss',...
    'ValidationData',{XTs,YTs});    
   
    net=trainNetwork(XTr,YTr,layers,options);             
    [YPred{count,1},scores{count,1}] = classify(net,XTs, ...
        'MiniBatchSize',miniBatchSize, ...
        'SequenceLength','longest');
    acc(count,1) = sum(YPred{count,1} == YTs)./numel(XTs)  ;
          
    figure
    cmat{count} = confusionmat(YTs,YPred{count,1});
    confusionchart(cmat{count},[unique(YData)] );
    sprintf("mean(acc) %f",  mean(acc))
    count=count+1;           
    end
end
