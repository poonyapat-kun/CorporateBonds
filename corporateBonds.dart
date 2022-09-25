import 'dart:io';

main() {
  bool isLeapYear(int AD) {
    if (((AD % 4 == 0) && (AD % 100 != 0)) || (AD % 400 == 0)) {
      return true;
    } else {
      return false;
    }
  }

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
  if (adStartYear == adEndYear) {
    int year = adStartYear = adEndYear;
    DateTime start =
        DateTime(adStartYear, int.parse(startMonth), int.parse(startDay));
    DateTime end = DateTime(adEndYear, int.parse(endMonth), int.parse(endDay));
    Duration difference = end.difference(start);
    int days = difference.inDays;
    bool leapYear = isLeapYear(year);
    int calendarDay;
    if (leapYear)
      calendarDay = 366;
    else
      calendarDay = 365;
    var interest =
        ((principle / 100) * (yield / calendarDay) * days).toStringAsFixed(2);
    var earn = (((principle / 100) * (yield / calendarDay) * days) * 0.85)
        .toStringAsFixed(2);
    print(
        "คุณได้รับดอกเบี้ยจำนวน $interest บาท ยอดหลังหักภาษี $earn บาท จากหุ้นกู้ $bondName จำนวนเงินลงทุน $principle อัตราดอกเบี้ย $yield");
  } else if (adStartYear < adEndYear) {
    DateTime startFirst =
        DateTime(adStartYear, int.parse(startMonth), int.parse(startDay));
    DateTime startSecond = DateTime(adStartYear, 12, 31);
    Duration differenceFirstYear = startSecond.difference(startFirst);
    int dayFirstPart = differenceFirstYear.inDays;
    bool leapYearFirst = isLeapYear(adStartYear);
    int calendarDayFirst;
    if (leapYearFirst)
      calendarDayFirst = 366;
    else
      calendarDayFirst = 365;
    var interestFirst =
        ((principle / 100) * (yield / calendarDayFirst) * dayFirstPart)
            .toStringAsFixed(2);
    var earnFirst =
        (((principle / 100) * (yield / calendarDayFirst) * dayFirstPart) * 0.85)
            .toStringAsFixed(2);
    DateTime endFirst =
        DateTime(adEndYear, int.parse(endMonth), int.parse(endDay));
    DateTime endSecond = DateTime(adEndYear, 01, 01);
    Duration differenceSecondYear = endFirst.difference(endSecond);
    int daySecondPart = differenceSecondYear.inDays;
    bool leapYearSecond = isLeapYear(adEndYear);
    int calendarDaySecond;
    if (leapYearSecond)
      calendarDaySecond = 366;
    else
      calendarDaySecond = 365;
    var interestSecond =
        ((principle / 100) * (yield / calendarDaySecond) * daySecondPart)
            .toStringAsFixed(2);
    var earnSecond =
        (((principle / 100) * (yield / calendarDaySecond) * daySecondPart) *
                0.85)
            .toStringAsFixed(2);
    var interest = interestFirst + interestSecond;
    var earn = earnFirst + earnSecond;
    print(
        "คุณได้รับดอกเบี้ยจำนวน $interest บาท ยอดหลังหักภาษี $earn บาท จากหุ้นกู้ $bondName จำนวนเงินลงทุน $principle อัตราดอกเบี้ย $yield");
  }
}
