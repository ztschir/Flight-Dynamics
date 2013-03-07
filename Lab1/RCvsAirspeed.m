clear; clc;
% Script to plot the Rate of Climb vs. Airspeed


% ------------------------Input Data------------------------
% Rate of Climb data, these values were given to us by the TA, 
% since ours were off. Given in Ft/min
RC = [1000, 1200, 1500, 1200, 1000, 0];
%RealRC = [1200, 900, 1100, 1200, 1000, 0];

% Airspeed data, Convert to Ft/min
KnotsToFtPerMinute = 101.268591;
Airspeed = [120, 110, 100, 90, 80, 165]*KnotsToFtPerMinute;
% ----------------------------------------------------------



% Setup
A              = fliplr(polyfit(Airspeed,RC,2));% Polyfit data to parabola
vmin           = min(Airspeed);
vmax           = max(Airspeed);
V              = 0:1:vmax;                 % Break data into finer segments
hdot           = A(1) + A(2).*V + A(3).*V.^2;        % hdot for every speed
vStar          = -A(2) / (2*A(3));
hdotmax        = A(1) + A(2).*vStar + A(3).*vStar.^2;
vStar2         = sqrt(A(1) / A(3));
hdotFAmax      = A(1) + A(2)*vStar2 + A(3)*vStar2^2;
hdotDivV       = A(1)/vStar2 + A(2) + A(3)*vStar2;
flightAngleMax = asind(hdotDivV);
x              = 0:1:vmax + vmax/4;
y              = hdotDivV.*x + hdotFAmax/(hdotDivV*vStar2);

fprintf('hdot Max = %g (ft/min) at airspeed = %g (ft/min)\n',hdotmax, vStar);
fprintf('Flight Angle Max = %g degrees at airspeed = %g (ft/min)\n',flightAngleMax, vStar2);

figure;hold on;
    title('Rate of Climb vs.Airspeed Ascent');
    xlabel('Airspeed (ft/min)');
    ylabel('Rate of climb (ft/min)');
    axis([0,vmax + vmax/4,0,hdotmax + hdotmax/4]); % Set Axis
    scatter(Airspeed,RC,'x');                      % Plot Vel and RC points
    scatter(vStar,hdotmax,'k', 'filled');          % Plot Max RC point
    scatter(vStar2,hdotFAmax,'v');                 % Plot Max Flight Angle
    plot(V,hdot,'k');                              % Plot V and hdot
    plot(x,y,'m');                                 % Plot Flight Angle line
hold off;
