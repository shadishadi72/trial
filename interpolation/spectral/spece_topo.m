clear all
clc


load('all_dis_inter_dataset2.mat')
load('all_cont_inter_dataset2.mat')
load('all_dis_inter.mat')
load('all_cont_inter.mat')

 load('gender_cont.mat')
load('gender_dis.mat')
% all_cont=[all_cont_inter_dataset2;all_cont_inter];
% all_dis=[all_dis_inter_dataset2;all_dis_inter];


all_cont=[all_cont_inter_dataset2];
all_dis=[all_dis_inter_dataset2];

% gender 

% cont 
ind_f_cont=find(gender_cont==0);
ind_m_cont=find(gender_cont==1);
% dis 
ind_f_dis=find(gender_dis==0);
ind_m_dis=find(gender_dis==1);

%%%%% cont %%% 
for i=1:size(ind_f_cont)
cont_fem=all_cont_inter_dataset2(ind_f_cont(i)); 
cont_fem=cont_fem{1,1};
cont_fem_alpha=cell2mat(cont_fem(:,2))';
cont_fem_theta=cell2mat(cont_fem(:,3))';

cont_fem_alpha_all{i,1}=cont_fem_alpha; 
cont_fem_theta_all{i,1}=cont_fem_theta; 
end
cont_fem_theta_all=cell2mat(cont_fem_theta_all);
cont_fem_theta_all_avg=median(cont_fem_theta_all,1);

cont_fem_alpha_all=cell2mat(cont_fem_alpha_all);
cont_fem_alpha_all_avg=median(cont_fem_alpha_all,1);



%%%%% dis %%% 
for i=1:size(ind_f_dis)
dis_fem=all_dis_inter_dataset2(ind_f_dis(i)); 
dis_fem=dis_fem{1,1};
dis_fem_alpha=cell2mat(dis_fem(:,2))';
dis_fem_theta=cell2mat(dis_fem(:,3))';

dis_fem_alpha_all{i,1}=dis_fem_alpha; 
dis_fem_theta_all{i,1}=dis_fem_theta; 
end
dis_fem_theta_all=cell2mat(dis_fem_theta_all);
dis_fem_theta_all_avg=median(dis_fem_theta_all,1);

dis_fem_alpha_all=cell2mat(dis_fem_alpha_all);
dis_fem_alpha_all_avg=median(dis_fem_alpha_all,1);



 % for theta and alpha 
%   figure
set(0,'defaultTextInterpreter','latex')

 
 subplot(2,2,1)
  topoplot(cont_fem_theta_all_avg, 'inter.locs','style','both','conv','on');
%   title('\theta band (cont)')
 colormap jet
 colorbar
      lim = caxis;
  caxis([0 11])
  c = colorbar;
c.FontSize = 20;
 
 
  subplot(2,2,2)
  topoplot(cont_fem_alpha_all_avg, 'inter.locs','style','both','conv','on');
%   title('\alpha band (cont)')
  colorbar
     lim = caxis;
  caxis([0 5])
  c = colorbar;
c.FontSize = 20;
  
  
   subplot(2,2,3)
    topoplot(dis_fem_theta_all_avg, 'inter.locs','style','both','conv','on');
%   title('\theta band (dis)')
 colormap jet
 colorbar
   lim = caxis;
  caxis([0 11])
  c = colorbar;
c.FontSize = 20;

 
 
  subplot(2,2,4)
  topoplot(dis_fem_alpha_all_avg, 'inter.locs','style','both','conv','on');
%   title('\alpha band (dis)') 
  colorbar
  lim = caxis;
  caxis([0 5])
  c = colorbar;
c.FontSize = 20;

% hp4 = get(subplot(2,2,4),'Position');
% colorbar('Position')

% colorbar('Position', [hp4(1)+hp4(3)+0.01  hp4(2)  0.1  hp4(2)+hp4(3)*2.1])
  
  

%   figure
% set(0,'defaultTextInterpreter','latex')
%  h = heatmap(xvalues,yvalues,feature_importance_all_med_norm);
%  h.CellLabelColor='none';
%  h.FontSize=32;
%  axs = struct(gca); %ignore warning that this should be avoid
% cb = axs.Colorbar;
% cb.Label.String = 'Interpretability metric \Phi';
% cbar.Label.Interpreter = 'latex';
% cb.TickLabelInterpreter = 'latex';
% 
% h.Colormap = coolwarm;
% 
% % h.XLabel = 'Patches of data';
% % h.XLabel = 'Patches of data';
% 
%  h.YLabel = 'Subject Index';
%  h.XLabel= 'Patch(s)';

  
  
  
 
 
%   colorbar('Ticks',[-5,-2,1,4,7],...
%           'TickLabels',{'Cold','Cool','Neutral','Warm','Hot'})

 % read a channel locations file and plot a map
% 
%  figure 
%   topoplot(pval, 'Standard-10-20-Cap19_my.locs','style','both','conv','off'); % read a channel locations file and plot a map
% 
%   
%   figure
%  figure; topoplot([],'Standard-10-20-Cap19_my.locs','style','blank','electrodes','labelpoint');


% csvwrite('pval_all.csv',pval_all,5,19);
