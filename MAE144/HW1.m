% this is my hw1 code
disp('Hello world')
%% Q2a
b=RR_poly([-2 2 -5 5],1), a=RR_poly([-1 1 -3 3 -6 6],1)
f=RR_poly([-1 -1 -3 -3 -6 -6],1)
[x,y] = RR_diophantine(a,b,f), test=trim(a*x+b*y), residual1=norm(f-test)

%% Q2b
b=RR_poly([-2 2 -5 5],1), a=RR_poly([-1 1 -3 3 -6 6],1)
f=RR_poly([-1 -1 -3 -3 -6 -6 -20 -20 -20 -20 -20],1)
[x,y] = RR_diophantine(a,b,f), test=trim(a*x+b*y), residual1=norm(f-test)

%% Q3
clear; syms zeta om_n b0;          
sig=zeta*om_n; om_d=om_n*sqrt(1-zeta^2);
pp=-sig+i*om_d; pm=-sig-i*om_d; Y=RR_tf(b0,RR_poly([0,pp,pm],1))
[p,d,k,n]=RR_partial_fraction_expansion(Y)
d0=simplify(d(1))                  
dc=simplify(d(2)+d(3))             
ds=simplify(i*(d(2)-d(3)))         % Heaviside coverup method
Ds = tf([1 z1],[1 p1]);
function [Dz]=JS_C2D_matched(Ds,h,omegac)
s = tf('s'); z = tf('z',1); 
        % Map each pole/zero to z-plane
z1n = eval(subs(z1)); p1n = eval(subs(p1));
        % Add zeros at infinity

        % Make strictly proper
        % Adjust Gain
           %test with MATLAB c2d
Ds = [s+1]/[s+10]; c2d(Ds, 1, 'matched')
end % function JS_C2D_matched