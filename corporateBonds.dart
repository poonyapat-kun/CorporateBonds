import 'dart:io';

main() {
  print("กรุณาป้อนข้อมูลหุ้นกู้ : ");
  String? bondName = stdin.readLineSync();
  print("กรุณาป้อนจำนวนเงินลงทุน(บาท) : ");
  int? principle = int.parse(stdin.readLineSync()!);
  print("กรุณาป้อนอัตราดอกเบี้ย(%) : ");
  double? yield = double.parse(stdin.readLineSync()!);
  print("กรุณาป้อนวันที่เริ่มคิดดอกเบี้ย : (วว/ดด/25ปป) : ");
  String? start = stdin.readLineSync();
  print("กรุณาป้อนวันที่สุดท้ายที่คิดดอกเบี้ย : (วว/ดด/25ปป) : ");
  String? end = stdin.readLineSync();
  var startDay = start!.substring(0, 2);
  var startMonth = start.substring(3, 5);
  var startYear = start.substring(6, 10);
  int adStartYear = int.parse(startYear) - 543;
  var endDay = end!.substring(0, 2);
  var endMonth = end.substring(3, 5);
  var endYear = end.substring(6, 10);
  int adEndYear = int.parse(endYear) - 543;
  print(startDay);
  print(startMonth);
  print(adStartYear);
  print(endDay);
  print(endMonth);
  print(adEndYear);
//   var leapYear = isLeapYear(year);
//   var calendarDay;
//   if (leapYear) {
//     calendarDay = 366;
//   } else {
//     calendarDay = 365;
//   }
//   var interest =
//       ((principle / 100) * (yield / calendarDay) * duration).toStringAsFixed(2);
//   print(
//       "คุณได้รับดอกเบี้ยจำนวน $interest บาท จากหุ้นกู้ $bondName จำนวนเงินลงทุน $principle ด้วยอัตราดอกเบี้ย $yield");
// }

// bool isLeapYear(int AD) {
//   if (((AD % 4 == 0) && (AD % 100 != 0)) || (AD % 400 == 0)) {
//     return true;
//   } else {
//     return false;
//   }
}
