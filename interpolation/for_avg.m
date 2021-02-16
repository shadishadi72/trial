function [EEG_interpolated]=for_avg(EEG)


%% do averaging 
EEG_interpolated=cell(7,1);
EEG_interpolated{1,1}=mean([EEG.data(1,:);EEG.data(3,:);EEG.data(11,:)]);
EEG_interpolated{2,1}=mean([EEG.data(2,:);EEG.data(4,:);EEG.data(12,:)]);
EEG_interpolated{3,1}=mean([EEG.data(13,:);EEG.data(5,:)]);
EEG_interpolated{4,1}=mean([EEG.data(14,:);EEG.data(6,:)]);
EEG_interpolated{5,1}=mean([EEG.data(15,:);EEG.data(7,:);EEG.data(9,:)]);
EEG_interpolated{6,1}=mean([EEG.data(16,:);EEG.data(8,:);EEG.data(10,:)]);
EEG_interpolated{7,1}=mean([EEG.data(17,:);EEG.data(18,:);EEG.data(19,:)]);


% EEG_interpolated= eeg_interp(EEG_new, bad_elec,  'spherical');
end
