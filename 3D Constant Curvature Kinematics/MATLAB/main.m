clear all;
close all;
clc;

%% The constant curvature model (geometric)
var_cc = [1.7035, 1.0000, 2.000 ; 0.1000, 0.1000, 0.1000; 0, 0, 0]; % [kappa1 kappa2 kappa3; l1 l2 l3; phi1 phi2 phi3]

% from configuration space (kappa, length) to task space (x,y)
%%% We should limit the curvature values

if var_cc(1) > 16 | var_cc(1) < -4
    disp("Please enter the First Curvature values between -4 and 16")
    var_cc(1) = 0;

elseif var_cc(2) > 16 | var_cc(2) < -4
    disp("Please enter the Second Curvature values between -4 and 16")
    var_cc(2) = 0;

elseif var_cc(3) > 16 | var_cc(3) < -4
    disp("Please enter the Third Curvature values between -4 and 16")
    var_cc(3) = 0;
    
else
    disp("Curvature Values for Each Segment are Appropriate")
end

% Construct the robot shape with var_cc, using 50 points along each segment
[T1_cc,T2_cc,T3c_cc] = construct_tdcr_cc(var_cc);

%% Plotting
plot_tdcr_cc(T1_cc,T2_cc,T3c_cc);