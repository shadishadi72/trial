function f_eeg=cal_pow(p1,p2,s,w)
% a=find(w<=p1);
% b=find(w>=p2);
% f1=a(end);
% f2=b(1);
% freq=w([f1:f2]);
% mm=zeros(size(s,2),1);
pband=zeros(size(s,2),1);


for i=1:size(s,2)
% sig=s([f1:f2],i);

% mm(i,1)=mean(abs(sig).^2);
pband(i,1) = bandpower(abs(s(:,i)),w,[p1 p2],'psd');

end
f_eeg=mean(pband);
end