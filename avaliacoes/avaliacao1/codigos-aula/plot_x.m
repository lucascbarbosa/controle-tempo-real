function plot_x(data,tipo)
    plot(data)
    xlabel('t')
    ylabel('x(t)')
    legend('x_1','x_2')
    title("Estados de " + tipo + " em tempo contínuo")
end