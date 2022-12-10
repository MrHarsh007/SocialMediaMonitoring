class BjpMlaUserList {
  String? assemblySeat;
  String? assemblyName;
  String? candidateName;
  String? facebookLink;
  String? twitterLink;
  String? mobileNo;
  String? designation;
  String? place;

  BjpMlaUserList(
      {this.assemblySeat,
      this.assemblyName,
      this.candidateName,
      this.facebookLink,
      this.twitterLink,
      this.designation,
      this.place,
      this.mobileNo});

  BjpMlaUserList.fromJson(Map<String, dynamic> json) {
    assemblySeat = json['ASSEMBLY SEAT NO'];

    assemblyName = json['ASSEMBLY NAME'];
    candidateName = json['CANDIDATE NAME'];
    facebookLink = json['Facebook Profile Link'];
    twitterLink = json['Twitter link'];
    designation = json['Designation'];
    place = json['Place'];

    mobileNo = json['Mobile No.'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ASSEMBLY SEAT NO'] = this.assemblySeat;

    data['ASSEMBLY NAME'] = this.assemblyName;
    data['CANDIDATE NAME'] = this.candidateName;
    data['Facebook Profile Link'] = this.facebookLink;
    data['Twitter link'] = this.twitterLink;
    data['Designation'] = this.designation;
    data['Place'] = this.place;

    data['Mobile No.'] = this.mobileNo;
    return data;
  }
}
