% Project2Plot.m
% Peter Ferrero, Oregon State University, 4/30/2018, CS575, Project 2
% A file to produce the plots for Project 2 of CS575

load('FalseSharingPadData.txt')
load('FalseSharingTempData.txt')

pad = [0:15]';
padPeak = reshape(FalseSharingPadData(:,2),16,[]);
tempPeak = FalseSharingTempData(:,2)';
tempPeak = repmat(tempPeak,16,1);

threadLegend = ["1 Thread", "2 Threads", "4 Threads", "8 Threads"];

figure
plot(pad, padPeak(:,1),'Color',[0, 0.4470, 0.7410],'Marker','o')
hold on
plot(pad, padPeak(:,2),'Color',[0.6350, 0.0780, 0.1840],'Marker','s')
plot(pad, padPeak(:,3),'Color',[0.4660, 0.6740, 0.1880],'Marker','^')
plot(pad, padPeak(:,4),'Color',[0.8500, 0.3250, 0.0980],'Marker','*')
plot(pad, tempPeak(:,1),'Color',[0, 0.4470, 0.7410])
plot(pad, tempPeak(:,2),'Color',[0.6350, 0.0780, 0.1840])
plot(pad, tempPeak(:,3),'Color',[0.4660, 0.6740, 0.1880])
plot(pad, tempPeak(:,4),'Color',[0.8500, 0.3250, 0.0980])
xlabel('Number of Pads')
ylabel('MegaSums per Second, MegaSums/Sec')
legend(threadLegend,'Location','eastoutside')
xticks([0:15])
axis([-inf,inf,-inf,1800])
set(gcf, 'Position', [400, 400, 750, 500])