RelPath = './../segmentedData/';

%Loading all the segmented data;
load(strcat(RelPath, 'eatActionSegmentedFork.mat'));
eatActionFork = eatActionFinalMatrix;
clear eatActionFinalMatrix;

load(strcat(RelPath, 'eatActionSegmentedSpoon.mat'));
eatActionSpoon = eatActionFinalMatrix;
clear eatActionFinalMatrix;

load(strcat(RelPath, 'nonEatActionSegmentedFork.mat'));
nonEatActionFork = nonEatActionFinalMatrix;
clear nonEatActionFinalMatrix;

load(strcat(RelPath, 'nonEatActionSegmentedSpoon.mat'));
nonEatActionSpoon = nonEatActionFinalMatrix;
clear nonEatActionFinalMatrix;

%Just plot all the features so we will understand what kind of features to
%compute 

for i = 1: 18
    figure;
    index = 1;
    for j = 1:size(eatActionSpoon, 1)
        if mod(j-i, 18) == 0
            lenOfRow = findNonZeroIndex(eatActionSpoon(j,:));
            hold on
            plot(index: index+lenOfRow-1, eatActionSpoon(j,1:lenOfRow), 'r');
            index = index+lenOfRow;
        end
    end
    for j = 1:size(nonEatActionSpoon, 1)
        if mod(j-i, 18) == 0
            lenOfRow = findNonZeroIndex(nonEatActionSpoon(j,:));
            hold on
            plot(index: index+lenOfRow-1, nonEatActionSpoon(j,1:lenOfRow), 'b');
            index = index+lenOfRow;
        end
    end
    
end

% computing mean of all the features. 

% meansEatSpoon = mean(eatActionSpoon.');
% meansEatSpoonFinal = [];
% 
% for i = 1:size(meansEatSpoon, 2)/18
%     meansEatSpoonFinal = [meansEatSpoonFinal; meansEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear meansEatSpoon; 
% 
% meansEatFork = mean(eatActionFork.');
% meansEatForkFinal = [];
% 
% for i = 1:size(meansEatFork, 2)/18
%     meansEatForkFinal = [meansEatForkFinal; meansEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear meansEatFork; 
% 
% meansNonEatSpoon = mean(nonEatActionSpoon.');
% meansNonEatSpoonFinal = [];
% 
% for i = 1:size(meansNonEatSpoon, 2)/18
%     meansNonEatSpoonFinal = [meansNonEatSpoonFinal; meansNonEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear meansNonEatSpoon
% 
% meansNonEatFork = mean(nonEatActionFork.');
% meansNonEatForkFinal = [];
% 
% for i = 1:size(meansNonEatFork, 2)/18
%     meansNonEatForkFinal = [meansNonEatForkFinal; meansNonEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear meansNonEatFork
% figure; 
% for i = 1:18
%     subplot(6,3,i)
%     scatter(1:size(meansEatSpoonFinal, 1), meansEatSpoonFinal(:,i),'*', 'r');
%     hold on
%     scatter(1:size(meansEatForkFinal, 1),meansEatForkFinal(:,i), '*', 'r');
%     hold on
%     scatter(1:size(meansNonEatSpoonFinal, 1),meansNonEatSpoonFinal(:,i), '*', 'b');
%     hold on
%     scatter(1:size(meansNonEatForkFinal, 1),meansNonEatForkFinal(:,i), '*', 'b');
%     hold on
% end
% 
% %%Modified Mean

% meansEatSpoon = sum(eatActionSpoon.')./(sum(eatActionSpoon ~= 0, 2)).';
% meansEatSpoonFinal = [];
% 
% for i = 1:size(meansEatSpoon, 2)/18
%     meansEatSpoonFinal = [meansEatSpoonFinal; meansEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear meansEatSpoon; 
% 
% meansEatFork = sum(eatActionFork.')./(sum(eatActionFork ~= 0, 2)).';
% meansEatForkFinal = [];
% 
% for i = 1:size(meansEatFork, 2)/18
%     meansEatForkFinal = [meansEatForkFinal; meansEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear meansEatFork; 
% 
% meansNonEatSpoon = sum(nonEatActionSpoon.')./(sum(nonEatActionSpoon ~= 0, 2)).';
% meansNonEatSpoonFinal = [];
% 
% for i = 1:size(meansNonEatSpoon, 2)/18
%     meansNonEatSpoonFinal = [meansNonEatSpoonFinal; meansNonEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear meansNonEatSpoon
% 
% meansNonEatFork = sum(nonEatActionFork.')./(sum(nonEatActionFork ~= 0, 2)).';
% meansNonEatForkFinal = [];
% 
% for i = 1:size(meansNonEatFork, 2)/18
%     meansNonEatForkFinal = [meansNonEatForkFinal; meansNonEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear meansNonEatFork
% 
% figure; 
% for i = 1:18
%     subplot(6,3,i)
%     scatter(1:size(meansEatSpoonFinal, 1), meansEatSpoonFinal(:,i),'*', 'r');
%     hold on
%     scatter(1:size(meansEatForkFinal, 1),meansEatForkFinal(:,i), '*', 'r');
%     hold on
%     scatter(1:size(meansNonEatSpoonFinal, 1),meansNonEatSpoonFinal(:,i), '*', 'b');
%     hold on
%     scatter(1:size(meansNonEatForkFinal, 1),meansNonEatForkFinal(:,i), '*', 'b');
%     hold on
% end

% %%Difference Between Maximum and Min Values
%
% maxMinusMinEatSpoon = max(eatActionSpoon.') - min(eatActionSpoon.');
% maxMinusMinEatSpoonFinal = [];
% 
% for i = 1:size(maxMinusMinEatSpoon, 2)/18
%     maxMinusMinEatSpoonFinal = [maxMinusMinEatSpoonFinal; maxMinusMinEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinEatSpoon; 
% 
% maxMinusMinEatFork = max(eatActionFork.') - min(eatActionFork.');
% maxMinusMinEatForkFinal = [];
% 
% for i = 1:size(maxMinusMinEatFork, 2)/18
%     maxMinusMinEatForkFinal = [maxMinusMinEatForkFinal; maxMinusMinEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinEatFork; 
% 
% maxMinusMinNonEatSpoon = max(nonEatActionSpoon.') - min(nonEatActionSpoon.');
% maxMinusMinNonEatSpoonFinal = [];
% 
% for i = 1:size(maxMinusMinNonEatSpoon, 2)/18
%     maxMinusMinNonEatSpoonFinal = [maxMinusMinNonEatSpoonFinal; maxMinusMinNonEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinNonEatSpoon
% 
% maxMinusMinNonEatFork = max(nonEatActionFork.') - min(nonEatActionFork.');
% maxMinusMinNonEatForkFinal = [];
% 
% for i = 1:size(maxMinusMinNonEatFork, 2)/18
%     maxMinusMinNonEatForkFinal = [maxMinusMinNonEatForkFinal; maxMinusMinNonEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinNonEatFork
% 
% figure; 
% for i = 1:18
%     subplot(6,3,i)
%     scatter(1:size(maxMinusMinEatSpoonFinal, 1), maxMinusMinEatSpoonFinal(:,i),'*', 'r');
%     hold on
%     scatter(1:size(maxMinusMinEatForkFinal, 1),maxMinusMinEatForkFinal(:,i), '*', 'r');
%     hold on
%     scatter(1:size(maxMinusMinNonEatSpoonFinal, 1),maxMinusMinNonEatSpoonFinal(:,i), '*', 'b');
%     hold on
%     scatter(1:size(maxMinusMinNonEatForkFinal, 1),maxMinusMinNonEatForkFinal(:,i), '*', 'b');
%     hold on
% end

%%Maximum values as features
% maxMinusMinEatSpoon = max(eatActionSpoon.');% - min(eatActionSpoon.');
% maxMinusMinEatSpoonFinal = [];
% 
% for i = 1:size(maxMinusMinEatSpoon, 2)/18
%     maxMinusMinEatSpoonFinal = [maxMinusMinEatSpoonFinal; maxMinusMinEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinEatSpoon; 
% 
% maxMinusMinEatFork = max(eatActionFork.');% - min(eatActionFork.');
% maxMinusMinEatForkFinal = [];
% 
% for i = 1:size(maxMinusMinEatFork, 2)/18
%     maxMinusMinEatForkFinal = [maxMinusMinEatForkFinal; maxMinusMinEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinEatFork; 
% 
% maxMinusMinNonEatSpoon = max(nonEatActionSpoon.');% - min(nonEatActionSpoon.');
% maxMinusMinNonEatSpoonFinal = [];
% 
% for i = 1:size(maxMinusMinNonEatSpoon, 2)/18
%     maxMinusMinNonEatSpoonFinal = [maxMinusMinNonEatSpoonFinal; maxMinusMinNonEatSpoon(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinNonEatSpoon
% 
% maxMinusMinNonEatFork = max(nonEatActionFork.');% - min(nonEatActionFork.');
% maxMinusMinNonEatForkFinal = [];
% 
% for i = 1:size(maxMinusMinNonEatFork, 2)/18
%     maxMinusMinNonEatForkFinal = [maxMinusMinNonEatForkFinal; maxMinusMinNonEatFork(1, (i-1)*18+1:(i)*18)];
% end
% clear maxMinusMinNonEatFork
% 
% 
% for i = 1:18
%     figure; 
%     scatter(1:size(maxMinusMinEatSpoonFinal, 1), maxMinusMinEatSpoonFinal(:,i),'*', 'r');
%     hold on
%     scatter(1:size(maxMinusMinEatForkFinal, 1),maxMinusMinEatForkFinal(:,i), '*', 'r');
%     hold on
%     scatter(1:size(maxMinusMinNonEatSpoonFinal, 1),maxMinusMinNonEatSpoonFinal(:,i), '*', 'b');
%     hold on
%     scatter(1:size(maxMinusMinNonEatForkFinal, 1),maxMinusMinNonEatForkFinal(:,i), '*', 'b');
%     hold on
% end

% To understand the histograms, still writing this part, so incomplete

% RelPath = './../Amulya/';
% ranges = zeros(18, 2);
% allIMUSpoon = csvread(strcat(RelPath, 'spoon/1503512621910_IMU.txt'));
% allEMGSpoon = csvread(strcat(RelPath, 'spoon/1503512621910_EMG.txt'));
% allIMUFork = csvread(strcat(RelPath, 'fork/1503512024740_IMU.txt'));
% allEMGFork = csvread(strcat(RelPath, 'fork/1503512024740_EMG.txt'));
% allIMU = [allIMUSpoon(:,2:11); allIMUFork(:,2:11)];
% allEMG = [allEMGSpoon(:,2:9);allEMGFork(:,2:9)];
% for i = 1:18  
%     if (i <= 10)
%         ranges(i, 1) = max(allIMU(:, i));
%         ranges(i, 2) = min(allIMU(:, i));
%     else
%         ranges(i, 1) = max(allEMG(:, i-10));
%         ranges(i, 2) = min(allEMG(:, i-10));
%     end
%         
% end

