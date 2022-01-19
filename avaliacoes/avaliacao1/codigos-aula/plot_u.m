function plot_u(data,tipo)

    plot(data)
    xlabel('t')
    ylabel('u(t)')
    title("Sinais de controle de " + tipo + " em tempo contínuo")
end
