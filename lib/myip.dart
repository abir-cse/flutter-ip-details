class myip {
  final ip;
  final country;
  final city;
  final lat;
  final lon;
  final isp;
  final org;
  final isp_as;
  myip ({this.ip, this.country, this.city, this.lat, this.lon, this.isp, this.org, this.isp_as});
  factory myip.fromJson(final json) {
    return myip(
      ip: json["query"],
      country: json["country"],
      city: json["city"],
      lat: json["lat"],
      lon: json["lon"],
      isp: json["isp"],
      org: json["org"],
      isp_as: json["isp_as"]
    );
  }
}