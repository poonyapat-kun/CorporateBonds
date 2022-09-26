import 'dart:io';

main() {
  bool isLeapYear(double AD) {
    if (((AD % 4 == 0) && (AD % 100 != 0)) || (AD % 400 == 0)) {
      return true;
    } else {
      return false;
    }
  }

  print("กรุณาป้อนข้อมูลหุ้นกู้ : ");
  String? bondName = stdin.readLineSync();
  print("กรุณาป้อนจำนวนเงินลงทุน(บาท) : ");
  double? principle = double.parse(stdin.readLineSync()!);
  print("กรุณาป้อนอัตราดอกเบี้ย(%) : ");
  double? yield = double.parse(stdin.readLineSync()!);
  print("กรุณาป้อนวันที่เริ่มคิดดอกเบี้ย : (วว/ดด/25ปป) : ");
  String? start = stdin.readLineSync();
  print("กรุณาป้อนวันที่สุดท้ายที่คิดดอกเบี้ย : (วว/ดด/25ปป) : ");
  String? end = stdin.readLineSync();
  String startDay = start!.substring(0, 2);
  String startMonth = start.substring(3, 5);
  String startYear = start.substring(6, 10);
  double adStartYear = double.parse(startYear) - 543.0;
  String endDay = end!.substring(0, 2);
  String endMonth = end.substring(3, 5);
  String endYear = end.substring(6, 10);
  double adEndYear = double.parse(endYear) - 543.0;

  if (adStartYear == adEndYear) {
    double year = adStartYear;
    DateTime start =
        DateTime(year.toInt(), int.parse(startMonth), int.parse(startDay));
    DateTime end =
        DateTime(year.toInt(), int.parse(endMonth), int.parse(endDay));
    Duration difference = end.difference(start);
    double days = (difference.inDays).toDouble() + 1.0;
    print("Day = $days");
    bool leapYear = isLeapYear(year);
    double calendarDay;
    if (leapYear)
      calendarDay = 366;
    else
      calendarDay = 365;
    var interest = (((principle / 100) * (yield / calendarDay) * days));
    var interestTwoDecimal = ((interest).toStringAsFixed(2));
    var earn = ((((principle / 100) * (yield / calendarDay) * days) * 0.85));
    var earnTwoDecimal = ((earn).toStringAsFixed(2));
    print(
        "คุณได้รับดอกเบี้ยจำนวน $interestTwoDecimal บาท ยอดหลังหักภาษี $earnTwoDecimal บาท จากหุ้นกู้ $bondName จำนวนเงินลงทุน $principle อัตราดอกเบี้ย $yield");
  } else if (adStartYear < adEndYear) {
    DateTime startFirst = DateTime(
        adStartYear.toInt(), int.parse(startMonth), int.parse(startDay));
    DateTime startSecond = DateTime(adStartYear.toInt(), 12, 31);
    Duration differenceFirstYear = startSecond.difference(startFirst);
    double dayFirstPart = (differenceFirstYear.inDays).toDouble() + 1.0;
    bool leapYearFirst = isLeapYear(adStartYear);
    double calendarDayFirst;
    if (leapYearFirst)
      calendarDayFirst = 366;
    else
      calendarDayFirst = 365;
    var interestFirst =
        ((principle / 100) * (yield / calendarDayFirst) * dayFirstPart);
    double interestFirstTwoDecimal =
        double.parse((interestFirst).toStringAsFixed(2));
    var earnFirst =
        (((principle / 100) * (yield / calendarDayFirst) * dayFirstPart) *
            0.85);
    double earnFirstTwoDecimal = double.parse((earnFirst).toStringAsFixed(2));
    DateTime endFirst =
        DateTime(adEndYear.toInt(), int.parse(endMonth), int.parse(endDay));
    DateTime endSecond = DateTime(adEndYear.toInt(), 01, 01);
    Duration differenceSecondYear = endFirst.difference(endSecond);
    double daySecondPart = (differenceSecondYear.inDays).toDouble() + 1.0;
    bool leapYearSecond = isLeapYear(adEndYear);
    double calendarDaySecond;
    if (leapYearSecond)
      calendarDaySecond = 366;
    else
      calendarDaySecond = 365;
    var interestSecond =
        ((principle / 100) * (yield / calendarDaySecond) * daySecondPart);
    double interestSecondTwoDecimal =
        double.parse((interestSecond).toStringAsFixed(2));
    var earnSecond =
        (((principle / 100) * (yield / calendarDaySecond) * daySecondPart) *
            0.85);
    double earnSecondTwoDecimal = double.parse((earnSecond).toStringAsFixed(2));
    var interest = interestFirstTwoDecimal + interestSecondTwoDecimal;
    var earn = earnFirstTwoDecimal + earnSecondTwoDecimal;
    print(
        "คุณได้รับดอกเบี้ยจำนวน $interest บาท ยอดหลังหักภาษี $earn บาท จากหุ้นกู้ $bondName จำนวนเงินลงทุน $principle อัตราดอกเบี้ย $yield");
  }
}
