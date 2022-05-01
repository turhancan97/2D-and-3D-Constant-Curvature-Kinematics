function [Tc,Tc_tip] = coupletransformations(T,T_tip)
%Find orientation and position of distal section
%(Multiply T of current section with T at tip of previous section)
%INPUT:
%T: Transformation matrices of current section
%T_tip: Transformation at tip of previous section
%OUTPUT:
%Tc: coupled Transformation matrix
%Tc_tip: last line of Tc (section end)

Tc=zeros(length(T(:,1)),length(T(1,:)));
for k=1:length(T(:,1))
Tc(k,:)=reshape(T_tip*(reshape(T(k,:),4,4)),16,1);
end
Tc_tip=reshape(Tc(size(Tc,1),:),4,4);

end

