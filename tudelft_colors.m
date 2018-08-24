function [ cols, colororder ] = tudelft_colors(  )
%TUDELFT_COLORS Generate table of TU Delft style guide colors
%   cols: struct with colors by name
%   colororder: Mx3 color order matrix for use with plotting

% Color values and names copied from the LaTeX report template:
% Removed because they seem incorrect. Either outdated or the CMYK to RGB
% converter I used is wrong.
% cols.cyan =         [0,     255,    255];
% cols.black =        [0,     0,      0];
% cols.white =        [255,   255,    255];
% cols.seagreen =     [117,   255,    173];
% cols.green =        [0,     217,    153];
% cols.darkblue =     [0,     52,     153];
% cols.purple =       [3,     0,      166];
% cols.turquoise =    [42,    235,    185];
% cols.skyblue =      [132,   240,    225];
% cols.lavendel =     [130,   190,    237];
% cols.orange =       [250,   112,    41];
% cols.warmpurple =   [105,   0,      250];
% cols.fuchsia =      [167,   0,      207];
% cols.brightgreen =  [163,   255,    0];
% cols.yellow =       [250,   255,    117];

% Color values and names copied from the 'Huisstijl' web page:
cols.cyan =         [0,     166,    214]    / 255;
cols.black =        [0,     0,      0]      / 255;
cols.white =        [255,   255,    255]    / 255;
cols.skyblue =      [110,   187,    213]    / 255;
cols.purple =       [29,    28,     115]    / 255;
cols.orange =       [230,   70,     22]     / 255;
cols.yellow =       [225,   196,    0]      / 255;
cols.red =          [226,   26,     26]     / 255;
cols.green =        [0,     136,    145]    / 255; % Note: more like turquoise
cols.brightgreen =  [165,   202,    26]     / 255;
cols.warmpurple =   [109,   23,     127]    / 255;
cols.seagreen =     [107,   134,    137]    / 255;

cols.gray =         [100,   100,    100]    / 255; % Note: not an offical color

% Color order picked to stay close to MATLAB's
colororder = [
    cols.cyan;
    cols.orange;
    cols.yellow;
    cols.warmpurple;
    cols.brightgreen;
    cols.skyblue;
    cols.red;
];

end

