class UserModel {
  final String username;
  final String email;
  final String uid;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  const UserModel({
    required this.username,
    required this.email,
    required this.uid,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJSON() => {
        "username": username,
        "email": email,
        "uid": uid,
        "bio": bio,
        "phoneUrl": photoUrl,
        "followers": followers,
        "following": following,
      };
}
