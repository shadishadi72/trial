
function [C_sel,Acc_feat_sel,maxacc,Features,rank4subj,modello,sesp,bestfeat,All_predicted]=svm_RFE_LOSO(Dataset_Features,figflag,varargin)%,s,t)
addpath('/Users/shadi/Documents/phd/CODES/libsvm-3.22/matlab')
%UN ESEMPIO DI CALL DELLA FUNZIONE
% [C_sel,Acc_feat_sel,maxacc,Features]=svm_RFE(Dataset_Features,cellnames,)%,s,t)
% cellnames=cell-arrey con le

% options:
% -s svm_type : set type of SVM (default 0)
% 	0 -- C-SVC
% 	1 -- nu-SVC
% 	2 -- one-class SVM
% 	3 -- epsilon-SVR
% 	4 -- nu-SVR
% -t kernel_type : set type of kernel function (default 2)
% 	0 -- linear: u'*v
% 	1 -- polynomial: (gamma*u'*v + coef0)^degree
% 	2 -- radial basis function: exp(-gamma*|u-v|^2)
% 	3 -- sigmoid: tanh(gamma*u'*v + coef0)
% -d degree : set degree in kernel function (default 3)
% -g gamma : set gamma in kernel function (default 1/num_features)
% -r coef0 : set coef0 in kernel function (default 0)
% -c cost : set the parameter C of C-SVC, epsilon-SVR, and nu-SVR (default 1)
% -n nu : set the parameter nu of nu-SVC, one-class SVM, and nu-SVR (default 0.5)
% -p epsilon : set the epsilon in loss function of epsilon-SVR (default 0.1)
% -m cachesize : set cache memory size in MB (default 100)
% -e epsilon : set tolerance of termination criterion (default 0.001)
% -h shrinking: whether to use the shrinking heuristics, 0 or 1 (default 1)
% -b probability_estimates: whether to train a SVC or SVR model for probability estimates, 0 or 1 (default 0)
% -wi weight: set the parameter C of class i to weight*C, for C-SVC (default 1)
%
% The k in the -g option means the number of attributes in the input data.
% Examples of options: -s 0 -c 10 -t 1 -g 1 -r 1 -d 3


if ~isempty(varargin)
    if ~isempty(varargin{1})
        featcomplete=varargin{1};
    end
end
ftRank_ALL=[];
ftRank_ALLrank=[];
All_predicted=[];
All_labels=[];
class_score=0;
[~,~,Dataset_Features(:,1)]=unique(Dataset_Features(:,1));
subj=Dataset_Features(:,1);
Dataset_Features(:,1)=[];

if ~isempty(varargin) & length(varargin)>1
    kerOpt=varargin{2};
else
    SVMtype = 1; % SVM type, see libsvm. C-SVM: 0; nu-SVM: 1
    kerType = 2; % kernel type, see libsvm. linear: 0; rbf:2
    rfeC = 1; % parameter C in SVM training
    rfeG = 2^-6; % parameter g in SVM training
    rfeN = 2^-1; % parameter nu in SVM training
    kerOpt.S = SVMtype;
    kerOpt.C = rfeC;
    kerOpt.g = rfeG;
    kerOpt.N = rfeN;
    kerOpt.type = kerType;
    
end
% %
% % for ii=1:max(subj)
% %     ix=find(subj==ii);
% %     testSet=Dataset_Features(ix,:);
% %     trainingSet=Dataset_Features;
% %     trainingSet(ix,:)=[];
% %     %statistics
% %     for i=1:size(trainingSet,2)-1
% %         [pDIS(i),HDIS(i)]=ranksum(trainingSet(trainingSet(:,end)==1,i),trainingSet(trainingSet(:,end)==2,i));%1 controlli %2 disforici
% %     end
% % %     [p_DIS(:,1),rankix] = sort(pDIS);
% % %     trainingSet=trainingSet(:,[rankix(1:end-kk),end]);
% % %     testSet=testSet(:,[rankix(1:end-kk),end]);
% %
% %     % norm Z
% %     [trainingSet_Z,mu,sigma] = my_zscore(trainingSet(:,1:end-1));
% % %     [ftRank,ftScore,type] = myftSel_SVMRFECBR(trainingSet_Z,trainingSet(:,end),kerOpt,pDIS);
% % try
% %     [ftRank,ftScore,type] = ftSel_SVMRFECBR(trainingSet_Z,trainingSet(:,end),kerOpt);
% % catch
% %     kerOpt.S = 0;
% %     [ftRank,ftScore,type] = ftSel_SVMRFECBR(trainingSet_Z,trainingSet(:,end),kerOpt);
% %
% % end
% %     %  Labels{ftRank}
% %     [Y,I] = sort(ftRank);
% %     ftRank_ALLrank(end+1,:)=I;
% %     ftRank_ALL(end+1,:)=ftRank;
% %
% % %     type = sprintf('-s %d -t %d -c %f -g %f -q',kerOpt.S,kerOpt.type,kerOpt.C,kerOpt.g);
% % %     SVMmodel = svmtrain(trainingSet(:,end), trainingSet_Z, type);
% % %     [predicted_label_,accuracy_, decision_values] =svmpredict(testSet(:,end),(testSet(:,1:end-1)-mu)./sigma, SVMmodel);
% % %     if (predicted_label_ - testSet(:,end) ==0)
% % %         class_score=class_score+1;
% % %     end
% % %     All_predicted(end+1)=predicted_label_;
% % %     All_labels(end+1)=testSet(:,end);
% % end



% for i=1:length(featcomplete)
%     featcomplete1{i}=featcomplete{I(i)};
% end
% for ii=1:size(ftRank_ALL)
%     if length(unique(ftRank_ALL(ii,:)))  ~= 24
%         error('aa')
%     end
% end
%
% varHR mad 10
%varHR mrdian 12
% I([10,12])=[];
% Labels{I}
%
% % % % % % % testSet=Dataset_Features;
% % % % % % % trainingSet=Dataset_Features;
% % % % % % % % norm Z
% % % % % % % [trainingSet_Z,mu,sigma] = my_zscore(trainingSet(:,1:end-1));
% % % % % % % try
% % % % % % %     [ftRank,ftScore,type] = ftSel_SVMRFECBR(trainingSet_Z,trainingSet(:,end),kerOpt);
% % % % % % % catch
% % % % % % %     kerOpt.S = 0;
% % % % % % %     [ftRank,ftScore,type] = ftSel_SVMRFECBR(trainingSet_Z,trainingSet(:,end),kerOpt);
% % % % % % % end
% % % % % % % I = ftRank;
% % % % % % % 
% % % % % % % sortedfFeat=[];
% % % % % % % if isempty(varargin)
% % % % % % %     
% % % % % % %     for k=1:length(I)
% % % % % % %         sortedfFeat{k,1}=num2str(I(k));
% % % % % % %     end
% % % % % % %     
% % % % % % % elseif isempty(varargin{1})
% % % % % % %     for k=1:length(I)
% % % % % % %         sortedfFeat{k,1}=num2str(I(k));
% % % % % % %     end
% % % % % % % else
% % % % % % %     for k=1:length(I)
% % % % % % %         sortedfFeat{k,1}=featcomplete{I(k)};
% % % % % % %     end
% % % % % % % end

%median(ftRank_ALLrank) + i*mad(ftRank_ALLrank,1)
Acc_feat_sel=[];
All_predicted=zeros(size(Dataset_Features,1),size(Dataset_Features,2)-1);
All_labels=zeros(size(Dataset_Features,1),size(Dataset_Features,2)-1);
rank4subj=zeros(size(Dataset_Features,1)/max(subj),size(Dataset_Features,2)-1);

for ii=1:max(subj)
    ix=find(subj==ii);
    %         testSet=Dataset_Features(ix,:);
    %         trainingSet=Dataset_Features;
    trainingSet=Dataset_Features;
    testSet=trainingSet(ix,:);
    trainingSet(ix,:)=[];
    %     for ii=1:size(Dataset_Features,1)
    %         testSet=Dataset_Features(ii,:);
    %         trainingSet=Dataset_Features;
    %         trainingSet(ii,:)=[];
    
    % norm Z
    [trainingSet_Z,mu,sigma] = my_zscore(trainingSet(:,1:end-1));
    %      [a b]=find(abs(trainingSet_Z)>10);
    %     for kk=1:length(a)
    %      trainingSet_Z(a(kk),b(kk))=nanmedian(trainingSet_Z(:,b(kk)));
    %     end
    %       %trainingSet(a,:)=[];
    [ftRank,ftScore,type] = ftSel_SVMRFECBR(trainingSet_Z,trainingSet(:,end),kerOpt);
    I = ftRank;
    rank4subj(ii,:)=ftRank;
    sortedfFeat=[];
    if isempty(varargin)

        for k=1:length(I)
            sortedfFeat{k,1}=num2str(I(k));
        end

    elseif isempty(varargin{1})
        for k=1:length(I)
            sortedfFeat{k,1}=num2str(I(k));
        end
    else
        for k=1:length(I)
            sortedfFeat{k,1}=featcomplete{I(k)};
        end
    end
    for nfea=1:length(I)
        
%         All_predicted=[];
%         All_labels=[];
        class_score=0;
        trainingSet1=trainingSet(:,[I(1:nfea),end]);
        
        type = sprintf('-s %d -t %d -c %f -g %f -q',kerOpt.S,kerOpt.type,kerOpt.C,kerOpt.g);
        %         SVMmodel = svmtrain(trainingSet(:,end), trainingSet_Z(:,I(1:nfea)), type); %-c 0.1
        SVMmodel = svmtrain(trainingSet1(:,end), trainingSet_Z(:,I(1:nfea)), type); %-c 0.1
        modello(nfea).feat(ii).svmmodel=SVMmodel;
        %fprintf('%d \n',I(1:nfea)')
        %  SVMmodel = svmtrain2(trainingSet(:,end), trainingSet_Z, '-s1 -t2 -q');
        % SVMmodel = svmtrain2(trainingSet(:,end), trainingSet_Z, '-s0 -c 1 -t 2 ');
        
        %% test
        %         mu2=repmat(mu(I(1:nfea)),size(testSet(:,1:end-1),1),1);
        %         sigma2=repmat(sigma(I(1:nfea)),size(testSet(:,1:end-1),1),1);
        %         [predicted_label_,accuracy_, decision_values] =svmpredict(testSet(:,end),(testSet(:,I(1:nfea))-mu2)./sigma2, SVMmodel);
        [~,mu,sigma] = my_zscore(trainingSet(:,I(1:nfea)));
        mu2=repmat(mu,size(testSet(:,I(1:nfea)),1),1);
        sigma2=repmat(sigma,size(testSet(:,I(1:nfea)),1),1);
        [predicted_label_,accuracy_, decision_values] =svmpredict(testSet(:,end),(testSet(:,I(1:nfea))-mu2)./sigma2, SVMmodel);
        
        %             [predicted_label_,~, decision_values] =predict(testSet(:,end),sparse((testSet(:,1:end-1)-mu2)./sigma2), SVMmodel,'-q');
        
        for k=1:length(ix)
            if(predicted_label_(k) - testSet(k,end) ==0)
                class_score=class_score+1;
            end
        end
        All_predicted((ii-1)*length(ix)+1:ii*length(ix),nfea)=predicted_label_;
        All_labels((ii-1)*length(ix)+1:ii*length(ix),nfea)=testSet(:,end);
    end
    
    
end


%%accuracy
for nfea=1:length(I) 
C=confusionmat(All_labels(:,nfea),All_predicted(:,nfea));
    C=100*C./repmat(sum(C,2),1,size(C,2));
    class_tot=100*class_score/size(Dataset_Features,1);
    Features(nfea).rank=I(1:nfea);
    ACC=mean(diag(C));
    C_sel(nfea).Conf=C;
    Acc_feat_sel(end+1)=ACC; %oppure class_tot (numero di label giuste) a seconda di come si intende l'accuratezza
    %     Acc_feat_sel(end+1)=class_tot;
end
[maxacc,Imaxacc]=max(Acc_feat_sel);

sesp=diag(C_sel(Imaxacc).Conf);

bestfeat=[];
for i=1:Imaxacc
    bestfeat1=sortedfFeat{i};
    bestfeat=[bestfeat,bestfeat1,', '];
end

Imaxacc2=find(Acc_feat_sel==maxacc);
maxacc2=repmat(maxacc,length(Imaxacc2),1);
scrsz=get(0,'ScreenSize');
if figflag
    figure('Position',[1 scrsz(4)/1.2 scrsz(3)/1.2 scrsz(4)/1.8])
    plot(Acc_feat_sel,'-o'),xlabel('feat cycle'),ylabel('Accuracy %'),title({['Maximum accuracy: ',num2str(maxacc,4)];bestfeat},'Fontsize',10)
    hold on, plot(Imaxacc2,maxacc2,'r*','Markersize',10)
end


