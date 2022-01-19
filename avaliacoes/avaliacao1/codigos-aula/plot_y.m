function plot_y(y,y1,y2)
    plot(y)
    hold on
    plot(y1)
    hold on 
    plot(y2)
    xlabel('t')
    ylabel('u(t)')
    legend('y_c','y_v','y_{MPC}')
    title("Saídas em tempo contínuo")
    saveas(gcf,'imgs/plot_y.png')
end