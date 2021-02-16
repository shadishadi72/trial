%% control 
clear all 
clc
%The frontal asymmetry is most commonly
%computed by subtracting the natural log of left
%hemisphere alpha power (EEG electrode F3) 
%from the natural log of right hemisphere alpha power (F4)
%while using the central Cz as reference electrode (Coan and Allen, 2004)."


load('all_cont_inter_dataset2.mat')
load('all_dis_inter_dataset2.mat')
load('gender_dis.mat')
load('gender_cont.mat')
% cont 
ind_f_cont=find(gender_cont==0);
ind_m_cont=find(gender_cont==1);
% dis 
ind_f_dis=find(gender_dis==0);
ind_m_dis=find(gender_dis==1);

%% control 
for i=1:size(ind_f_cont)
arightcont=all_cont_inter_dataset2{ind_f_cont(i), 1}{1, 3} ; 
aleftcont=all_cont_inter_dataset2{ind_f_cont(i), 1}{2, 3} ;
assymcont(i,1)=log(arightcont/aleftcont); 
assymcont(i,1)=arightcont-aleftcont; 

end 

%% disforia

for i=1:size(ind_f_dis)
arightdis=all_dis_inter_dataset2{ind_f_dis(i), 1}{1, 3} ; 
aleftdis=all_dis_inter_dataset2{ind_f_dis(i), 1}{2, 3} ;
assymdis(i,1)=log(arightdis/aleftdis); 
assymdis(i,1)=arightdis-aleftdis; 

end 

%%statistics
asymstat=ranksum(assymcont,assymdis)
asym_median_cont=median(assymcont)
asym_median_dis=median(assymdis)
asym_mad_cont=mad(assymcont)
asym_mad_dis=mad(assymdis)



% asymstat=ranksum(abs(assymcont),abs(assymdis))


