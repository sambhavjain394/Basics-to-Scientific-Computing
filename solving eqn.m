  clear all; 
  close all;
  x=-10:0.1:10;
  y=exp(x)-tan(x);
  plot(x,y)
  axis( [-4 -2 -2 2])
  xl=-4;
  xr=-2.5;
  for j=1:1000
        xc=(xl+xr)/2;
        fc=exp(xc)-tan(xc);
        
        if fc>0
            xl=xc;
        elseif fc<0
            xr=xc;
        end
        
        if abs(fc)<10^(-5)
            break
        end
        
  end
  
  fc
  xc
  j
  