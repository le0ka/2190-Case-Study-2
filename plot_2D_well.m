% plot_2D_well.m
% -------------------------------------------------
% This script plots the probability densities of the five lowest 
% eigenstates of a 2D infinite square well (0 < x < 1, 0 < y < 1)


clear; close all; clc;

% Set well width
L = 1;

% Define a grid for x and y
N = 100;          
x = linspace(0, L, N);
y = linspace(0, L, N);
[X, Y] = meshgrid(x, y);

% Define the quantum numbers for the five states:
% (n,m) = (1,1), (1,2), (2,1), (2,2), (1,3)
states = [1 1; 1 2; 2 1; 2 2; 1 3];

% Create a figure for the plots
figure('Name','Probability Densities for 2D Infinite Square Well','NumberTitle','off');

for i = 1:size(states,1)
    n = states(i,1);
    m = states(i,2);
    
    % Compute the normalized eigenfunction
    psi = (2/L) * sin(n*pi*X/L) .* sin(m*pi*Y/L);
    
    % Compute the probability density
    prob_density = psi.^2;
    
    % Plot the probability density 
    subplot(3,2,i)  
    surf(X, Y, prob_density, 'EdgeColor', 'none');
    shading interp
    colormap jet
    colorbar
    xlabel('x', 'FontSize', 14);
    ylabel('y', 'FontSize', 14);
    zlabel('|\psi(x,y)|^2', 'FontSize', 14);
    title(sprintf('State (n = %d, m = %d)', n, m), 'FontSize', 16);
    set(gca, 'FontSize', 14);  
    view(45,30)
end

subplot(3,2,6);
axis off;

sgtitle('Probability Densities of the Lowest Five Eigenstates for a 2D Infinite Square Well', 'FontSize', 18);
