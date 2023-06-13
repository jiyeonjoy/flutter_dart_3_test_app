extension DescribeDate on DateTime {
  void describe() {
    final now = DateTime.now();
    final difference = this.difference(DateTime(now.year, now.month, now.day));

    String description = switch (difference) {
      Duration(inDays: 0) => 'today',
      Duration(inDays: -1) => 'yesterday',
      Duration(inDays: 1) => 'tomorrow',
      Duration(inDays: int d, isNegative: false) => '$d days from now',
      Duration(inDays: int d, isNegative: true) => '${d.abs()} days ago',
    };

    String description2 = switch (difference) {
      Duration(inDays: int d) =>
        d == 0 ? 'today' :
            d == 1 ? 'tomorrow' :
                d == -1 ? 'yesterday' :
                    d > 0 ? '$d days from now' :
                    '${-d} days ago'
    };

    print('$year/$month/$day $description');
  }
}

main() {
  DateTime(2023, 5, 6).describe();
  DateTime(2023, 6, 12).describe();
  DateTime(2023, 6, 13).describe();
  DateTime(2023, 6, 14).describe();
  DateTime(2023, 6, 30).describe();
}
