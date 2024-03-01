class Booking {
  Booking(
      {required this.bookingId,
      required this.startTime,
      required this.endTime,
      required this.amount,
      required this.location});
  String bookingId;
  DateTime startTime;
  DateTime endTime;
  double amount;
  String location;
}
