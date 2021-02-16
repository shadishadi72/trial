%% 
clear, close all

% Rekenbeest dirs
% Dataset 1
basedir = '/Users/shadi/Documents/EEG/datasets EEG/processed_pc';
% dataset 2 
% basedir = '/Users/shadi/Documents/EEG/new disforia dataset/processednew_ex2';

fundir='/Users/shadi/Desktop/EEG';
cd(basedir)
% Dataset 1
procfilz = dir('*_cont_fin.set');
% dataset 2 
% procfilz = dir('*_cont.set');

% all_cont=cell(length(procfilz),1);


for k = 1:length(procfilz)
%     outfilename = ([writdir procfilz(filei).name(1:end-13) 'rejected_trials.mat']); % you should check whether the .name(1:end-13) produces a sensible filename!
k
    EEG=pop_loadset(procfilz(k).name);
    EEG_interpolated=for_inter(EEG);
     EEG_interpolated_all{k,1}=EEG_interpolated;
   

no_chan_int=7;
%% calculating spectogram
fs_d=500;
f_eeg_all=cell(no_chan_int,6);
for i=20:19+no_chan_int
sdata= EEG_interpolated.data;
sdata_cha=sdata(i,:);
% siglength=length(sdata_cha)/fs_d;

%% we want to segment every 100 s

%% how many segments , length of t 
%  nadvance = length(window) - overlap; 
%  nrecord  = fix ( (length(rest1_d)- overlap) / nadvance ); 
window=blackman(fs_d*4);
overlap=fs_d*3;
% [s,w,time]=spectrogram(sdata_cha,window,overlap,[],fs_d);
[s,ff]=pwelch(sdata_cha,4*fs_d,3*fs_d,4*fs_d,fs_d);
f_eeg_all{i-19,1} = bandpower(s,ff,[0.5,4],'psd');
f_eeg_all{i-19,2} = bandpower(s,ff,[4,8],'psd');
f_eeg_all{i-19,3} = bandpower(s,ff,[8,13],'psd');
f_eeg_all{i-19,4} = bandpower(s,ff,[14,30],'psd');
f_eeg_all{i-19,5} = bandpower(s,ff,[32,45],'psd');



%     figure
% spectrogram(sdata1,window,overlap,[],fs_d);


% %%  bands 
%  % delta
%  f_eeg_delta=cal_pow(0.5,4,s,w);
%  f_eeg_all{i,1}=f_eeg_delta;
% % theta
%   f_eeg_theta=cal_pow(4,8,s,w);
%  f_eeg_all{i,2}=f_eeg_theta;
%  % alpha 
%    f_eeg_alpha=cal_pow(8,13,s,w);
%  f_eeg_all{i,3}=f_eeg_alpha;
%  
% % beta 
%  f_eeg_beta=cal_pow(14,30,s,w);
%  f_eeg_all{i,4}=f_eeg_beta;
% 
% % gamma
%   f_eeg_gamma=cal_pow(32,45,s,w);
%  f_eeg_all{i,5}=f_eeg_gamma;
%  
 

end

  all_cont_inter_dataset2{k,1}=f_eeg_all;

end
% 
% %% do stat 
% 
% a=double(EEG.data);
% b=mean(a');
% figure
% topoplot(b, 'Standard-10-20-Cap19.locs'); % read a channel locations file and plot a map
