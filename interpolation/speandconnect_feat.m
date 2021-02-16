% spec and connect 
 load('inpi_spec.mat')
load('inpi_connect.mat')
cont=38;
dis=26;
inpi=zeros(size(inpi_spec,1),size(inpi_connect,2)+size(inpi_spec,2)-2);


inpi(:,1)=[1:size(inpi_spec,1)];
inpi(1:cont,[2:15])=[inpi_spec([1:cont],[2:end-1])]; % cont
inpi(1:cont,[16:end-1])=[inpi_connect([1:cont],[2:end-1])]; % cont
inpi(1:cont,end)=1; % cont


inpi(cont+1:end,2:15)=inpi_spec(cont+1:end,2:end-1); % cont
inpi(cont+1:end,16:end-1)=inpi_connect(cont+1:end,[2:end-1]); % cont
inpi(cont+1:end,end)=1; % cont
inpi(cont+1:end,end)=-1; % dis 