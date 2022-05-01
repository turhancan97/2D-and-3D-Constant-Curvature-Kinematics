function [ T1_cc,T2c_cc, T3c_cc] = construct_tdcr_cc( var_cc )
    
    kappa1 = var_cc(1,1);
    l1 = var_cc(2,1);
    kappa2 = var_cc(1,2);
    l2 = var_cc(2,2);
    kappa3 = var_cc(1,3);
    l3 = var_cc(2,3);
    
    % task space
    sect_points=50; %number of points per section

    % section 1
    [T1_cc] = trans_mat_cc(kappa1, l1, sect_points);
    T1_tip=reshape(T1_cc(length(T1_cc),:),4,4);
    
    % section 2
    [T2] = trans_mat_cc(kappa2, l2, sect_points);
    [T2c_cc,~] = coupletransformations(T2,T1_tip);
    T2_tip=reshape(T2c_cc(length(T2c_cc),:),4,4);

    % section 3
    [T3] = trans_mat_cc(kappa3, l3, sect_points);
    [T3c_cc,~] = coupletransformations(T3,T2_tip);
    T3_tip=reshape(T3c_cc(length(T3c_cc),:),4,4);
end

