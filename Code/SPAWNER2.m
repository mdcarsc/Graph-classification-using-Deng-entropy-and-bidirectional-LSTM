%XDat are example of rhe same class 
%p=percentage of synthetic time series P=1 generates N =lenght(XData)
function [Xn,Yn,Xex]=SPAWNER2(XData,YData,n,samplesPerPair)
N=length(XData);
if n<=0
    error("n must be >=1 ");
end

if samplesPerPair<1
    error("samplesPerPair >1")
end
if N<n
    error("The # of true Data cannot be less than the number of synthethic examples ")
end
numfeatures = size(XData{1},1);

idex=randperm(N,n); %index of exmple (the seed) to generate new time series 
%searh for closer time series
for i=1:length(idex)
    Ysyn(i,1)=YData(idex(i));
    d=zeros(length(XData),1);
    %d(:)=inf;
    for j=i:length(XData)
        if idex(i)~=j        
            [d(j),~,~]= dtw(XData{idex(i)},XData{j}); 
        else
            d(j)=inf;
        end
    end
    yPair=[];
    for k=1:samplesPerPair
        [~,ixnei]=min(d,[],'all');               
        d(ixnei)=inf;
        
               
        for z=1:numfeatures
            % hold on
            %plot(XData{idex(i)}(z,:))
            if k==1            
                Xsyn(z,:)=XData{idex(i)}(z,:)+XData{ixnei}(z,:);
            else
                Xsyn(z,:)=Xsyn(z,:)+XData{ixnei}(z,:);
            end                       
            % plot(Xsyn(z,:));
        end       
    end
    Xsyn(z,:)=Xsyn(z,:)./samplesPerPair;
    Yn=Ysyn;
    Xn{i,1}=Xsyn;
    Xex=XData{idex};
end

end