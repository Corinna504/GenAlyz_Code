function crossl
% plots a cross indicating the origin according to linear or log spaced axes in 2D.

hold on;
ax = gca;

% determine the intersection of the cross
if strcmp(ax.XScale, 'log')
    x = [1 1]; 
else
    x = [0 0]; 
end

if strcmp(ax.YScale, 'log')
    y = [1 1];
else
    y = [0 0];
end

% plot the cross 
hor = plot(ax.XLim, y, 'k-', 'LineWidth', 0.5); % horizontal line
vert = plot(x, ax.YLim, 'k-', 'LineWidth', 0.5); % vertical line

% make the cross transparent ...
hor.Color = [0 0 0 0.4];
vert.Color = [0 0 0 0.4];
% ... and push it to the background
try
    uistack(ax.Children(1:2), 'bottom');
catch
%     disp('are you using two yaxes? This is a problem for the uistack function.');
end
