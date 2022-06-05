import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Consume API from https://kulinergo.herokuapp.com/restaurants

// The API will return a list of restaurants
// Restaurant example in JSON
// {"_id":"62996f6cc282bae78541035b","name":"McDonald's","location":"Cibaduyut","detail":"McDonald's adalah sebuah perusahaan yang bergerak di bidang fast food dan kopi. Didirikan pada tahun 1940, McDonald's merupakan perusahaan pertama di Indonesia yang menjual berbagai macam makanan dan minuman.","harga":"Rp.25.000 - Rp.100.000","rating":4.5,"phone":"0812-1234-1234","reviews":[],"picture":"http://assets.kompasiana.com/items/album/2020/10/12/mcdonalds-5f8468188ede48780604a122.jpg","__v":0}

class RestaurantApiConsumer {
  static final Uri _baseUrl = Uri.https('kulinergo.herokuapp.com', '/restaurants');

  Future<List<Restaurant>> fetchRestaurants() async {
    final response = await http.get(_baseUrl);

    if (response.statusCode == 200) {
      List<Restaurant> restaurants = parseRestaurants(response.body);
      return restaurants;
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  List<Restaurant> parseRestaurants(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
  }
}

class Restaurant {
  final String _id;
  final String name;
  final String location;
  final String detail;
  final String harga;
  final double rating;
  final String phone;
  final List<dynamic> reviews;
  final String picture;

  Restaurant(
      this._id,
      this.name,
      this.location,
      this.detail,
      this.harga,
      this.rating,
      this.phone,
      this.reviews,
      this.picture);

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      json['_id'] as String,
      json['name'] as String,
      json['location'] as String,
      json['detail'] as String,
      json['harga'] as String,
      json['rating'] as double,
      json['phone'] as String,
      json['reviews'] as List<dynamic>,
      json['picture'] as String,
    );
  }
}

// Consume API from https://kulinergo.herokuapp.com/users

// The API will return a list of users
// User example in JSON
// {"_id":"6299870b0aee2c3904f70152","username":"David","password":"12345","email":"david@gmail.com","picture":"https://thispersondoesnotexist.com/image","address":"Cibaduyut","__v":0}

class UserApiConsumer {
  static final Uri _baseUrl = Uri.https('kulinergo.herokuapp.com', '/users');

  Future<List<User>> fetchUsers() async {
    final response = await http.get(_baseUrl);

    if (response.statusCode == 200) {
      List<User> users = parseUsers(response.body);
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}

class User {
  final String _id;
  final String username;
  final String password;
  final String email;
  final String picture;
  final String address;

  User(
      this._id,
      this.username,
      this.password,
      this.email,
      this.picture,
      this.address);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['_id'] as String,
      json['username'] as String,
      json['password'] as String,
      json['email'] as String,
      json['picture'] as String,
      json['address'] as String,
    );
  }
}

// Consume API from https://kulinergo.herokuapp.com/reviews

// The API will return a list of reviews
// Review example in JSON
// {"_id":"629988b196f7479613c1320e","user":"6299870b0aee2c3904f70152","restaurant":"62996f6cc282bae78541035b","rating":5,"comment":"Great food! Paling suka makan di sini kalo pulang kerja.","__v":0}

class ReviewApiConsumer {
  static final Uri _baseUrl = Uri.https('kulinergo.herokuapp.com', '/reviews');

  Future<List<Review>> fetchReviews() async {
    final response = await http.get(_baseUrl);

    if (response.statusCode == 200) {
      List<Review> reviews = parseReviews(response.body);
      return reviews;
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  List<Review> parseReviews(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Review>((json) => Review.fromJson(json)).toList();
  }
}

class Review {
  final String _id;
  final String user;
  final String restaurant;
  final double rating;
  final String comment;

  Review(
      this._id,
      this.user,
      this.restaurant,
      this.rating,
      this.comment);

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      json['_id'] as String,
      json['user'] as String,
      json['restaurant'] as String,
      json['rating'] as double,
      json['comment'] as String,
    );
  }
}
