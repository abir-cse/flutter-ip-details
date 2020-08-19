class myip {
  final ip;
  final country;
  final city;
  final lat;
  final lon;
  final ips;
  final org;
  final ips_as;
  myip ({this.ip, this.country, this.city, this.lat, this.lon, this.ips, this.org, this.ips_as});
  factory myip.fromJson(final json) {
    return myip(
      ip: json["query"],
      country: json["country"],
      city: json["city"],
      lat: json["lat"],
      lon: json["lon"],
      ips: json["ips"],
      org: json["org"],
      ips_as: json["ips_as"]
    );
  }
}