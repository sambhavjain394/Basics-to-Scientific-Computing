function dy= pend(t,y,g,L,d)
% dy is the vector containing two elements- derivative of x and v
% y is the vector containing x and v  as its elements
dy(1,1)= y(2);
dy(2,1)= (g/L)*sin(y(1))-d*y(2);
