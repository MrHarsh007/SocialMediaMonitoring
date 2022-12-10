class ChannelList {
  String? channelName;
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? website;
  String? mobileNo;

  ChannelList(
      {this.channelName,
      this.facebook,
      this.twitter,
      this.instagram,
      this.youtube,
      this.website,
      this.mobileNo});

  ChannelList.fromJson(Map<String, dynamic> json) {
    channelName = json['Channel Name'];

    facebook = json['Facebook'];
    twitter = json['Twitter'];
    instagram = json['Instagram'];
    youtube = json['YouTube Channel'];
    website = json['Website'];
    mobileNo = json['Phone No.'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Channel Name'] = this.channelName;

    data['Facebook'] = this.facebook;
    data['Twitter'] = this.twitter;
    data['Instagram'] = this.instagram;
    data['YouTube Channel'] = this.youtube;
    data['Website'] = this.website;
    data['Phone No.'] = this.mobileNo;
    return data;
  }
}
