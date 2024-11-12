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
pcb_stackup_comp.Layer1             = dielectric('Teflon');
pcb_stackup_comp.Layer1.Thickness   = 0.001;
pcb_stackup_comp.Layer3             = dielectric('Teflon');
pcb_stackup_comp.Layer5             = dielectric('Teflon');

pcb_stackup_comp.Layer2             = path_top_layer_gbr_file;
pcb_stackup_comp.Layer4             = path_button_layer_gbr_file;

pcb_read_comp = PCBReader('StackUp',pcb_stackup_comp);



% Pcb read ocmponent to PCBcomponent conversion 
complete_pcb_comp = pcbComponent(pcb_read_comp);

figure(1)
show(complete_pcb_comp)

%Feeding and other signal properties
% complete_pcb_comp.FeedLocations     = [0,0,1,3;40e-3,0,1,3;40e-3,-10e-3,1,3;0e-3,-10e-3,1,3];
% complete_pcb_comp.FeedDiameter      = trace_1.Width/2;

% figure(4)
% show(s)
pcb_stackup_comp
complete_pcb_comp



% Analysis part ===============================================

figure(3)
current(complete_pcb_comp,1e9,scale="log");











% s=sparameters(pcb,linspace(2e3,5e9,20));
% 
% rfplot(s)