class SalesData {
  final DateTime month;
  final int sales;
  final double profitRate;

  SalesData({
    required this.month,
    required this.sales,
    required this.profitRate,
  });
}

final dummySalesData = <SalesData>[
  SalesData(month: DateTime(2024, 1), sales: 120, profitRate: 0.12),
  SalesData(month: DateTime(2024, 2), sales: 140, profitRate: 0.15),
  SalesData(month: DateTime(2024, 3), sales: 100, profitRate: 0.09),
  SalesData(month: DateTime(2024, 4), sales: 160, profitRate: 0.18),
  SalesData(month: DateTime(2024, 5), sales: 170, profitRate: 0.20),
  SalesData(month: DateTime(2024, 6), sales: 130, profitRate: 0.11),
  SalesData(month: DateTime(2024, 7), sales: 190, profitRate: 0.22),
  SalesData(month: DateTime(2024, 8), sales: 200, profitRate: 0.21),
  SalesData(month: DateTime(2024, 9), sales: 180, profitRate: 0.19),
  SalesData(month: DateTime(2024, 10), sales: 210, profitRate: 0.23),
  SalesData(month: DateTime(2024, 11), sales: 230, profitRate: 0.25),
  SalesData(month: DateTime(2024, 12), sales: 250, profitRate: 0.27),
];
