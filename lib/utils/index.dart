String formatDuration(Duration? duration) {
  if (duration == null) return "00:00:00";
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  if (hours != "00") {
    return "$hours:$minutes:$seconds";
  }
  return "$minutes:$seconds";
}
