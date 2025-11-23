import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_combination_chart_sample/data.dart';
import 'package:flutter_combination_chart_sample/ui/layout.dart';

class FlChartPage extends StatelessWidget {
  const FlChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: 'Fl Chart Example', body: _FlChartView());
  }
}

class _FlChartView extends StatelessWidget {
  const _FlChartView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(children: [_BarChart(), _LineChart()]),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    final maxSales = dummySalesData
        .map((e) => e.sales)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxSales + 50,
        barGroups: dummySalesData.asMap().entries.map((e) {
          final index = e.key;
          final d = e.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: d.sales.toDouble(),
                color: Colors.blue.withOpacity(0.7),
                width: 14,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          );
        }).toList(),
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final index = value.toInt();
                final month = dummySalesData[index].month.month;
                return Text('$month月', style: const TextStyle(fontSize: 11));
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 50,
              getTitlesWidget: (value, _) => Text(value.toInt().toString()),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(enabled: false),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart();

  @override
  Widget build(BuildContext context) {
    final maxProfit = dummySalesData
        .map((e) => e.profitRate)
        .reduce((a, b) => a > b ? a : b);
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: (maxProfit * 100) + 5,
        lineBarsData: [
          LineChartBarData(
            spots: dummySalesData
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value.profitRate * 100))
                .toList(),
            isCurved: false,
            color: Colors.red,
            dotData: const FlDotData(show: true),
            barWidth: 3,
          ),
        ],
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5,
              getTitlesWidget: (value, _) => Text('${value.toInt()}%'),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                final index = spot.x.toInt();
                final d = dummySalesData[index];
                return LineTooltipItem(
                  '${d.month.month}月\n'
                  '売上: ${d.sales}\n'
                  '利益率: ${(d.profitRate * 100).toStringAsFixed(1)}%',
                  const TextStyle(color: Colors.black),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
