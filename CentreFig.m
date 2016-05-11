function pos = CentreFig(varargin)
%CENTREFIG Provides values for figure('Position',[x,y,w,h]) which centres
%the figure in the display.
%
%   Usage: figure('Position',CentreFig(w,h))
%   or     figure('OuterPosition',CentreFig(w,h))
%
%   [x,y,w,h] = CentreFig provides the position values for the default
%   width, w = 560, and height, h = 420.
%
%   [x,y,w,h] = CentreFig(w) provides the position values for a square
%   figure with side w.
%
%   [x,y,w,h] = CentreFig(w,h) provides the position values for a figure
%   with width w and height h.

switch nargin
    case 0
        w = 560;    h = 420;
    case 1
        w = varargin{1};
        h = varargin{1};
    case 2
        w = varargin{1};
        h = varargin{2};
    otherwise
        error('Number of input arguments cannot be greater than 2.')
end

% Obtain screen dimensions
scrsz = get(0,'Screensize');
S = scrsz(3:4);

% Make sure figure fits in screen
D = [w h];
D = S.*(D > S) + D.*(D <= S);
w = D(1);   h = D(2);

% Get position of bottom-left corner
x = (S(1)-w)/2;
y = (S(2)-h)/2;

% Output position properties
pos = [x y w h];

