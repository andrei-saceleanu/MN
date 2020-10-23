function [hsvimg]=tohsv(img)
  m=size(img,1);
  n=size(img,2);
  hsvimg=zeros(m,n,3);
  for i=1:m
    for j=1:n
      r=cast(img(i,j,1),"double");
      g=cast(img(i,j,2),"double");
      b=cast(img(i,j,3),"double");
      rp=r/255;
      gp=g/255;
      bp=b/255;
      cmax=max([rp,gp,bp]);
      cmin=min([rp,gp,bp]);
      delta=cmax-cmin;
      if delta ==0
        H=0;
      else
        if cmax==rp
          H=60*mod((gp-bp)/delta,6);
        endif
        if cmax==gp
          H=60*((bp-rp)/delta+2);
        endif
        if cmax==bp
          H=60*((rp-gp)/delta+4);
        endif
      endif
      H=H/360;
      if cmax==0
        S=0;
      else
        S=delta/cmax;
      endif
      V=cmax;
      hsvimg(i,j,1)=H;
      hsvimg(i,j,2)=S;
      hsvimg(i,j,3)=V;
    endfor
  endfor
endfunction
