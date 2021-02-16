clear all
clc
close all
load('all_cont_new2.mat')
load('all_dis_new2.mat')

% interpolated 
% load('all_dis_inter_dataset2.mat')
% load('all_cont_inter_dataset2.mat')
%
load('BDI_dis.mat')
load('BDI_cont.mat')

load('gender_cont.mat')
load('gender_dis.mat')
% load('all_cont_welch_half1_bar2.mat')
% load('all_dis_welch_half1_bar2.mat')

% all_cont=all_cont([1:6],:);
% gender 

% cont 
ind_f_cont=find(gender_cont==0);
ind_m_cont=find(gender_cont==1);
% dis 
ind_f_dis=find(gender_dis==0);
ind_m_dis=find(gender_dis==1);

all_cont=all_cont_new2;
all_dis=all_dis_new2;

% all_cont=all_cont(ind_f_cont,:);
% all_dis=all_dis(ind_f_dis,:);
BDI_cont=BDI_cont(ind_f_cont,:);
BDI_dis=BDI_dis(ind_f_dis,:);





%% alpha assymp 
%% control 
for i=1:size(ind_f_cont)
arightcont=all_cont{ind_f_cont(i), 1}{15, 3} ; 
aleftcont=all_cont{ind_f_cont(i), 1}{16, 3} ;
assymcont(i,1)=arightcont-aleftcont; 
end 

%% disforia

for i=1:size(ind_f_dis)
arightdis=all_dis{ind_f_dis(i), 1}{15, 3} ; 
aleftdis=all_dis{ind_f_dis(i), 1}{16, 3} ;
assymdis(i,1)=arightdis-aleftdis; 
end 

% 
% assymp & BDI 

all_sub=[assymcont;assymdis];
all_BDI=[BDI_cont;BDI_dis];






%%  cor ( alphassym & BDI) 
  [ro,pval]=corr(all_sub,all_BDI,'type','Spearman')
    [ro,pval]=corr(abs(all_sub),all_BDI,'type','Spearman')

% 
% 
% 
% 
% 
% %% cor ( spectral and BDI) 
% 
% all_sub=[all_cont;all_dis];
% all_BDI=[BDI_cont;BDI_dis];
% % chan_no=29;
% chan_no=7;
% ro_all=cell(1,chan_no);
% pval_all=cell(1,chan_no);
% 
% vorod1=cell(1,size(all_sub,1));
% % 1
% for chan=1:chan_no
%     
%     %all subjects,channel loop, first band
%     for i=1:size(all_sub,1)
%         v1=all_sub{i,1}{chan,1};
%         vorod1{1,i}=v1;
%     end
%     %% apply corr
%     %[ro,pval]=corr(vorod1,BDI_cont,'Spearman');
%     [ro,pval]=corr(cell2mat(vorod1)',all_BDI,'type','Spearman');
%     
%     ro_all{1,chan}=ro;
%     pval_all{1,chan}=pval;  
% end
% pval1=cell2mat(pval_all);
% ro1=cell2mat(ro_all);
% 
% % 2
% for chan=1:chan_no
%     
%     %all subjects,channel loop, first band
%     for i=1:size(all_sub,1)
%         v1=all_sub{i,1}{chan,2};
%         vorod1{1,i}=v1;
%     end
%     %% apply corr
%     %[ro,pval]=corr(vorod1,BDI_cont,'Spearman');
%     [ro,pval]=corr(cell2mat(vorod1)',all_BDI,'type','Spearman');
%     
%     ro_all{1,chan}=ro;
%     pval_all{1,chan}=pval;  
% end
% pval2=cell2mat(pval_all);
% ro2=cell2mat(ro_all);
% % 3
% for chan=1:chan_no
%     
%     %all subjects,channel loop, first band
%     for i=1:size(all_sub,1)
%         v1=all_sub{i,1}{chan,3};
%         vorod1{1,i}=v1;
%     end
%     %% apply corr
%     %[ro,pval]=corr(vorod1,BDI_cont,'Spearman');
%     [ro,pval]=corr(cell2mat(vorod1)',all_BDI,'type','Spearman');
%     
%     ro_all{1,chan}=ro;
%     pval_all{1,chan}=pval;  
% end
% pval3=cell2mat(pval_all);
% ro3=cell2mat(ro_all);
% % 4
% for chan=1:chan_no
%     
%     %all subjects,channel loop, first band
%     for i=1:size(all_sub,1)
%         v1=all_sub{i,1}{chan,4};
%         vorod1{1,i}=v1;
%     end
%     %% apply corr
%     %[ro,pval]=corr(vorod1,BDI_cont,'Spearman');
%     [ro,pval]=corr(cell2mat(vorod1)',all_BDI,'type','Spearman');
%     
%     ro_all{1,chan}=ro;
%     pval_all{1,chan}=pval;  
% end
% pval4=cell2mat(pval_all);
% ro4=cell2mat(ro_all);
% 
% % 5
% 
% for chan=1:chan_no
%     
%     %all subjects,channel loop, first band
%     for i=1:size(all_sub,1)
%         v1=all_sub{i,1}{chan,5};
%         vorod1{1,i}=v1;
%     end
%     %% apply corr
%     %[ro,pval]=corr(vorod1,BDI_cont,'Spearman');
%     [ro,pval]=corr(cell2mat(vorod1)',all_BDI,'type','Spearman');
%     
%     ro_all{1,chan}=ro;
%     pval_all{1,chan}=pval;  
% end
% pval5=cell2mat(pval_all);
% ro5=cell2mat(ro_all);
% 
% pval_hame=single([pval1;pval2;pval3;pval4;pval5]');
% sig_pval_hame=find(pval_hame<0.05);
% ro_hame=single([ro1;ro2;ro3;ro4;ro5]');
% 
% 
% %1
% signvector=sign(pval1);
% pval1_b=(1./abs(pval1))-20;
% pval1_b(pval1_b<0)=0; % non significants(>0.05) are zero 
% pval1_b=pval1_b.*signvector;
% 
% %2
% signvector=sign(pval2);
% pval2_b=(1./abs(pval2))-20;
% pval2_b(pval2_b<0)=0;
% pval2_b=pval2_b.*signvector;
% 
% %3
% signvector=sign(pval3);
% pval3_b=(1./abs(pval3))-20;
% pval3_b(pval3_b<0)=0;
% pval3_b=pval3_b.*signvector;
% 
% %4
% signvector=sign(pval4);
% pval4_b=(1./abs(pval4))-20;
% pval4_b(pval4_b<0)=0;
% pval4_b=pval4_b.*signvector;
% 
% %5
% signvector=sign(pval1);
% pval5_b=(1./abs(pval5))-20;
% pval5_b(pval5_b<0)=0;
% pval5_b=pval5_b.*signvector;
% pval_all_b=single([pval1_b;pval2_b;pval3_b;pval4_b;pval5_b]');
% 
% 
% ro_hame=ro_hame(:,[2,3]);
% pval_all_b=pval_all_b(:,[2,3]);
% %% thresholds for Ro 
% a=min(min(ro_hame))
% b=max(max(ro_hame))
% c=max(abs(a),abs(b));
% lowro=-c;
% maxro=c;
% 
% 
% %% color map thresholds for pvals 
% lowp=0;
% [ff]=find(pval_all_b);
% maxp=max(pval_all_b(ff));
% if isempty(maxp)==1 
%     maxp=0.05;
% end
% maxp_convert=1/(maxp+20);
% 
% % middle num 
% mid=1/(maxp/2+20)
% mid=round(mid*1000)/1000
% 
% fin=1/(maxp+20)
% fin=round(fin*1000)/1000
% 
% 
% 
%      
%  figure
%  subplot(2,2,1)
%     topoplot(pval2_b, 'inter.locs','style','both','conv','on','maplimits',[-maxp, maxp]);
% colormap jet
% colorbar('Ticks',[0,maxp/2,maxp],...
%          'TickLabels',{'>0.05',num2str(mid),num2str(fin)})
% title('\theta band','fontsize',36)
% 
% 
%   subplot(2,2,2)
%   topoplot(pval3_b, 'inter.locs','style','both','conv','on','maplimits',[-maxp, maxp]);
%   colormap jet
% colorbar('Ticks',[0,maxp/2,maxp],...
%          'TickLabels',{'>0.05',num2str(mid),num2str(fin)})
%   title('\alpha band','fontsize',36) 
%   subplot(2,2,3)
%      topoplot(ro2, 'inter.locs','style','both','conv','on','maplimits',[lowro, maxro]);
% colormap jet
% colorbar
% title('\theta band','fontsize',36)
% 
%   subplot(2,2,4)
%      topoplot(ro3, 'inter.locs','style','both','conv','on','maplimits',[lowro, maxro]);
% colormap jet
% colorbar
% title('\alpha band','fontsize',36)
%  
