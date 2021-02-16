function [EEG_interpolated,chan_loc_r]=for_inter(EEG)
chan_no=19;

% load('r2.mat')
% load('theta.mat')
% load('locs_new.mat')
load('chan_loc_r.mat')
% 
% X=[0.95,0.95,0.673,0.673,0,0,-0.673,-0.673,-0.95,-0.95,0.587,0.587,0,0,-0.587,-0.587,0.719,0,-0.719];
% Y=[0.309,-0.309,0.545,-0.545,0.719,-0.719,0.545,-0.545,0.309,-0.309,0.809,-0.809,0.999,-0.999,0.809,-0.809,0,0,0];
% Z=[-0.0349,-0.0349,0.5,0.5,0.695,0.695,0.5,0.5,-0.0349,-0.0349,-0.0349,-0.0349,-0.0349,-0.0349,-0.0349,-0.0349,0.695,1,0.695];
% for i=1:chan_no
%     chan_loc_r(i).labels=EEG.chanlocs(i).labels;
%     % chan_loc_r(i).ref=ref(i);
%     chan_loc_r(i).radius=r2(i);
%     chan_loc_r(i).theta=theta(i);
%     chan_loc_r(i).X=X(i);
%     chan_loc_r(i).Y=Y(i);
%     chan_loc_r(i).Z=Z(i);
%     
%     
% end
% 
% 
% % adding 7 fake channels
% 
% 
% 
% %average 7 groups
% % 1: fp1,f3,f7
% g1_x=mean([locs_new(1).X,locs_new(3).X,locs_new(11).X]);
% g1_y=mean([locs_new(1).Y,locs_new(3).Y,locs_new(11).Y]);
% g1_z=mean([locs_new(1).Z,locs_new(3).Z,locs_new(11).Z]);
% g1_r=mean([locs_new(1).radius,locs_new(3).radius,locs_new(11).radius]);
% g1_theta=mean([locs_new(1).theta,locs_new(3).theta,locs_new(11).theta]);
% 
% % 2: fp2,f4,f8
% g2_x=mean([locs_new(2).X,locs_new(4).X,locs_new(12).X]);
% g2_y=mean([locs_new(2).Y,locs_new(4).Y,locs_new(12).Y]);
% g2_z=mean([locs_new(2).Z,locs_new(4).Z,locs_new(12).Z]);
% g2_r=mean([locs_new(2).radius,locs_new(4).radius,locs_new(12).radius]);
% g2_theta=mean([locs_new(2).theta,locs_new(4).theta,locs_new(12).theta]);
% 
% 
% % 3: t3,c3
% g3_x=mean([locs_new(13).X,locs_new(5).X]);
% g3_y=mean([locs_new(13).Y,locs_new(5).Y]);
% g3_z=mean([locs_new(13).Z,locs_new(5).Z]);
% g3_r=mean([locs_new(13).radius,locs_new(5).radius]);
% g3_theta=mean([locs_new(13).theta,locs_new(5).theta]);
% 
% 
% % 4: t4,c4
% g4_x=mean([locs_new(14).X,locs_new(6).X]);
% g4_y=mean([locs_new(14).Y,locs_new(6).Y]);
% g4_z=mean([locs_new(14).Z,locs_new(6).Z]);
% g4_r=mean([locs_new(14).radius,locs_new(6).radius]);
% g4_theta=mean([locs_new(14).theta,locs_new(6).theta]);
% 
% % 5: t5,p3,01
% g5_x=mean([locs_new(15).X,locs_new(7).X,locs_new(9).X]);
% g5_y=mean([locs_new(15).Y,locs_new(7).Y,locs_new(9).Y]);
% g5_z=mean([locs_new(15).Z,locs_new(7).Z,locs_new(9).Z]);
% g5_r=mean([locs_new(15).radius,locs_new(7).radius,locs_new(9).radius]);
% g5_theta=mean([locs_new(15).theta,locs_new(7).theta,locs_new(9).theta]);
% 
% % 6: t6,p4,02
% g6_x=mean([locs_new(16).X,locs_new(8).X,locs_new(10).X]);
% g6_y=mean([locs_new(16).Y,locs_new(8).Y,locs_new(10).Y]);
% g6_z=mean([locs_new(16).Z,locs_new(8).Z,locs_new(10).Z]);
% g6_r=mean([locs_new(16).radius,locs_new(8).radius,locs_new(10).radius]);
% g6_theta=mean([locs_new(16).theta,locs_new(8).theta,locs_new(10).theta]);
% 
% % 7: fz,cz,pz
% g7_x=mean([locs_new(17).X,locs_new(18).X,locs_new(19).X]);
% g7_y=mean([locs_new(17).Y,locs_new(18).Y,locs_new(19).Y]);
% g7_z=mean([locs_new(17).Z,locs_new(18).Z,locs_new(19).Z]);
% g7_r=mean([locs_new(17).radius,locs_new(18).radius,locs_new(19).radius]);
% g7_theta=mean([locs_new(17).theta,locs_new(18).theta,locs_new(19).theta]);
% 
% 
% rf=[g1_r,g2_r,g3_r,g4_r,g5_r,g6_r,g7_r];
% thetaf=[g1_theta,g2_theta,g3_theta,g4_theta,g5_theta,g6_theta,g7_theta];
% xf=[g1_x,g2_x,g3_x,g4_x,g5_x,g6_x,g7_x];
% yf=[g1_y,g2_y,g3_y,g4_y,g5_y,g6_y,g7_y];
% zf=[g1_z,g2_z,g3_z,g4_z,g5_z,g6_z,g7_z];
% 
% labelsf={'g1','g2','g3','g4','g5','g6','g7'};
% 
% 
% 
% for i=chan_no+1:chan_no+7
%      chan_loc_r(i).labels=labelsf{i-chan_no};
%     chan_loc_r(i).radius=rf(i-chan_no);
%     chan_loc_r(i).theta=thetaf(i-chan_no);
%     chan_loc_r(i).X=xf(i-chan_no);
%     chan_loc_r(i).Y=yf(i-chan_no);
%     chan_loc_r(i).Z=zf(i-chan_no);
% end
% %add 7 fake chans (loc and values ) 
% EEG_new.data=EEG([1:19],:);
% EEG_new.chanlocs=chan_loc_r;
% Data=zeros(chan_no+7,size(EEG_new.data,2));
% Data(1:19,:)=EEG_new.data([1:19],:);
% EEG_new.data=Data;
% EEG_new.nbchan=chan_no+7;  



EEG_new=EEG;
EEG_new.chanlocs=chan_loc_r;
Data=zeros(chan_no+7,size(EEG.data,2));
Data(1:19,:)=EEG.data([1:19],:);
EEG_new.data=Data;
EEG_new.nbchan=chan_no+7;

% bad_elec2=zeros(size(EEG_new.data,1),1);
% bad_elec2(bad_elec)=1;
bad_elec=[20,21,22,23,24,25,26];
% bad_elec=[2];

EEG_interpolated= eeg_interp(EEG_new, bad_elec,  'spherical');
end