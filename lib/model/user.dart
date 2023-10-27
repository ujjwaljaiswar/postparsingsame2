class User{
  final int asset_id;
  final String asset_name;
  final String access;
  final String added_by;

  User({
    required this.asset_id,
    required this.asset_name,
    required this.access,
    required this.added_by,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      asset_id: json['asset_id'],
      asset_name: json['asset_name'],
      access: json['access'],
      added_by: json['added_by'],
    );
  }

}