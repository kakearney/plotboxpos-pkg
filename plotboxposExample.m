% plotboxpos example

h.ax(1) = axes('color', 'none');
h.ex = rectangle('position', [0 0 1 1], 'curvature', [1 1]);
axis tight equal;

pos1 = get(h.ax(1), 'position');
pos2 = plotboxpos(h.ax(1));

h.ax(2) = axes('position', [0 0 1 1]);
h.r(1) = rectangle('position', pos1);
h.r(2) = rectangle('position', pos2);
set(h.r, {'edgecolor'}, {'b';'r'});
set(h.r, 'linestyle', '--');
hold on;
h.ln = plot(NaN, NaN, '--b', NaN, NaN, '--r');
lbl = {'get(gca, ''position'')', 'plotboxpos(gca)'};
legendflex(h.ln, lbl, 'ref', h.ax(2), 'box', 'off', 'buffer', [0 0], 'nrow', 1);
set(h.ax(2), 'visible', 'off', 'xlim', [0 1], 'ylim', [0 1]);

cmd = {'rectangle(''position'', [0 0 1 1], ...', ...
       '          ''curvature'', [1 1]);', ...
       'axis tight equal;'};
axes(h.ax(1));
text(.2, .5, cmd, 'horiz', 'left', 'fontname', 'courier');

export_fig('plotboxposExample', gcf, '-png', '-nocrop');