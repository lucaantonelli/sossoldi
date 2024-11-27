import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../constants/style.dart';
import '../../../../providers/categories_provider.dart';
import '../../../../providers/transactions_provider.dart';

final highlightedMonthProvider =
    StateProvider<int>((ref) => DateTime.now().month - 1);

class CategoriesBarChart extends ConsumerWidget {
  const CategoriesBarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlightedMonth = ref.watch(highlightedMonthProvider);
    final monthlyTotals =
        ref.watch(monthlyTotalsProvider(ref.watch(categoryTypeProvider)));
    final startDate = ref.watch(filterDateStartProvider);

    final currentYear = startDate.year;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '$currentYear',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        monthlyTotals.when(
          data: (totals) {
            final maxAmount = totals.isNotEmpty
                ? totals.reduce((a, b) => a > b ? a : b)
                : 1.0;

            final average =
                totals.isNotEmpty ? totals.reduce((a, b) => a + b) / 12 : 0.0;

            return SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: _generateBarGroups(totals, highlightedMonth),
                  titlesData: _titlesData(),
                  barTouchData: _barTouchData(ref, currentYear),
                  borderData: FlBorderData(show: false),
                  extraLinesData: ExtraLinesData(horizontalLines: [
                    HorizontalLine(
                      y: (average / maxAmount) * 200.0,
                      color: blue2,
                      strokeWidth: 2,
                      dashArray: [5, 5],
                      label: HorizontalLineLabel(
                        show: true,
                        labelResolver: (line) => "avg",
                        alignment: Alignment.topRight,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: blue2),
                      ),
                    ),
                  ]),
                ),
              ),
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (error, stack) => Text('$error'),
        ),
      ],
    );
  }

  List<BarChartGroupData> _generateBarGroups(
      List<double> totals, int highlightedMonth) {
    const rodBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(5),
      topRight: Radius.circular(5),
    );

    final maxAmount =
        totals.isNotEmpty ? totals.reduce((a, b) => a > b ? a : b) : 1.0;

    return List.generate(12, (index) {
      final barHeight =
          maxAmount > 0 ? (totals[index] / maxAmount) * 200.0 : 0.0;
      final isHighlighted = index == highlightedMonth;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: barHeight,
            width: 20,
            borderRadius: rodBorderRadius,
            color: isHighlighted ? blue2 : grey2,
          ),
        ],
      );
    });
  }

  FlTitlesData _titlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                DateFormat('MMM').format(DateTime(0, value.toInt() + 1)),
                style: const TextStyle(color: Colors.black, fontSize: 10),
              ),
            );
          },
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  BarTouchData _barTouchData(WidgetRef ref, int currentYear) {
    return BarTouchData(
      enabled: true,
      handleBuiltInTouches: true,
      touchTooltipData: BarTouchTooltipData(
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 0,
        getTooltipItem: (group, groupIndex, rod, rodIndex) =>
            null, // Hidden tooltip
      ),
      touchCallback: (event, response) {
        if (response != null &&
            response.spot != null &&
            event is FlTapUpEvent) {
          final selectedMonthIndex = response.spot!.touchedBarGroup.x;
          ref.read(highlightedMonthProvider.notifier).state =
              selectedMonthIndex;
          _updateSelectedMonth(ref, currentYear, selectedMonthIndex);
        }
      },
    );
  }

  void _updateSelectedMonth(WidgetRef ref, int year, int monthIndex) {
    final selectedMonth = DateTime(year, monthIndex + 1, 1);
    ref.read(filterDateStartProvider.notifier).state =
        DateTime(selectedMonth.year, selectedMonth.month, 1);
    ref.read(filterDateEndProvider.notifier).state =
        DateTime(selectedMonth.year, selectedMonth.month + 1, 0);
  }
}