clear all
clc
% cont
% load('/Users/shadi/Documents/EEG/new disforia dataset/processednew_ex2/dataset 2 dis/data_sing_cont.mat')
 load('/Users/shadi/Documents/EEG/new disforia dataset/processednew_ex2/dataset 2 dis/data_sing_dis.mat')


for i=1:size(data_sing_dis,1)
    inp=cell2mat(data_sing_dis(i,1));
[EEG_interpolated{i,1}]=for_avg_group(inp);
end
cont_interp=EEG_interpolated;

fs_d=500;
fs=fs_d;

data_filt_delta=cell(size(cont_interp,1),1);
data_filt_theta=cell(size(cont_interp,1),1);
data_filt_alpha=cell(size(cont_interp,1),1);
data_filt_beta=cell(size(cont_interp,1),1);
data_filt_gamma=cell(size(cont_interp,1),1);
no_chan=7;
no_band=5;
% 


for k=1:size(cont_interp,1)
    data=cell2mat(cont_interp{k,1});
%     data=data([20:26],:);
    data_filt_delta{k,1}=eegfilt(data,fs_d,.5,4);
end

for k=1:size(cont_interp,1)
    data=cell2mat(cont_interp{k,1});
%         data=data([20:26],:);

    data_filt_theta{k,1}=eegfilt(data,fs_d,4,8);
end
for k=1:size(cont_interp)
    data=cell2mat(cont_interp{k,1});
%         data=data([20:26],:);

    data_filt_alpha{k,1}=eegfilt(data,fs_d,8,13);
end
 for k=1:size(cont_interp)
    data=cell2mat(cont_interp{k,1});
%      data=data([20:26],:);

    data_filt_beta{k,1}=eegfilt(data,fs_d,14,30);
 end
 for k=1:size(cont_interp)
    data=cell2mat(cont_interp{k,1});
%      data=data([20:26],:);

    data_filt_gamma{k,1}=eegfilt(data,fs_d,32,45);
 end

 data_filt_all=cell(5,1);
 data_filt_all{1,1}=data_filt_delta;
 data_filt_all{2,1}=data_filt_theta;
  data_filt_all{3,1}=data_filt_alpha;
 data_filt_all{4,1}=data_filt_beta;
data_filt_all{5,1}=data_filt_gamma;

data_filt_all_cont_21=data_filt_all;

% save data_filt_all_dis data_filt_all_dis
% mpc_dis_freq=cell(length(dis_channels),1);





for mm=1:no_band
mm
% mpc_dis_freq=cell(12,1);
for k=1:size(cont_interp)
    k
    data=data_filt_all_cont_21{mm,1}{k,1};
%     data=cell2mat(data);
   
%     mpc_all=cell(1,2);
    
for i=1:no_chan
    for j=1:no_chan
        
        
        data1=data(i,:);
        data2=data(j,:);
%         
%       [spec_data1,w1,time1]=spectrogram(data1,window,overlap,[],fs_d);
%       [spec_data2,w2,time2]=spectrogram(data2,window,overlap,[],fs_d);
      
      %delta
%        delta1=sig_connect(0.5,4,spec_data1,w1);
%        delta2=sig_connect(0.5,4,spec_data2,w2); 
       
        


        mpc(i,j) = my_mean_phase_coherence(data1,data2);
    
        
        
    end
   

   



   
end

mpc_cont_freq{k,1}=mpc;

end 
mpc_all_cont_21_inter{1,mm}=mpc_cont_freq;

end
% mpc_cont_dataset1_inter=mpc_all_cont_21_inter;
mpc_dis_dataset2_avg=mpc_all_cont_21_inter;

mpc_cont_group=mpc_dis_dataset2_avg;
