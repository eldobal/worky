// To parse this JSON data, do
//
//     final trabajadorClass = trabajadorClassFromJson(jsonString);

import 'dart:convert';

TrabajadorClass trabajadorClassFromJson(String str) => TrabajadorClass.fromJson(json.decode(str));

String trabajadorClassToJson(TrabajadorClass data) => json.encode(data.toJson());

class TrabajadorClass {
  TrabajadorClass({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prege,
    this.nextPage,
  });

  List<Doc> docs;
  int totalDocs;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prege;
  dynamic nextPage;

  factory TrabajadorClass.fromJson(Map<String, dynamic> json) => TrabajadorClass(
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
    totalDocs: json["totalDocs"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    page: json["page"],
    pagingCounter: json["pagingCounter"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prege: json["prege"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prege": prege,
    "nextPage": nextPage,
  };
}

class Doc {
  Doc({
    this.id,
    this.rut,
    this.name,
    this.lastname,
    this.cellphone,
    this.email,
    this.locationInfo,
    this.type,
    this.profileUrl,
    this.status,
    this.userId,
    this.categories,
    this.docId,
  });

  String id;
  String rut;
  String name;
  String lastname;
  String cellphone;
  String email;
  LocationInfo locationInfo;
  String type;
  dynamic profileUrl;
  String status;
  String userId;
  List<Category> categories;
  String docId;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    rut: json["rut"],
    name: json["name"],
    lastname: json["lastname"],
    cellphone: json["cellphone"],
    email: json["email"],
    locationInfo: LocationInfo.fromJson(json["locationInfo"]),
    type: json["type"],
    profileUrl: json["profileUrl"],
    status: json["status"],
    userId: json["userId"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    docId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rut": rut,
    "name": name,
    "lastname": lastname,
    "cellphone": cellphone,
    "email": email,
    "locationInfo": locationInfo.toJson(),
    "type": type,
    "profileUrl": profileUrl,
    "status": status,
    "userId": userId,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "id": docId,
  };
}

class Category {
  Category({
    this.id,
    this.categoryName,
    this.services,
  });

  String id;
  String categoryName;
  List<Service> services;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    categoryName: json["categoryName"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "categoryName": categoryName,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    this.id,
    this.description,
    this.price,
  });

  String id;
  String description;
  int price;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["_id"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "price": price,
  };
}

class LocationInfo {
  LocationInfo({
    this.city,
    this.commune,
    this.country,
    this.id,
  });

  String city;
  String commune;
  String country;
  String id;

  factory LocationInfo.fromJson(Map<String, dynamic> json) => LocationInfo(
    city: json["city"],
    commune: json["commune"],
    country: json["country"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "commune": commune,
    "country": country,
    "_id": id,
  };
}