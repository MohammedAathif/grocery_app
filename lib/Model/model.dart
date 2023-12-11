import 'dart:convert';

class GroceryItem{
  String? image = "";
  String? name;
  String? description = "";
 double? price ;
  bool? isfavorite ;
  bool? isaddToCart;
 int? number;

  // GroceryItem();
  GroceryItem({this.image ="", this.name ="", this.price = 0,this.isaddToCart = false,this.description ="", this.isfavorite = false,this.number = 1});

  factory GroceryItem.fromJson(Map<String,dynamic> json) {
    return GroceryItem(
      image : json['image'], 
      name: json['name'], 
      description: json['description'],  
      price: json['price'],
      isfavorite: json['isfavorite'],
      number: json['number'],
      isaddToCart: json['isaddToCart'],
      );

  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
        'name': name,
        'description': description,
        'price': price,
        'isfavorite':isfavorite,
        'isaddToCart':isaddToCart,
        'number':number
    };
  }

  static Map<String, dynamic> toMap(GroceryItem grocery) => {
        'image': grocery.image,
        'name': grocery.name,
        'description': grocery.description,
        'price': grocery.price,
        'number':grocery.number
        
      };

  static String encode(List<GroceryItem> encodeValue) => json.encode(
        encodeValue
            .map<Map<String, dynamic>>((value) => GroceryItem.toMap(value))
            .toList(),
      );

  static List<GroceryItem> decode(String decodeValue) =>
      (json.decode(decodeValue) as List<dynamic>)
          .map<GroceryItem>((item) => GroceryItem.fromJson(item))
          .toList();

}

