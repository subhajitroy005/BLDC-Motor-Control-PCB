trace1 = traceLine;
trace1.Length = [10 5*sqrt(2) 10 5*sqrt(2) 10]*1e-3;
trace1.Angle  = [0 45 0 -45 0];
trace1.Width  = 3e-3;
trace1.Corner = "Miter";
trace2 = copy(trace1);
trace2.Length = [11 6*sqrt(2) 6 6*sqrt(2) 11]*1e-3;
trace2 = translate(trace2, [0,-5e-3,0]);
trace = trace1 + trace2 ;

figure(1)
show(trace);

pcb = pcbComponent;
d = dielectric("Teflon");
d.Thickness = pcb.BoardThickness;
groundplane = traceRectangular(Length=40e-3,Width=40e-3,Center=[40e-3/2,0]);
pcb.Layers = {trace,d,groundplane};
pcb.FeedLocations = [0,0,1,3;40e-3,0,1,3;40e-3,-5e-3,1,3;0e-3,-5e-3,1,3];
pcb.BoardShape = groundplane;
pcb.FeedDiameter = trace1.Width/2;

figure(2)
show(pcb)

figure(3)
current(pcb,1e9,scale="log");

% spar = sparameters(pcb,linspace(1e3,10e3,51));
% figure(4)
% rfplot(spar,2:4,1)