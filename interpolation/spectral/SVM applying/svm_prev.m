
% inp=[X_train;X_test];
% inp(:,8)=[y_train;y_test];


% inp=dataset_hrveda(:,[2:end]);
% clear all
% clc
close all

%  load('dataset_deap_tonicphasic')
addpath('/Users/shadi/Desktop/PhD_projects/phd_first_year/CODES/libsvm-3.22/matlab')

inp= inpi;
all_sesp=cell(1,10);
maxacc_all=cell(1,10);
%     support_n=zeros(size(inp,1)-2,size(inp,2)/2);

     for i=1:10
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
% [C_sel,Acc_feat_sel,maxacc,Features,rank4subj,modello,sesp,bestfeat,All_predicted]=svm_RFE_LOSO_me(inp,1,[],kerOpt);
    all_sesp{1,i}=sesp;
    maxacc_all{1,i}=maxacc;
    
%          modello(nfea).feat(ii).svmmodel=SVMmodel;
%      featureselect(i).feat=bestfeat;

     end
    showing=[cell2mat(maxacc_all);cell2mat(all_sesp)]

   
    

%     for i=1:size(inp,1)-2
%         for j=1:size(inp,2)/2
%    support_n(i,j)=modello(i).feat(i).svmmodel.totalSV;
%         end
%     end
%    fin=min(support_n);
   
   % Scoring features 
   
% %  mige masalan rank4sub=1 (yani feature shomare 1) har bar too che sotuni gharar gerefte (yani dar che rankingi gharar gerefte) 
% %  
% %    sizi=size(rank4subj,2);
% %    scorefeat=zeros(sizi,1);
% %    kiop=cell(1,sizi);
% % for i=1:sizi
% % [r,c]=find(rank4subj==i);
% % kiop{1,i}=c;
% % scorefeat(i)=sum(c);
% % end
% % 
% % [v,w]=sort(scorefeat);
% % 
% % dd=w'
% % for i=1:52
% % g{i}=SVMmodel{i, 1}.totalSV;
% % end