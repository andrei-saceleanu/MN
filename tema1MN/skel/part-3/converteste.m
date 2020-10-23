function [hsv] = converteste(img)
r=cast(img(:,:,1),"double");
g=cast(img(:,:,2),"double");
b=cast(img(:,:,3),"double");
M=size(img,1);
N=size(img,2);
r=r/255;
g=g/255;
b=b/255;
Cmax=max(r,max(g,b));
Cmin=min(r,min(g,b));
delta=zeros(M,N);
delta=Cmax-Cmin;

h=zeros(M,N);
h(delta==0)=0;
h(Cmax==r&delta~=0)=60*mod((g(Cmax==r&delta~=0)-b(Cmax==r&delta~=0))./delta(Cmax==r&delta~=0),6);
h(Cmax==g&delta~=0)=60*(((b(Cmax==g&delta~=0)-r(Cmax==g&delta~=0))./delta(Cmax==g&delta~=0))+2);
h(Cmax==b&delta~=0)=60*(((r(Cmax==b&delta~=0)-g(Cmax==b&delta~=0))./delta(Cmax==b&delta~=0))+4);
h=h/360;

s=zeros(M,N);
s(Cmax==0)=0;
s(Cmax~=0)=delta(Cmax~=0)./Cmax(Cmax~=0);
v=zeros(M,N);
v=Cmax;
hsv=cat(3,h,s,v);
end
