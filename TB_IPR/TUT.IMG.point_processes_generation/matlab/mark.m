function r=mark(x,y,mu,sigma)

r=zeros(1,length(x));
for i=1:length(x)
    r(i)= mu + sigma * randn;
end