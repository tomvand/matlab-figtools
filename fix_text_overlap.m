function [  ] = fix_text_overlap( ax )
%FIX_TEXT_OVERLAP Fix overlapping text in axis
%   This function will shift text objects in ax until they no longer
%   overlap. Text can shift in directions for which their alignment is set
%   to 'center' or 'middle'.
%   Note: only works for 2D plots.

N = 100; % Max number of iterations
delta = 0.03; % Distance to move

t = findobj(ax, 'Type', 'text'); % Get all text objects

n_overlap = 1;
while N > 0 && n_overlap > 0
    % Find overlapping text
    boxes = cat(1, t.Extent);
    overlap = bboxOverlapRatio(boxes, boxes);
    n_overlap = (sum(overlap(:) ~= 0) - length(t)) / 2;
    N = N - 1;
    % Find out where to shift text (do not apply yet, need to move
    % simultaneously)
    shift = zeros(length(t), 3);
    for i = 1:length(t)
        for j = 1:length(t)
            if overlap(i,j) ~= 0 && i ~= j
                % Texts i and j overlap
                dof = [strcmpi(t(i).HorizontalAlignment, 'center'), ...
                    strcmpi(t(i).VerticalAlignment, 'middle'), ...
                    0];
                d = t(i).Position - t(j).Position;
                shift(i,:) = delta .* dof .* d;
            end
        end
    end
    % Shift text
    for i = 1:length(t)
        t(i).Position = t(i).Position + shift(i,:);
    end
%     drawnow; % For debugging
end

drawnow;

end

