

class User{
  final String uid;
  final String email;
  final String username;
  final String bio;
  final String photoUrl;
  final List following;
  final List followers;

  User({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.photoUrl,
    required this.following,
    required this.followers,
  });

  Map<String,dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'username': username,
    'bio': bio,
    'photoUrl': photoUrl,
    'following': following,
    'followers': followers,
  };

}