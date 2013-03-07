%The function atmos(h) outputs the values of temperature(t),
%pressure(p),density(rho),and speed of sound(sos) at given
%the altitude input(h). This function requires that
%altitude be given in [ft] and the outputs of temperature,
%pressure, density, and speed of sound are given as [R],
%[lb/ft^2], [slug/ft^3], and [ft/sec] respectively.
%
% Atmosphere Generator Function (English Units)
%
% Assumptions:
%   -Gamma is constant and equal to 1.4
%   -Gravity is constant throughout all layers
%
% Input: 
%
%   h:   Altitude from mean sea level       (ft)
%
% Output:
%   
%   t:   Tempreture                         (Rankine)
%   p:   Pressure                           (lb/ft^2)
%   rho: Density                            (slug/ft^3)
%   sos: Speed of Sound                     (ft/sec)
%
% Example Command Issue:
%   [t,p,rho,sos] = atmos(30000);

function [t,p,rho,sos]=atmos(h)
%Determine Temperature, Pressure, 
while(1)
    %Outside of valid range Error    
    assert(h<2000000 | h>0,'Altitude is not valid');
    
    %Layer 1
    t   = 518.69 - 0.00356616*h;
    p   = (1.137193514E-11)*(t^5.2560613);
    rho = (5.8261E-4)*(p/t);
    sos = 49.0214*t^(1/2);
    if h>=0 & h<=36089.2;break;end
    
    %Layer 2
    PreLayer = rho*t/p;
    t   = 389.9901385;
    p   = 2678.38681*exp((-4.80624E-5)*h);
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>36089.2 & h<=65616.8;break;end
    
    %Layer 3
    PreLayer = rho*t/p;
    t   = 353.9901374 + 0.00054864*h;
    p   = (3.802075778E90)*(t^-34.1643987);
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>65616.8 & h<=104986.9;break;end

    %Layer 4
    PreLayer = rho*t/p;
    t   = 250.3103243 + 0.00153619*h;
    p   = (1.44217649E33)*t^-12.20158686;
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>104986.9 & h<=154199.5;break;end
    
    %Layer 5
    PreLayer = rho*t/p;
    t   = 487.1900543;
    p   = 873.6400826*exp((-3.84736009E-5)*h);
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>154199.5 & h<=170603.7;break;end
    
    %Layer 6
    PreLayer = rho*t/p;
    t   = 674.3900821 - 0.00109728*h;
    p   = (1.509860827E-46)*t^(17.08219937);
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>170603.7 & h<=200131.2;break;end
    
    %Layer 7
    PreLayer = rho*t/p;
    t   = 893.9900454 - (2.19456E-3)*h;
    p   = (7.577930948E-24)*t^8.541099698;
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>200131.2 & h<=259186.0;break;end
    
    %Layer 8
    PreLayer = rho*t/p;
    t   = 325.1908172;
    p   = (6.669501806E4)*exp(-5.763986782E-5*h);
    rho = PreLayer*p/t;
    sos = 49.0214*t^(1/2);
    if h>259186.0 & h<=2000000;break;end
end

end
