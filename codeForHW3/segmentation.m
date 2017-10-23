%Task 1: Segment Data. 
%Inputs: Sampling Frequencies
lenOfVideoInSecs = 488;
 RelPath = './../Amulya/fork/';
 isSpoon = 0;
 
 %load data into variables
 if (isSpoon == 1)
     allIMU = csvread(strcat(RelPath, '1503512621910_IMU.txt'));
     allEMG = csvread(strcat(RelPath, '1503512621910_EMG.txt'));
     eatActionFrames = csvread(strcat(RelPath, '1503512621910_frameSegments.txt'));
 elseif (isSpoon == 0)
     allIMU = csvread(strcat(RelPath, '1503512024740_IMU.txt'));
     allEMG = csvread(strcat(RelPath, '1503512024740_EMG.txt'));
     eatActionFrames = csvread(strcat(RelPath, '1503512024740_frameSegments.txt'));
 end
 
 numIMUSamples = size(allIMU, 1);
 numEMGSamples = size(allEMG, 1);
 numVideoFrames = eatActionFrames(size(eatActionFrames, 1), 2);
 videoFreq = numVideoFrames/lenOfVideoInSecs;
 IMUFreq = numIMUSamples/lenOfVideoInSecs;
 EMGFreq = numEMGSamples/lenOfVideoInSecs;
 
 %scaling factors
 forIMU = IMUFreq/videoFreq;
 forEMG = EMGFreq/videoFreq;
 
 numEatSamples = size(eatActionFrames, 1);

 eatActionFrames = [eatActionFrames, eatActionFrames(:,2)-eatActionFrames(:,1)];
 longestEatActionLength = max(eatActionFrames(:,4))*forEMG;
 eatActionFinalMatrix = zeros((numEatSamples*18), floor(longestEatActionLength));
curIndex = 1;
 for i = 1:numEatSamples
     startFrame = eatActionFrames(i, 1);
     endFrame = eatActionFrames(i, 2);     
     startIMURecord = floor(startFrame*forIMU);
     endIMURecord = floor(endFrame*forIMU);
%      X = ['S',num2str(startIMURecord),': E', num2str(endIMURecord)];
%      disp(X)
     startEMGRecord = floor(startFrame*forEMG);
     endEMGRecord = floor(endFrame*forEMG);
     
     curIMU = allIMU(startIMURecord:endIMURecord,2:11).';
     zeroPadding = zeros((10), size(eatActionFinalMatrix, 2) - size(curIMU, 2));
     curIMU = [curIMU, zeroPadding];
     if size(curIMU, 2) > size(eatActionFinalMatrix, 2)
         curIMU = curIMU(:,1:size(eatActionFinalMatrix, 2));
         disp('Choppped!!');
     end
     eatActionFinalMatrix(curIndex:curIndex+9,:) = curIMU;
     curIndex = curIndex + 10;
     curEMG = allEMG(startEMGRecord:endEMGRecord, 2:9).';
     zeroPadding = zeros((8), size(eatActionFinalMatrix, 2) - size(curEMG, 2));
     curEMG = [curEMG, zeroPadding];
     if size(curEMG, 2) > size(eatActionFinalMatrix, 2)
         curEMG = curEMG(:,1:size(eatActionFinalMatrix, 2));
         disp('Choppped!!');
     end
     eatActionFinalMatrix(curIndex:curIndex+7,:) = curEMG;
     curIndex = curIndex + 8;
     
 end
 

   %%Non-Eating:
 %Computing the start and end frames for non-eating action
 nonEatActionFrames = [];
 for i = 1:numEatSamples-1
    
     startNonEatFrame = eatActionFrames(i, 2)+1;
     endNonEatFrame = eatActionFrames(i+1, 1)-1;
     nonEatActionFrames = [nonEatActionFrames; [startNonEatFrame, endNonEatFrame]];
 end
 
 %Same as code from above
 numNonEatSamples = size(nonEatActionFrames, 1);
 nonEatActionFrames = [nonEatActionFrames, nonEatActionFrames(:,2)-nonEatActionFrames(:,1)];
 longestNonEatActionLength = max(nonEatActionFrames(:,3))*forEMG;
 nonEatActionFinalMatrix = zeros((numNonEatSamples*18), floor(longestNonEatActionLength));
curIndex = 1;
 for i = 1:numNonEatSamples
     startFrame = nonEatActionFrames(i, 1);
     endFrame = nonEatActionFrames(i, 2);     
     startIMURecord = floor(startFrame*forIMU);
     endIMURecord = floor(endFrame*forIMU);
%      X = ['S',num2str(startIMURecord),': E', num2str(endIMURecord)];
%      disp(X)
     startEMGRecord = floor(startFrame*forEMG);
     endEMGRecord = floor(endFrame*forEMG);
     
     curIMU = allIMU(startIMURecord:endIMURecord,2:11).';
     zeroPadding = zeros((10), size(nonEatActionFinalMatrix, 2) - size(curIMU, 2));
     curIMU = [curIMU, zeroPadding];
     if size(curIMU, 2) > size(nonEatActionFinalMatrix, 2)
         curIMU = curIMU(:,1:size(nonEatActionFinalMatrix, 2));
         disp('Choppped!!');
     end
     nonEatActionFinalMatrix(curIndex:curIndex+9,:) = curIMU;
     curIndex = curIndex + 10;
     curEMG = allEMG(startEMGRecord:endEMGRecord, 2:9).';
     zeroPadding = zeros((8), size(nonEatActionFinalMatrix, 2) - size(curEMG, 2));
     curEMG = [curEMG, zeroPadding];
     if size(curEMG, 2) > size(nonEatActionFinalMatrix, 2)
         curEMG = curEMG(:,1:size(nonEatActionFinalMatrix, 2));
         disp('Choppped!!');
     end
     nonEatActionFinalMatrix(curIndex:curIndex+7,:) = curEMG;
     curIndex = curIndex + 8;
     
 end