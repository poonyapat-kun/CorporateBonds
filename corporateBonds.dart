import 'dart:io';

main() {
  print("กรุณาป้อนข้อมูลหุ้นกู้ : ");
  String? bondName = stdin.readLineSync();
  print("กรุณาป้อนจำนวนเงินลงทุน(บาท) : ");
  int? principle = int.parse(stdin.readLineSync()!);
  print("กรุณาป้อนอัตราดอกเบี้ย(%) : ");
  double? yield = double.parse(stdin.readLineSync()!);
  print("กรุณาป้อนระยะเวลาหุ้นกู้(วัน) : ");
  num? duration = num.parse(stdin.readLineSync()!);
  var now = DateTime.now();
  var year = now.year;
  var leapYear = isLeapYear(year);
  var calendarDay;
  if (leapYear) {
    calendarDay = 366;
  } else {
    calendarDay = 365;
  }
  var interest =
      ((principle / 100) * (yield / calendarDay) * duration).toStringAsFixed(2);
  print(
      "คุณได้รับดอกเบี้ยจำนวน $interest บาท จากหุ้นกู้ $bondName จำนวนเงินลงทุน $principle ด้วยอัตราดอกเบี้ย $yield");
}

bool isLeapYear(int AD) {
  if (((AD % 4 == 0) && (AD % 100 != 0)) || (AD % 400 == 0)) {
    return true;
  } else {
    return false;
  }
}
