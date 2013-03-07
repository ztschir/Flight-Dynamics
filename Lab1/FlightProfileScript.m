clear; clc;
% Script to plot the Flight Profile

% Altitude data
Altitude = [0, 0, 5000, 6000, 5500, 6000, 6500, 6000, 6000, 6000, 6000, ...
    6000, 6000, 5200, 5000, 4000, 1000, 1000, 900, 800, 0];

% Ground Distance data (Not to scale)
GroundDist = 0:1:length(Altitude) - 1;

figure;hold on;
    axis([0, max(GroundDist), 0, (max(Altitude) + 300)]);
    scatter(GroundDist, Altitude, 'b', 'filled');  
    plot(GroundDist, Altitude,'k'); 
    title('Flight Profile');
    xlabel('Event (No units)');
    ylabel('Altitude (ft)');
hold off;