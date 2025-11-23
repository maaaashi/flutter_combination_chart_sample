import 'package:flutter/material.dart';
import 'package:flutter_combination_chart_sample/data.dart';
import 'package:flutter_combination_chart_sample/ui/layout.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionFlutterChartPage extends StatelessWidget {
  const SyncfusionFlutterChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Syncfusion Flutter Chart Example',
      body: _SyncfusionChartView(),
    );
  }
}

class _SyncfusionChartView extends StatelessWidget {
  const _SyncfusionChartView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SfCartesianChart(
        title: ChartTitle(text: '売上推移'),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),

        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(title: AxisTitle(text: '売上高')),

        axes: <ChartAxis>[
          NumericAxis(
            name: 'profitAxis',
            title: AxisTitle(text: '営業利益率 (%)'),
            minimum: 0,
            opposedPosition: true,
          ),
        ],
        series: <CartesianSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
            dataSource: dummySalesData,
            xValueMapper: (SalesData sales, _) => sales.month.toString(),
            yValueMapper: (SalesData sales, _) => sales.profitRate,
            name: '営業利益率',
            yAxisName: 'profitAxis',
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
          BarSeries(
            dataSource: dummySalesData,
            xValueMapper: (SalesData sales, _) => sales.month.toString(),
            yValueMapper: (SalesData sales, _) => sales.sales,
            name: '売上高',
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
