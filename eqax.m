function eqax
% adjusts the axes to equal scale and length
% if it is a scatter plot it limits it to the extreme values

xlim_ = get(gca, 'xlim');
ylim_ = get(gca, 'ylim');



try % scatter plot
    
    objs = findobj(gca, 'Type', 'Scatter');
    minx = min(horzcat(objs.XData));
    maxx = max(horzcat(objs.XData));
    
    miny = min(horzcat(objs.YData));
    maxy = max(horzcat(objs.YData));
    
    set(gca, 'XLim', [ min(minx, miny) max(maxx, maxy) ], ...
        'YLim', [ min(minx, miny) max(maxx, maxy) ]);
    
catch % other plot
    
    minx = min(xlim_);
    maxx = max(xlim_);
    
    miny = min(ylim_);
    maxy = max(ylim_);
    
    set(gca, 'xlim', [ min(minx, miny) max(maxx, maxy) ], ...
        'ylim', [ min(minx, miny) max(maxx, maxy) ]);
end
