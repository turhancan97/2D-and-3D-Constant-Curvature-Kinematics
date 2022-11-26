function [ fig ] = plot_tdcr_cc( T1_cc,T2_cc,T3_cc)
    
    x = linspace(-0.05, 0.05, 10);
    y = linspace(-0.01, 0.01, 10);
    [x, y] = meshgrid(x, y);
    z = x * y;

    radius1=4;
    radius2=3;
    radius3=2;

    surf(x,y,z, 'EdgeColor','k','FaceAlpha',0.5,'FaceColor','k');
    hold on;
    len4 = plot3(T3_cc(:,13),T3_cc(:,14),T3_cc(:,15),'LineWidth',radius3,'Color',[1 0 0],'DisplayName','Third Section');
    len3 = plot3(T2_cc(:,13),T2_cc(:,14),T2_cc(:,15),'LineWidth',radius2,'Color',[0 1 0],'DisplayName','Second Section');
    len2 = plot3(T1_cc(:,13),T1_cc(:,14),T1_cc(:,15),'LineWidth',radius1,'Color',[0 0 1],'DisplayName','First Section');
    len1 = scatter3(T1_cc(1,13),T1_cc(1,14),T1_cc(1,15),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3,'DisplayName','Section Seperation');
    scatter3(T1_cc(end,13),T1_cc(end,14),T1_cc(end,15),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3);
    scatter3(T2_cc(end,13),T2_cc(end,14),T2_cc(end,15),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3);
    scatter3(T3_cc(end,13),T3_cc(end,14),T3_cc(end,15),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3);
    legend([len1,len2,len3,len4])
    title('3-D Continuum Robot')
    xlabel('X Position (m)')
    ylabel('Y Position (m)')
    zlabel('Z Position (m)')
    hold off;

end

