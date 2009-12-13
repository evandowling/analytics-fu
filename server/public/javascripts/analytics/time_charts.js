var TimeCharts = {
  timeChart: function(opts) {
    var div = opts.containerId || 'chartDiv';
    var width = opts.width || '500px';
    var height = opts.height || '300px';
    var format = opts.format || '%m-%d-%y';
    var fixedPosition = opts.fixedPosition || false;
    var onHit = opts.onHit || function(e){};
    var onMove = opts.onMove || function(e){};
    var onClick = opts.onClick || function(e) {};
    var data = opts.data || [];
    var chartDiv = $(div);
        chartDiv.setStyle({
        width: width,
        height: height
    });

    var chart = new Proto.Chart($(div),
                                    data,
                                    {
                                        xaxis: { mode: "time", timeformat: format},
                                        clickable: true,
                                        mouse: { track: true, fixedPosition: fixedPosition }
                                    });
    chartDiv.observe('ProtoChart:hit',onHit);
    chartDiv.observe('ProtoChart:mousemove',onMove);
    chartDiv.observe('ProtoChart:mouseclick',onClick);
    return {
      chart: {
        chartObject: chart,
        data: data,
        format: format,

      },
      container: {
        chartDiv: chartDiv,
      },
      events: {
        onHit: onHit,
        onMove: onMove,
        onClick: onClick
      }
    };
  }

}
