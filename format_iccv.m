function [ opt ] = format_iccv( tgt )
%FORMAT_ICCV Apply ICCV conference paper style formatting
%   tgt: object to set default formatting on. Can be a figure or axes. If
%        unspecified, the default settings are written to 'groot' (i.e.
%        applied globally).
%        Set to [] if you do not want to apply the formatting but only want
%        to get the opt struct.
%
%   Returns:
%   opt: structure with additional settings (e.g. figure sizes) that can be
%        applied to the figure using 'set(fig, opt.xxx)'
%
%
%   Example usage:
%       % *start of script*
%       figure;
%       opt = format_tudelft_report(gcf); % Only applies format to this
%                                         % figure, default settings are
%                                         % unaffected.
%       % Note: use 'opt = format_tudelft_report;' without arguments to set
%       % the default for *all* future figures. This is the easiest option
%       % to use, but because the formatting is persistent it can cause
%       % some unexpected results if you run other code afterwards.
%
%       % *draw your figure here, do cool stuff*
%
%       set(gcf, opt.size.full);        % Set different size if the default
%                                       % is too big or small.
%       drawnow;                        % Force MATLAB to redraw the figure,
%                                       % solves some saving bugs.
%       saveas('my_awesome_figure', opt.format); % Use the recommended
%                                                % format for saving as
%                                                % this depends on the
%                                                % journal!

% Use 'get(groot, 'factory')' to get an overview of tunable settings,
% replace 'factory' by 'default' to get the right field name.

% Set default axes formatting
x.defaultAxesBox = 'off'; % Note: currently ignored/overwritten by plot :/

% Set default fonts
% From example document: "Resize fonts in figures to match the font in the
% body text" (body text is Times, 10pt)
if ~ismember('Times', listfonts)
    warning('Font ''Times'' is not available.');
end
x.defaultAxesFontName = 'Times';
x.defaultAxesFontSize = 10; 
x.defaultAxesLabelFontSizeMultiplier = 1.0;
x.defaultAxesTitleFontSizeMultiplier = 1.0;
x.defaultLegendFontName = 'Times';
x.defaultLegendFontSize = 10;
x.defaultTextFontName = 'Times';
x.defaultTextFontSize = 10;

% Figure sizes
aspect_ratio = 8 / 6; % Default MATLAB aspect ratio
textwidth   = 17.5; % Text area width in cm
columnwidth = 8.25; % Single column width in cm

opt.size.column = figure_size(columnwidth, columnwidth / aspect_ratio);
opt.size.full = figure_size(textwidth, textwidth / aspect_ratio);
opt.size.wide = figure_size(textwidth, columnwidth / aspect_ratio);

% Set default figure size
d = opt.size.column;
x.defaultFigurePaperPositionMode = d.PaperPositionMode;
x.defaultFigurePaperUnits = d.PaperUnits;
x.defaultFigurePaperSize = d.PaperSize;
x.defaultFigurePaperPosition = d.PaperPosition;
x.defaultFigureUnits = d.Units;
x.defaultFigurePosition = d.Position;

% Figure format
opt.format = 'pdf'; % pdf works reliably in LaTeX, recommended format for saveas. Some problems with fonts, though...

% Optional color schemes
% Apply to figure/axes before plotting
opt.color.blackmarkers.defaultAxesColorOrder = [0, 0, 0];
opt.color.blackmarkers.defaultAxesLineStyleOrder = {'-o', '-s', '-d', '-^', '-v'};
opt.color.blackmarkers.defaultLineMarkerFaceColor = [1, 1, 1];

% Apply default settings
if nargin < 1
    tgt = groot;
end
if ~isempty(tgt)
    set(tgt, x);
end

end


function [ s ] = figure_size(w, h)
s.PaperPositionMode = 'manual';
s.PaperUnits = 'centimeters';
s.PaperSize = [w, h];
s.PaperPosition = [0.0, 0.0, w, h];
s.Units = 'centimeters';
s.Position = [10.0, 10.0, w, h];
end

