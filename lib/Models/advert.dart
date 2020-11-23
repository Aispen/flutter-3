class Advert{
  final int id;
  final String userId;
  final String title;
  final String description;
  final String picture;
  final int price;

  Advert({this.id, this.userId, this.title,this.description,this.picture, this.price});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'picture': picture,
      'price': price
    };
  }
}