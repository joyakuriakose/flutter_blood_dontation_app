// To parse this JSON data, do
//
//     final donor = donorFromJson(jsonString);





class Donor {
    Donor({
        required this.name,
        required this.place,
        required this.exactLocation,
        required this.dob,
        required this.phone,
        required this.bloodType,
        required this.profession,
        this.workingIn,
    });

    String name;
    String place;
    String exactLocation;
    String dob;
    String phone;
    String bloodType;
    String profession;
    String? workingIn;

    factory Donor.fromJson(Map<String, dynamic> json) => Donor(
        name: json["name"],
        place: json["place"],
        exactLocation: json["exact_location"],
        dob: json["dob"],
        phone: json["phone"],
        bloodType: json["blood_type"],
        profession: json["profession"],
        workingIn: json["working_in"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "place": place,
        "exact_location": exactLocation,
        "dob": dob,
        "phone": phone,
        "blood_type": bloodType,
        "profession": profession,
        "working_in": workingIn,
    };
}
