class UserList {
  int? id;
  String? profileName;
  String? party;
  String? description;
  String? profileLink;
  String? place;
  String? mobileNo;

  UserList(
      {this.id,
      this.profileName,
      this.party,
      this.description,
      this.profileLink,
      this.place,
      this.mobileNo});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    profileName = json['Profile Name'];
    party = json['Party'];
    description = json['Description'];
    profileLink = json['Profile link'];
    place = json['Place'];
    mobileNo = json['Mobile No.'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['Profile Name'] = this.profileName;
    data['Party'] = this.party;
    data['Description'] = this.description;
    data['Profile link'] = this.profileLink;
    data['Place'] = this.place;
    data['Mobile No.'] = this.mobileNo;
    return data;
  }
}
