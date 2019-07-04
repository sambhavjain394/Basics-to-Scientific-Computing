function dy= vdp(t,y,mu)
dy(1,1)=y(2);
dy(2,1) = mu*(1-y(1)^2)*y(2)-y(1);