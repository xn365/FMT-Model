function cellInfo = External_Pos_Bus(varargin) 
% EXTERNAL_POS_BUS returns a cell array containing bus object information 
% 
% Optional Input: 'false' will suppress a call to Simulink.Bus.cellToObject 
%                 when the MATLAB file is executed. 
% The order of bus element attributes is as follows:
%   ElementName, Dimensions, DataType, SampleTime, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description 

suppressObject = false; 
if nargin == 1 && islogical(varargin{1}) && varargin{1} == false 
    suppressObject = true; 
elseif nargin > 1 
    error('Invalid input argument(s) encountered'); 
end 

cellInfo = { ... 
  { ... 
    'External_Pos_Bus', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', {... 
{'timestamp', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('ms'), ''}; ...
{'field_valid', 1, 'uint32', -1, 'real', 'Sample', 'Fixed', [], [], '', sprintf('field bit valid:\n0: pos(xy) valid\n1: height(z) valid\n2: attitude(roll/pitch) valid\n3: heading(yaw) valid')}; ...
{'x', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('m'), sprintf('Local position X')}; ...
{'y', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('m'), sprintf('Local position Y')}; ...
{'z', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('m'), sprintf('Local position Z')}; ...
{'phi', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('rad'), sprintf('roll angle')}; ...
{'theta', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('rad'), sprintf('pitch angle')}; ...
{'psi', 1, 'single', -1, 'real', 'Sample', 'Fixed', [], [], sprintf('rad'), sprintf('yaw angle')}; ...
    } ...
  } ...
}'; 

if ~suppressObject 
    % Create bus objects in the MATLAB base workspace 
    Simulink.Bus.cellToObject(cellInfo) 
end 