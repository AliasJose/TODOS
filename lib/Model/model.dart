class Album{
  final int userId;
  final int id;
  final String title;
  final bool completed;

 Album({
  required this.userId,
  required this.id,
  required this.title,
  required this.completed,

});
factory Album.fromJson(Map<String,dynamic>json){
return Album(
  userId:json["userId"],
  id:json["id"],
  title:json["title"],
  completed:json["completed"],
);
}
}
