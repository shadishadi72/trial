function [EEG_interpolated]=for_avg_group(inp)


%% do averaging 
EEG_interpolated=cell(7,1);
EEG_interpolated{1,1}=mean([inp(1,:);inp(3,:);inp(11,:)]);
EEG_interpolated{2,1}=mean([inp(2,:);inp(4,:);inp(12,:)]);
EEG_interpolated{3,1}=mean([inp(13,:);inp(5,:)]);
EEG_interpolated{4,1}=mean([inp(14,:);inp(6,:)]);
EEG_interpolated{5,1}=mean([inp(15,:);inp(7,:);inp(9,:)]);
EEG_interpolated{6,1}=mean([inp(16,:);inp(8,:);inp(10,:)]);
EEG_interpolated{7,1}=mean([inp(17,:);inp(18,:);inp(19,:)]);


% EEG_interpolated= eeg_interp(EEG_new, bad_elec,  'spherical');
end
