class AppDateUtils {
  static String formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final taskDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (taskDate == today) {
      return 'Today at ${formatTime(dateTime)}';
    } else if (taskDate == today.add(const Duration(days: 1))) {
      return 'Tomorrow at ${formatTime(dateTime)}';
    } else {
      return '${formatDate(dateTime)} at ${formatTime(dateTime)}';
    }
  }

  static String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
