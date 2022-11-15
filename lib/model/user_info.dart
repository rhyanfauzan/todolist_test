class UserInfo {
  UserInfo({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  Data data;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.nik,
    required this.phone,
    required this.email,
    required this.role,
    required this.name,
    required this.gender,
    required this.address,
    required this.image,
    required this.otp,
    required this.emailVerifiedAt,
    required this.otpVerifiedAt,
    required this.currentPoin,
    required this.createdAt,
    required this.updatedAt,
    required this.totalSampah,
    required this.totalUang,
    required this.totalBarang,
    required this.riwayatSampah,
    required this.riwayatUang,
    required this.riwayatBarang,
  });

  int id;
  String? nik;
  String? phone;
  String email;
  String? role;
  String? name;
  String? gender;
  String? address;
  String? image;
  String otp;
  DateTime? emailVerifiedAt;
  DateTime otpVerifiedAt;
  String currentPoin;
  DateTime createdAt;
  DateTime updatedAt;
  String totalSampah;
  String totalUang;
  String totalBarang;
  List<RiwayatSampah> riwayatSampah;
  List<RiwayatUang> riwayatUang;
  List<RiwayatBarang> riwayatBarang;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nik: json["nik"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"],
        name: json["name"],
        gender: json["gender"],
        address: json["address"],
        image: json["image"],
        otp: json["otp"],
        emailVerifiedAt: json["email_verified_at"],
        otpVerifiedAt: DateTime.parse(json["otp_verified_at"]),
        currentPoin: json["current_poin"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        totalSampah: json["total_sampah"],
        totalUang: json["total_uang"],
        totalBarang: json["total_barang"],
        riwayatSampah: List<RiwayatSampah>.from(
            json["riwayat_sampah"].map((x) => RiwayatSampah.fromJson(x))),
        riwayatUang: List<RiwayatUang>.from(
            json["riwayat_uang"].map((x) => RiwayatUang.fromJson(x))),
        riwayatBarang: List<RiwayatBarang>.from(
            json["riwayat_barang"].map((x) => RiwayatBarang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "phone": phone,
        "email": email,
        "role": role,
        "name": name,
        "gender": gender,
        "address": address,
        "image": image,
        "otp": otp,
        "email_verified_at": emailVerifiedAt,
        "otp_verified_at": otpVerifiedAt.toIso8601String(),
        "current_poin": currentPoin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "total_sampah": totalSampah,
        "total_uang": totalUang,
        "total_barang": totalBarang,
        "riwayat_sampah":
            List<dynamic>.from(riwayatSampah.map((x) => x.toJson())),
        "riwayat_uang": List<dynamic>.from(riwayatUang.map((x) => x.toJson())),
        "riwayat_barang":
            List<dynamic>.from(riwayatBarang.map((x) => x.toJson())),
      };
}

class RiwayatBarang {
  RiwayatBarang({
    required this.id,
    required this.idUser,
    required this.idBarang,
    required this.jumlah,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String idUser;
  String idBarang;
  String jumlah;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory RiwayatBarang.fromJson(Map<String, dynamic> json) => RiwayatBarang(
        id: json["id"],
        idUser: json["id_user"],
        idBarang: json["id_barang"],
        jumlah: json["jumlah"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_barang": idBarang,
        "jumlah": jumlah,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class RiwayatSampah {
  RiwayatSampah({
    required this.id,
    required this.idUser,
    required this.idSampah,
    required this.berat,
    required this.totalPoin,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.sampah,
  });

  int id;
  String idUser;
  String idSampah;
  String berat;
  String totalPoin;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  Sampah sampah;

  factory RiwayatSampah.fromJson(Map<String, dynamic> json) => RiwayatSampah(
        id: json["id"],
        idUser: json["id_user"],
        idSampah: json["id_sampah"],
        berat: json["berat"],
        totalPoin: json["total_poin"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        sampah: Sampah.fromJson(json["sampah"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_sampah": idSampah,
        "berat": berat,
        "total_poin": totalPoin,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "sampah": sampah.toJson(),
      };
}

class Sampah {
  Sampah({
    required this.id,
    required this.name,
    required this.image,
    required this.poinPerKg,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String image;
  String poinPerKg;
  DateTime createdAt;
  DateTime updatedAt;

  factory Sampah.fromJson(Map<String, dynamic> json) => Sampah(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        poinPerKg: json["poin_per_kg"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "poin_per_kg": poinPerKg,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class RiwayatUang {
  RiwayatUang({
    required this.id,
    required this.idUser,
    required this.totalPoin,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String idUser;
  String totalPoin;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory RiwayatUang.fromJson(Map<String, dynamic> json) => RiwayatUang(
        id: json["id"],
        idUser: json["id_user"],
        totalPoin: json["total_poin"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "total_poin": totalPoin,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
