clear all
clc

% load('mpc_all_cont_half2_21.mat')
% load('mpc_all_dis_half2_22.mat')
% 
% load('mpc_all_dis_22.mat')
% load('mpc_all_cont_21.mat')

load('mpc_dis_dataset1_inter.mat')
load('mpc_cont_dataset1_inter.mat')

load('mpc_cont_dataset2_inter.mat')
load('mpc_dis_dataset2_inter.mat')

%averaged data . 
 load('mpc_dis_dataset2_avg.mat')
load('mpc_cont_dataset2_avg.mat')

load('gender_dis.mat')
load('gender_cont.mat')
% load('mpc_all_dis_new_dataset.mat')
% load('mpc_all_cont_new_dataset.mat')
% 
% %% merge 
% 
% % cont
% for i=1:5
%     mpc1=mpc_cont_dataset1_inter{1,i};
%     mpc2= mpc_cont_dataset2_inter{1,i};
%     mpc_merge_cont=[mpc1;mpc2];
%      mpc_merge_cont_all{1,i}=mpc_merge_cont;
% end
% 
% 
% for i=1:5
%     mpc1=mpc_dis_dataset1_inter{1,i};
%     mpc2= mpc_dis_dataset2_inter{1,i};
%     mpc_merge_dis=[mpc1;mpc2];
%      mpc_merge_dis_all{1,i}=mpc_merge_dis;
% end

%%
% choose data
% merge
% mpc_all_cont=mpc_cont_dataset2_avg;
% mpc_all_dis= mpc_dis_dataset2_avg;

% mpc_all_cont=mpc_all_cont_new_dataset;
% mpc_all_dis= mpc_all_dis_new_dataset;
%% interpolate 
mpc_all_cont=mpc_cont_dataset2_inter;
mpc_all_dis= mpc_dis_dataset2_inter;

%% gender 

% dataset1 
% mpc_all_cont= mpc_cont_dataset1_inter;
% mpc_all_dis= mpc_dis_dataset1_inter;
% dataset2
%  mpc_all_cont= mpc_cont_dataset1_inter;
% mpc_all_dis= mpc_dis_dataset1_inter;




no_chan=7;
no_sub_cont=size(mpc_all_cont{1,1},1);
no_sub_dis=size(mpc_all_dis{1,1},1);

% cont 
ind_f_cont=find(gender_cont==0);
ind_m_cont=find(gender_cont==1);
% dis 
ind_f_dis=find(gender_dis==0);
ind_m_dis=find(gender_dis==1);


% delta
p_connect=zeros(no_chan,no_chan);
  p_bands_connect=cell(5,1);
  

for mm=1:5

for i=1:size(ind_f_cont,1)
    elem=ind_f_cont(i);
delta=mpc_all_cont{1,mm}{elem,1};
delta_cont{i,1}=delta;
end

for i=1:size(ind_f_dis,1)
    elem=ind_f_dis(i);
delta=mpc_all_dis{1,mm}{elem,1};
delta_dis{i,1}=delta;
end


for i=1:no_chan
    for j=1:no_chan
        
        % cont 
        for k=1:size(ind_f_cont)
            a1=delta_cont{k,1};
            b1=a1(i,j);
            c1_all(k,1)=b1;
        end
       
         % dis 
        for k=1:size(ind_f_dis)
            a2=delta_dis{k,1};
            b2=a2(i,j);
            c2_all(k,1)=b2;
        end
        
            
pval=ranksum(c1_all,c2_all);
pval=sign(median(c2_all)-median(c1_all))*pval;
p_connect(i,j)=pval;

    end

end
  p_bands_connect{mm,1}=p_connect;
end





% if dis is greater pval is negative and its blue 
% %% topo plot 
% threshold=0.05;
% subplot(2,3,1)
% inp=p_bands_connect{1,1};
% CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,threshold,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
% title('Delta','fontsize',25);
% 
% subplot(2,3,2)
% inp=p_bands_connect{2,1};
% CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,threshold,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
% title('Theta','fontsize',25);
% 
% subplot(2,3,3)
% inp=p_bands_connect{3,1};
% CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,threshold,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
% title('Alpha','fontsize',25);
% 
% subplot(2,3,4)
% inp=p_bands_connect{4,1};
% CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,threshold,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
% title('Beta','fontsize',25);
% 
% subplot(2,3,5)
% inp=p_bands_connect{5,1};
% CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,0.05,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
% title('Gamma','fontsize',25);

figure 
threshold=0.05;
subplot(1,2,1)
inp=p_bands_connect{2,1};
CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,threshold,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
title('\theta band','fontsize',36);

subplot(1,2,2)
inp=p_bands_connect{3,1};
CoH_matrix=eeg_connectivity_map_da_pvalue_con_segno_new(inp,threshold,ones(1,no_chan),'inter.locs','style','straight','electrodes','labelpoint');
title('\alpha band','fontsize',36);