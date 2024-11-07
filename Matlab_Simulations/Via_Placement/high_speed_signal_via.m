%{
High Speed signal via analysis and reference design
Ref: https://in.mathworks.com/help/rfpcb/ug/eigenmode-based-solver-for-pcb-vias.html
%}

% Board Specifications

via_diameter                = 1.9990e-04;   % Via barrel diameter, m
gnd_via_diameter            = 1.9990e-04;
clearance_diameter          = 7.8892e-04;   % clearence diameter, m
v_signal_via_clearence      = shape.Circle('Radius',clearance_diameter/2);
v_signal_via_pad            = shape.Circle('Radius',2.5e-4);
via_1_location              = [0 0];        % Signal Via Locations, m
gnd_return_locations        = [-1e-3 1e-3;-1e-3 -1e-3;1e-3 -1e-3;1e-3 1e-3]; % Ground Return Via Locations, m

relative_dielectric_const   = 3.15;         % Dielectric permittivity 
dielectric_loss             = 2e-3;         % Dielectric loss tangent
layer_1_thickness           = 2.2027e-04;   % Dielectric layer thickness, m
frequency_spec              = 1e9;          % Dielectric frequency specification, Hz
pcb_substrate               = dielectric(Name="BLDC_PCB",...
                                         EpsilonR=relative_dielectric_const,...
                                         LossTangent=dielectric_loss, ...
                                         Thickness=layer_1_thickness,...
                                         Frequency=frequency_spec); % Substrate




% Single Via with single ground_return


signal_via_location         = [via_1_location 1 3];
ground_return_location      = [gnd_return_locations(1,:) 1 3];
via_ports = {1 1 via_diameter "Vertical"; 1 3 via_diameter "Vertical"};


vi_sim_obj = viaSingleEnded(...
                            "SignalLayer",[1 3],...
                            "GroundLayer",[1 3],...
                            "Substrate",pcb_substrate,...
                            "SignalViaLocations",signal_via_location,...
                            "SignalViaDiameter",via_diameter,...
                            "SignalViaFinishedDiameter",0.9*via_diameter,...
                            "SignalViaPad",v_signal_via_pad,...
                            "SignalViaAntipad",v_signal_via_clearence,...
                            "GroundReturnViaLocations",ground_return_location,...
                            "GroundReturnViaDiameter",gnd_via_diameter,...
                            "GroundReturnViaFinishedDiameter",0.9*gnd_via_diameter,...
                            "SignalTable",via_ports);

fig_1 = figure;
show(vi_sim_obj)


