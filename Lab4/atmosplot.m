function [property] = atmosplot()
%The atomsplot function calculates atmosphereic
%properties and plots them
clc;clear all;                  

i = 1;

% Load the Standard Atmosphere reference values
stdAtm = load('StandardAtmos.mat');
stdAtm = stdAtm.stdAtmFH;

for height = stdAtm(:,1)'
 [t,p,rho,sos]=atmos(height);
 property(i,:)=[height,t,p,rho,sos];
 i=i+1;
end

% calculates percent error
ERROR=abs((property-stdAtm)./stdAtm.*100);
 
%Plot t, p, rho, and sos 
figure(1);  
plot(property(:,2),property(:,1));         
title ('Altitude vs. Temperature ');
xlabel('Temperature [R]');           
ylabel('Altitude [ft]');
 
figure(2);  
plot(property(:,3),property(:,1));         
title ('Altitude vs. Pressure');
xlabel('Pressure [lb/ft^2]');             
ylabel('Altitude [ft]');
 
figure(3);   
plot(property(:,4),property(:,1));         
title( 'Altitude vs. Density');
xlabel('Density [slug/ft^3]');          
ylabel('Altitude [ft]');
 
figure(4);  
plot(property(:,5),property(:,1));         
title( 'Altitude vs. Speed of Sound');  
xlabel('Speed of Sound [ft/s]');      
ylabel('Altitude [ft]');
 
%Plot Error of t, p, rho, and sos
figure(5);  
plot(ERROR(:,2),property(:,1));   
title ('Altitude vs. Temperature Error');
xlabel('Percent error [%]');   
ylabel('Altitude [ft]');
 
figure(6);  
plot(ERROR(:,3),property(:,1));   
title ('Altitude vs. Pressure Error');
xlabel('Percent error [%]');   
ylabel('Altitude [ft]');
  
figure(7);  
plot(ERROR(:,4),property(:,1));   
title ('Altitude vs. Density Error');
xlabel('Percent error [%]');   
ylabel('Altitude [ft]');
 
figure(8);  
plot(ERROR(:,5),property(:,1));   
title ('Altitude vs. Speed of Sound Error');
xlabel('Percent error [%]');   
ylabel('Altitude [ft]');

end
