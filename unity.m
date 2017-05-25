function u = unity()
% plots a unity line in the current axis

hold on;
ax = gca; 
xlim_ = ax.XLim;
ylim_ = ax.YLim;


if strcmp(ax.XScale, 'linear') && strcmp(ax.YScale, 'log')
    u = plot(ylim_, ylim_, '-k', 'LineWidth', 0.5);
else
    u = plot(xlim_, xlim_, '-k', 'LineWidth', 0.5);
end

u.Color = [0 0 0 0.4]; % make the unity line transparent
uistack(ax.Children(1), 'bottom'); % push to background
