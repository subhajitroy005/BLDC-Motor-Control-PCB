%{
Cross talk between traces


%}
%{
Paths and constrains 
%}
path_top_layer_gbr_file     = '../../High_Amp_PCB_Designs/KiCAD_Design/High_AMP_BLDC_Control/gbr/High_AMP_BLDC_Control-F_Cu.gtl';
path_button_layer_gbr_file  = '../../High_Amp_PCB_Designs/KiCAD_Design/High_AMP_BLDC_Control/gbr/High_AMP_BLDC_Control-B_Cu.gbl';

% -----------------------------------------------------------



% PCB Properties ---------------------------------------------
pcb_stackup_comp       = stackUp;
pcb_read_comp          = PCBReader('StackUp',pcb_stackup_comp);
complete_pcb_comp      = pcbComponent;



% Gerber read-> PCB Reader component 
% pcb_stackup_comp.Layer1             = dielectric('Teflon');
% pcb_stackup_comp.Layer1.Thickness   = 0.001;
pcb_stackup_comp.Layer3             = dielectric('Teflon');
% pcb_stackup_comp.Layer5             = dielectric('Teflon');

pcb_stackup_comp.Layer2             = path_top_layer_gbr_file;
% pcb_stackup_comp.Layer4             = path_button_layer_gbr_file;

pcb_read_comp = PCBReader('StackUp',pcb_stackup_comp);

pcb_shape_component = shapes(pcb_read_comp);
% figure(1)
% show(pcb_shape_component)

% Pcb read ocmponent to PCBcomponent conversion 
complete_pcb_comp = pcbComponent(pcb_read_comp);
complete_pcb_comp.BoardThickness = 4e-3;


%Feeding and other signal properties
complete_pcb_comp.FeedLocations =      [83.1e-3 , -79.21e-3, 2;
                                        89.4e-3 , -80.02e-3, 2;
                                        83.1e-3 , -90.98e-3, 2;
                                        89.4e-3 , -91.34e-3, 2];
complete_pcb_comp.FeedDiameter      =   2e-3;

complete_pcb_comp
figure(4)
show(complete_pcb_comp)



% Analysis part ===============================================

figure(3)
current(complete_pcb_comp,1e9,scale="log");
layout(pcb);










% s=sparameters(pcb,linspace(2e3,5e9,20));
% 
% rfplot(s)