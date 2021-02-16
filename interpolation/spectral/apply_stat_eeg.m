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

% seperate females 
all_cont_fem=all_cont(ind_f_cont,:);
all_dis_fem=all_cont(ind_f_dis,:);

all_cont=all_cont_fem;
all_dis=all_dis_fem;




no_chan=7;
vv=cell(1,no_chan);
vorod1=cell(1,size(all_cont,1));
vorod2=cell(1,size(all_dis,1));

% 1
for chan=1:no_chan
    
    
for i=1:size(all_cont,1)
v1=all_cont{i,1}{chan,1};
vorod1{1,i}=v1;
end


for i=1:size(all_dis,1)
v2=all_dis{i,1}{chan,1};
vorod2{1,i}=v2;

end


vv{1,chan}=ranksum(cell2mat(vorod1),cell2mat(vorod2));
end
pval1=cell2mat(vv);
% 2
for chan=1:no_chan 
    
    
for i=1:size(all_cont,1)
v1=all_cont{i,1}{chan,2};
vorod1{1,i}=v1;
end


for i=1:size(all_dis,1)
v2=all_dis{i,1}{chan,2};
vorod2{1,i}=v2;

end


vv{1,chan}=ranksum(cell2mat(vorod1),cell2mat(vorod2));
end
pval2=cell2mat(vv);
%3 
for chan=1:no_chan  
    
    
for i=1:size(all_cont,1)
v1=all_cont{i,1}{chan,3};
vorod1{1,i}=v1;
end


for i=1:size(all_dis,1)
v2=all_dis{i,1}{chan,3};
vorod2{1,i}=v2;

end


vv{1,chan}=ranksum(cell2mat(vorod1),cell2mat(vorod2));
end
pval3=cell2mat(vv);

% 4
for chan=1:no_chan  
    
    
for i=1:size(all_cont,1)
v1=all_cont{i,1}{chan,4};
vorod1{1,i}=v1;
end


for i=1:size(all_dis,1)
v2=all_dis{i,1}{chan,4};
vorod2{1,i}=v2;

end


vv{1,chan}=ranksum(cell2mat(vorod1),cell2mat(vorod2));
end
pval4=cell2mat(vv);

% 5
for chan=1:no_chan  
    
    
for i=1:size(all_cont,1)
v1=all_cont{i,1}{chan,5};
vorod1{1,i}=v1;
end


for i=1:size(all_dis,1)
v2=all_dis{i,1}{chan,5};
vorod2{1,i}=v2;

end


vv{1,chan}=ranksum(cell2mat(vorod1),cell2mat(vorod2));
end
pval5=cell2mat(vv);

pval_all=single([pval1;pval2;pval3;pval4;pval5]');

%% defining thresholds for topo plots 

lowp=-20;maxp=-lowp;

%1
signvector=sign(pval1);
pval1_b=(1./abs(pval1))-20;
pval1_b(pval1_b<0)=0; % non significants(>0.05) are zero 
pval1_b=pval1_b.*signvector;

%2
signvector=sign(pval2);
pval2_b=(1./abs(pval2))-20;
pval2_b(pval2_b<0)=0;
pval2_b=pval2_b.*signvector;

%3
signvector=sign(pval3);
pval3_b=(1./abs(pval3))-20;
pval3_b(pval3_b<0)=0;
pval3_b=pval3_b.*signvector;

%4
signvector=sign(pval4);
pval4_b=(1./abs(pval4))-20;
pval4_b(pval4_b<0)=0;
pval4_b=pval4_b.*signvector;

%5
signvector=sign(pval1);
pval5_b=(1./abs(pval5))-20;
pval5_b(pval5_b<0)=0;
pval5_b=pval5_b.*signvector;


pval_all_b=single([pval1_b;pval2_b;pval3_b;pval4_b;pval5_b]');


% delta theta alpha beta gamma 
subplot (2,3,1)
 topoplot(pval1_b, 'inter.locs','style','both','conv','on');
 colormap jet
title('delta')
 subplot (2,3,2)
 topoplot(pval2_b, 'inter.locs','style','both','conv','on');
 title('theta')
 subplot (2,3,3)
 topoplot(pval3_b, 'inter.locs','style','both','conv','on');
 title('alpha')
  subplot (2,3,4)
 topoplot(pval4_b, 'inter.locs','style','both','conv','on');
 title('beta')
  subplot (2,3,5)
 topoplot(pval5_b, 'inter.locs','style','both','conv','on');
 title('gamma')
 
 % for theta and alpha 
 figure
 subplot(1,2,1)
  topoplot(pval2_b, 'inter.locs','style','both','conv','on');
  title('\theta band')
 colormap jet
  subplot(1,2,2)
  topoplot(pval3_b, 'inter.locs','style','both','conv','on');
  title('\alpha band') 
 
%  colorbar('Ticks',[-5,-2,1,4,7],...
%          'TickLabels',{'Cold','Cool','Neutral','Warm','Hot'})

 % read a channel locations file and plot a map
% 
%  figure 
%   topoplot(pval, 'Standard-10-20-Cap19_my.locs','style','both','conv','off'); % read a channel locations file and plot a map
% 
%   
%   figure
%  figure; topoplot([],'Standard-10-20-Cap19_my.locs','style','blank','electrodes','labelpoint');


% csvwrite('pval_all.csv',pval_all,5,19);



%% for statistcial  power 

% 2
for chan=1:no_chan 
    
    
for i=1:size(all_cont,1)
v1=all_cont{i,1}{chan,3};
vorod1{chan,i}=v1;
end


for i=1:size(all_dis,1)
v2=all_dis{i,1}{chan,3};
vorod2{chan,i}=v2;

end
end
vorod1mat=cell2mat(vorod1);
vorod2mat=cell2mat(vorod2);

