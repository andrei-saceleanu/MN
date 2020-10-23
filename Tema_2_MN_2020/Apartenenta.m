function y = Apartenenta(x, val1, val2)
	if(x<val1)
    y=0;
  elseif(x>val2)
    y=1;
  else
    a=1/(val2-val1);% din continuitate,se obtin valorile lui a si b
    b=-a*val1;
    y=a*x+b; %se obtine gradul de apartenenta
  endif
endfunction
	