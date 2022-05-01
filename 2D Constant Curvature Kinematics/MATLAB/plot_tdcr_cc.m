function [ fig ] = plot_tdcr_cc( T1_cc,T2_cc,T3_cc)

    radius1=4;
    radius2=3;
    radius3=2;

    hold on;
    plot(T3_cc(:,13),T3_cc(:,14),'LineWidth',radius3,'Color',[1 0 0]);
    plot(T2_cc(:,13),T2_cc(:,14),'LineWidth',radius2,'Color',[0 1 0]);
    plot(T1_cc(:,13),T1_cc(:,14),'LineWidth',radius1,'Color',[0 0 1]);
    scatter(T1_cc(end,13),T1_cc(end,14),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3)
    scatter(T2_cc(end,13),T2_cc(end,14),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3)
    scatter(T3_cc(end,13),T3_cc(end,14),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',3)
    legend('Third Section','Second Section',"First Section","Section Seperation")
    title('2-D Continuum Robot')
    xlabel('X - Position')
    ylabel('Y - Position')
    hold off;

end

