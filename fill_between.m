function [ varargout ] = fill_between( x1, y1, x2, y2, c, varargin )
%FILL_BETWEEN Shade area between two curves

X = [x1, fliplr(x2)];
Y = [y1, fliplr(y2)];
[varargout{1:nargout}] = fill(X, Y, c, varargin{:});

end

