 %% control 
clear all 
clc
close all
load('mpc_dis_dataset2_inter.mat')
load('mpc_cont_dataset2_inter.mat')
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

mpc_cont_dataset2_inter_theta=mpc_cont_dataset2_inter{1,2};
mpc_cont_dataset2_inter_alpha=mpc_cont_dataset2_inter{1,3};

mpc_dis_dataset2_inter_theta=mpc_dis_dataset2_inter{1,2};
mpc_dis_dataset2_inter_alpha=mpc_dis_dataset2_inter{1,3};

%% control 
for i=1:size(ind_f_cont)
    
      
 % alpha   
cont_fem_alpha=mpc_cont_dataset2_inter_alpha{ind_f_cont(i)}; 
cont_fem_alpha=triu(cont_fem_alpha);
cont_fem_alpha=cont_fem_alpha(:);
cont_fem_alpha=cont_fem_alpha(find(cont_fem_alpha));
yek=find(cont_fem_alpha==1);
cont_fem_alpha(yek)=[];
cont_fem_alpha_all{i,1}=cont_fem_alpha; 


 % theta   
cont_fem_theta=mpc_cont_dataset2_inter_theta{ind_f_cont(i)}; 
cont_fem_theta=triu(cont_fem_theta);
cont_fem_theta=cont_fem_theta(:);
cont_fem_theta=cont_fem_theta(find(cont_fem_theta));
yek=find(cont_fem_theta==1);
cont_fem_theta(yek)=[];
cont_fem_theta_all{i,1}=cont_fem_theta; 


end

cont_fem_alpha_all=cell2mat(cont_fem_alpha_all')';
cont_fem_theta_all=cell2mat(cont_fem_theta_all')';

cont_fem_alphatheta=[cont_fem_theta_all,cont_fem_alpha_all];



%% disforia 
for i=1:size(ind_f_dis)
    
      
 % alpha   
dis_fem_alpha=mpc_dis_dataset2_inter_alpha{ind_f_dis(i)}; 
dis_fem_alpha=triu(dis_fem_alpha);
dis_fem_alpha=dis_fem_alpha(:);
dis_fem_alpha=dis_fem_alpha(find(dis_fem_alpha));
yek=find(dis_fem_alpha==1);
dis_fem_alpha(yek)=[];
dis_fem_alpha_all{i,1}=dis_fem_alpha; 


 % theta   
dis_fem_theta=mpc_dis_dataset2_inter_theta{ind_f_dis(i)}; 
dis_fem_theta=triu(dis_fem_theta);
dis_fem_theta=dis_fem_theta(:);
dis_fem_theta=dis_fem_theta(find(dis_fem_theta));
yek=find(dis_fem_theta==1);
dis_fem_theta(yek)=[];
dis_fem_theta_all{i,1}=dis_fem_theta; 


end

dis_fem_alpha_all=cell2mat(dis_fem_alpha_all')';
dis_fem_theta_all=cell2mat(dis_fem_theta_all')';

dis_fem_alphatheta=[dis_fem_theta_all,dis_fem_alpha_all];







                 %%% significant connectivity values%%% 
 %% control 
for i=1:size(ind_f_cont)
    
     
 % alpha   
cont_fem_alpha=mpc_cont_dataset2_inter_alpha{ind_f_cont(i)};   
cont_fem_alpha_sig=[cont_fem_alpha(1,2),cont_fem_alpha(1,5),cont_fem_alpha(2,7),...
 cont_fem_alpha(2,6),cont_fem_alpha(2,4), cont_fem_alpha(7,6)];
 cont_fem_alpha_sig_all{i,1}=cont_fem_alpha_sig; 
 
 
 
  % theta   
cont_fem_theta=mpc_cont_dataset2_inter_theta{ind_f_cont(i)};   
cont_fem_theta_sig=[cont_fem_theta(2,7),cont_fem_theta(4,5)];
 cont_fem_theta_sig_all{i,1}=cont_fem_theta_sig; 
 
end
       
 cont_fem_alpha_sig_all=cell2mat( cont_fem_alpha_sig_all);
 cont_fem_theta_sig_all=cell2mat( cont_fem_theta_sig_all);
           
  cont_fem_alphatheta_sig=[cont_fem_theta_sig_all,cont_fem_alpha_sig_all];
            
 %% disforia 
for i=1:size(ind_f_dis)
    
     
 % alpha   
dis_fem_alpha=mpc_dis_dataset2_inter_alpha{ind_f_dis(i)};   
dis_fem_alpha_sig=[dis_fem_alpha(1,2),dis_fem_alpha(1,5),dis_fem_alpha(2,7),...
 dis_fem_alpha(2,6),dis_fem_alpha(2,4), dis_fem_alpha(7,6)];
 dis_fem_alpha_sig_all{i,1}=dis_fem_alpha_sig; 
 
 
 
  % theta   
dis_fem_theta=mpc_dis_dataset2_inter_theta{ind_f_dis(i)};   
dis_fem_theta_sig=[dis_fem_theta(2,7),dis_fem_theta(4,5)];
 dis_fem_theta_sig_all{i,1}=dis_fem_theta_sig; 
 
end
       
 dis_fem_alpha_sig_all=cell2mat( dis_fem_alpha_sig_all);
 dis_fem_theta_sig_all=cell2mat( dis_fem_theta_sig_all);
 
 dis_fem_alphatheta_sig=[dis_fem_theta_sig_all,dis_fem_alpha_sig_all];

 
 
 
             %%%% PCA %%%% 
rmpath('/Users/shadi/Documents/EEG/EEGlab')
rmpath('/Users/shadi/Documents/EEG/eeglab plugins')
rmpath('/Users/shadi/Documents/EEG/fieldtrip-20171231')




% % % pca remove the eeglab path before running the pca 
% inp_pca_connect_theta=[cont_fem_theta_all;dis_fem_theta_all];
% [coeff_connect_theta,score_connect_theta,latent_connect,tsquared,explained_connect]=pca(inp_pca_connect_theta); % no_sub * no_feat


% % pca remove the eeglab path before running the pca 
% inp_pca_connect_alpha=[cont_fem_alpha_all;dis_fem_alpha_all];
% [coeff_connect_alpha,score_connect_alpha,latent_connect,tsquared,explained_connect]=pca(inp_pca_connect_alpha); % no_sub * no_feat

% result : 
% for alpha: 1:6 compoenents 
% for thea: 1:7 compoenents 
                      %% creating input 
            % choose pca components 
% theta 
% cont_fin=score_connect_theta([1:size(cont_fem_theta_all,1)],[1:6]);
% dis_fin=score_connect_theta([size(cont_fem_theta_all,1)+1:end],[1:6]);

% % alpha 
% cont_fin=score_connect_alpha([1:size(cont_fem_alpha_all,1)],[1:6]);
% dis_fin=score_connect_alpha([size(cont_fem_alpha_all,1)+1:end],[1:6]);


% % pca alpha and theta 
% cont_fin_alpha=score_connect_alpha([1:size(cont_fem_alpha_all,1)],[1:6]);
% dis_fin_alpha=score_connect_alpha([size(cont_fem_alpha_all,1)+1:end],[1:6]);
% 
% cont_fin_theta=score_connect_theta([1:size(cont_fem_theta_all,1)],[1:6]);
% dis_fin_theta=score_connect_theta([size(cont_fem_theta_all,1)+1:end],[1:6]);
% cont_fin=[cont_fin_alpha,cont_fin_theta];
% dis_fin=[dis_fin_alpha,dis_fin_theta];




%             % choose all features
% cont_fin=cont_fem_alpha_all;
% dis_fin=dis_fem_alpha_all;

% cont_fin=cont_fem_theta_all;
% dis_fin=dis_fem_theta_all;

cont_fin=cont_fem_alphatheta;
dis_fin=dis_fem_alphatheta;



    % choose signifcant connect 
% cont_fin=cont_fem_theta_sig_all;
% dis_fin=dis_fem_theta_sig_all;

% cont_fin=cont_fem_alpha_sig_all;
% dis_fin=dis_fem_alpha_sig_all;

% cont_fin=cont_fem_alphatheta_sig;
% dis_fin=dis_fem_alphatheta_sig;



inpi=zeros(size(cont_fin,1)+size(dis_fin,1),size(cont_fin,2)+2);


inpi(:,1)=[1:size(cont_fin,1)+size(dis_fin,1)];
inpi(1:size(cont_fin,1),[2:end-1])=cont_fin; % cont
inpi(1:size(cont_fin,1),end)=1; % cont


inpi(size(cont_fin,1)+1:end,[2:end-1])=dis_fin; % dis 
inpi(size(cont_fin,1)+1:end,end)=-1; % dis 




%%% SVM-RFE%% 


close all

%  load('dataset_deap_tonicphasic')
addpath('/Users/shadi/Desktop/PhD_projects/phd_first_year/CODES/libsvm-3.22/matlab')

inp= inpi;
all_sesp=cell(1,10);
maxacc_all=cell(1,10);
%     support_n=zeros(size(inp,1)-2,size(inp,2)/2);

     for i=3%1:10
   SVMtype = 1; % SVM type, see libsvm. C-SVM: 0; nu-SVM: 1
    kerType = 2; % kernel type, see libsvm. linear: 0; rbf:2
    rfeC = 1; % parameter C in SVM training
    rfeG = 2^-i; % parameter g in SVM training
    rfeN = 2^-1; % parameter nu in SVM training
    kerOpt.S = SVMtype;
    kerOpt.C = rfeC;
    kerOpt.g = rfeG;
    kerOpt.N = rfeN;
    kerOpt.type = kerType;
%     [C_sel,Acc_feat_sel,maxacc,Features,rank4subj,modello,sesp,bestfeat,All_predicted]=svm_RFE_LOSO(inp',0,[],kerOpt);
     [C_sel,Acc_feat_sel,maxacc,Features,all_models,sesp]=svm_RFE_shadi(inp,1,[],kerOpt);%,s,t)
%  [C_sel,Acc_feat_sel,maxacc,Features,rank4subj,modello,sesp,bestfeat,All_predicted]=svm_RFE_LOSO_me(inp,1,[],kerOpt);
    all_sesp{1,i}=sesp;
    maxacc_all{1,i}=maxacc;
    
        modello(nfea).feat(ii).svmmodel=SVMmodel;
%      featureselect(i).feat=bestfeat;

     end
    showing=[cell2mat(maxacc_all);cell2mat(all_sesp)]

