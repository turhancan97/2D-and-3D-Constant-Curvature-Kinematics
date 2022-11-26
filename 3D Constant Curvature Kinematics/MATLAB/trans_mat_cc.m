function [T] = trans_mat_cc(kappa, l, phi, sect_points)
%Mapping from configuration parameters to task space
% tip frame is aligned so that the x-axis points toward the center of the
% circle
%
% INPUT:
% kappa: curvature
% l: trunk length
% sect_points: points per section
%
% OUTPUT:
% T: Transformation matrices containing orientation and position

si=linspace(0,l,sect_points);
T= zeros(length(si),16);

c_p=cos(phi);
s_p=sin(phi);

for i=1:length(si)
    s=si(i);
    c_ks=cos(kappa*s);
    s_ks=sin(kappa*s);
    if kappa==0
      T(i,:)=[[c_p*c_ks s_p*s_ks s_ks 0] [-s_p c_p 0 0] [-c_p*s_ks -s_p*s_ks c_ks 0] ...
      [0 0 s 1]];  
    else
      T(i,:)=[[c_p*c_ks s_p*s_ks s_ks 0] [-s_p c_p 0 0] [-c_p*s_ks -s_p*s_ks c_ks 0] ...
      [(1/kappa)*(-c_p+c_p*c_ks) (1/kappa)*(-s_p+s_p*c_ks) s_ks/kappa 1]];
    end
end

end