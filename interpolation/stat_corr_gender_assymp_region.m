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





%% alpha assymp (anterior regeion) (1,2) (11,12) (3,4) 
%% control 
for i=1:size(ind_f_cont)
    
%% anterior     
arightcont_ant1=all_cont{ind_f_cont(i), 1}{1, 3} ; 
aleftcont_ant1=all_cont{ind_f_cont(i), 1}{2, 3} ;
assymcont_ant1=arightcont_ant1/aleftcont_ant1; 

arightcont_ant2=all_cont{ind_f_cont(i), 1}{11, 3} ; 
aleftcont_ant2=all_cont{ind_f_cont(i), 1}{12, 3} ;
assymcont_ant2=arightcont_ant2/aleftcont_ant2; 

    
arightcont_ant3=all_cont{ind_f_cont(i), 1}{3, 3} ; 
aleftcont_ant3=all_cont{ind_f_cont(i), 1}{4, 3} ;
assymcont_ant3=arightcont_ant3/aleftcont_ant3; 
assympcont_avgant(i,1)=(assymcont_ant1+assymcont_ant2+assymcont_ant3)/3;
%% posterior 

arightcont_post1=all_cont{ind_f_cont(i), 1}{7, 3} ; 
aleftcont_post1=all_cont{ind_f_cont(i), 1}{8, 3} ;
assymcont_post1=arightcont_post1/aleftcont_post1; 

arightcont_post2=all_cont{ind_f_cont(i), 1}{15, 3} ; 
aleftcont_post2=all_cont{ind_f_cont(i), 1}{16, 3} ;
assymcont_post2=arightcont_post2/aleftcont_post2; 

    
arightcont_post3=all_cont{ind_f_cont(i), 1}{9, 3} ; 
aleftcont_post3=all_cont{ind_f_cont(i), 1}{10, 3} ;
assymcont_post3=arightcont_post3/aleftcont_post3; 
assympcont_avgpost(i,1)=(assymcont_post1+assymcont_post2+assymcont_post3)/3;


end 

%% disforia
for i=1:size(ind_f_dis)
    
%% anterior     
arightdis_ant1=all_dis{ind_f_dis(i), 1}{1, 3} ; 
aleftdis_ant1=all_dis{ind_f_dis(i), 1}{2, 3} ;
assymdis_ant1=arightdis_ant1/aleftdis_ant1; 

arightdis_ant2=all_dis{ind_f_dis(i), 1}{11, 3} ; 
aleftdis_ant2=all_dis{ind_f_dis(i), 1}{12, 3} ;
assymdis_ant2=arightdis_ant2/aleftdis_ant2; 

    
arightdis_ant3=all_dis{ind_f_dis(i), 1}{3, 3} ; 
aleftdis_ant3=all_dis{ind_f_dis(i), 1}{4, 3} ;
assymdis_ant3=arightdis_ant3/aleftdis_ant3; 
assympdis_avgant(i,1)=(assymdis_ant1+assymdis_ant2+assymdis_ant3)/3;
%% posterior 

arightdis_post1=all_dis{ind_f_dis(i), 1}{7, 3} ; 
aleftdis_post1=all_dis{ind_f_dis(i), 1}{8, 3} ;
assymdis_post1=arightdis_post1/aleftdis_post1; 

arightdis_post2=all_dis{ind_f_dis(i), 1}{15, 3} ; 
aleftdis_post2=all_dis{ind_f_dis(i), 1}{16, 3} ;
assymdis_post2=arightdis_post2/aleftdis_post2; 

    
arightdis_post3=all_dis{ind_f_dis(i), 1}{9, 3} ; 
aleftdis_post3=all_dis{ind_f_dis(i), 1}{10, 3} ;
assymdis_post3=arightdis_post3/aleftdis_post3; 
assympdis_avgpost(i,1)=(assymdis_post1+assymdis_post2+assymdis_post3)/3;


end 

% stats two groups 
asymstat=ranksum(assympcont_avgant,assympdis_avgant)
asymstat=ranksum(assympcont_avgpost,assympdis_avgpost)


asymstat=ranksum(abs(assympcont_avgant),abs(assympdis_avgant))
asymstat=ranksum(abs(assympcont_avgpost),abs(assympdis_avgpost))

% assymp & BDI (region)
% 
all_sub_ant=[assympcont_avgant;assympdis_avgant];
all_sub_post=[assympcont_avgpost;assympdis_avgpost];

all_BDI=[BDI_cont;BDI_dis];
% 
% 
% 
% 
% 
% 
%  cor ( alphassym & BDI) 

  [ro,pval]=corr(all_sub_ant,all_BDI,'type','Spearman')
    [ro,pval]=corr(abs(all_sub_ant),all_BDI,'type','Spearman')
    
      [ro,pval]=corr(all_sub_post,all_BDI,'type','Spearman')
    [ro,pval]=corr(abs(all_sub_post),all_BDI,'type','Spearman')

% 
% 
% 