class Donor {
  final String name;
  final String place;
  final String exactLocation;
  final String dob;
  final String phone;
  final String bloodType;
  final String proffession;
  final String? workingIn;

  Donor({
    required this.name,
    required this.place,
    required this.exactLocation,
    required this.dob,
    required this.phone,
    required this.bloodType,
    required this.proffession,
    this.workingIn,
  });
}
