%% control 
clear all 
clc
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

% cont 
ind_f_cont=find(gender_cont==0);
ind_m_cont=find(gender_cont==1);
% dis 
ind_f_dis=find(gender_dis==0);
ind_m_dis=find(gender_dis==1);


%% control 
for i=1:size(ind_f_cont)
cont_fem=all_cont_inter_dataset2(ind_f_cont(i)); 
cont_fem=cont_fem{1,1};
cont_fem_alpha=cell2mat(cont_fem(:,2))';
cont_fem_theta=cell2mat(cont_fem(:,3))';

cont_fem_alpha_all{i,1}=cont_fem_alpha; 
cont_fem_theta_all{i,1}=cont_fem_theta; 
end
cont_fem_theta_all=cell2mat(cont_fem_theta_all);
% cont_fem_theta_all=cont_fem_theta_all(:,[1:19]);

cont_fem_alpha_all=cell2mat(cont_fem_alpha_all);
% cont_fem_alpha_all=cont_fem_alpha_all(:,[1:19]);

cont_fem_alphatheta=[cont_fem_theta_all,cont_fem_alpha_all];


%% disforia
for i=1:size(ind_f_dis)
dis_fem=all_dis_inter_dataset2(ind_f_dis(i)); 
dis_fem=dis_fem{1,1};

dis_fem_alpha=cell2mat(dis_fem(:,2))';
dis_fem_theta=cell2mat(dis_fem(:,3))';

dis_fem_alpha_all{i,1}=dis_fem_alpha; 
dis_fem_theta_all{i,1}=dis_fem_theta; 
end
dis_fem_theta_all=cell2mat(dis_fem_theta_all);
% dis_fem_theta_all=dis_fem_theta_all(:,[1:19]);

dis_fem_alpha_all=cell2mat(dis_fem_alpha_all);
% dis_fem_alpha_all=dis_fem_alpha_all(:,[1:19]);

dis_fem_alphatheta=[dis_fem_theta_all,dis_fem_alpha_all];




%% creating input 
inpi=zeros(size(cont_fem_alphatheta,1)+size(dis_fem_alphatheta,1),size(cont_fem_alphatheta,2)+2);


inpi(:,1)=[1:size(cont_fem_alphatheta,1)+size(dis_fem_alphatheta,1)];
inpi(1:size(cont_fem_alphatheta,1),[2:end-1])=cont_fem_alphatheta; % cont
inpi(1:size(cont_fem_alphatheta,1),end)=1; % cont


inpi(size(cont_fem_alphatheta,1)+1:end,[2:end-1])=dis_fem_alphatheta; % dis 
inpi(size(cont_fem_alphatheta,1)+1:end,end)=-1; % dis 

