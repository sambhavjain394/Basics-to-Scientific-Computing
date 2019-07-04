function yout=rk4singlestep(func,dt,tk,yk)
% yout as y_k+1
% func is the right hand side of ddt(y)=f(t,y)

f1=func(tk,yk);
f2=func(tk+dt/2,yk+(f1*dt)/2);
f3=func(tk+dt/2,yk+(f2*dt)/2);
f4=func(tk+dt,yk+dt*f3);
 
yout=yk+(dt/6)*(f1+2*f2+2*f3+f4);