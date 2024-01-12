import 'package:grocery_app/Model/model.dart';
import 'package:grocery_app/utils/app_images.dart';

List<GroceryItem> dairyEggs = [
  GroceryItem(image:  AppImages.eggChickenRedImage,name: 'Egg Chicken Red',description: '4pcs, Price',price: 1.99),
  GroceryItem(image: AppImages.eggChickenWhiteImage,name: 'Egg Chicken White',description: '180g, Price',price: 1.50),
  GroceryItem(image: AppImages.eggPastaImage,name: 'Egg Pasta',description: '30gm, Price',price: 13.99),
  GroceryItem(image: AppImages.eggNoodlesImage,name: 'Egg Noodles',description: '30gm, Price',price: 15.99),
  GroceryItem(image: AppImages.mayonnaiseImage,name: 'Mayonnaise Eggless',description: '2pcs, Price',price: 3.99),
  GroceryItem(image: AppImages.eggNoodlesNewImage,name: 'Egg Noodles New',description: '50gm, Price',price: 14.99) ];

List<GroceryItem> fruits = [
  GroceryItem(image: AppImages.appleImage, name:'apple',price: 5.00,description: '1Kg,price'),
  GroceryItem(image: AppImages.bananaImage, name:'Banana', price: 5.00, description: '7Pcs,price'),
  GroceryItem(image: AppImages.appleImage, name:'apple', price: 5.00, description: '1Kg,price'),
  GroceryItem(image: AppImages.bananaImage, name:'Banana', price: 4.99, description: '7Pcs,price'),
  GroceryItem(image: AppImages.appleImage, name:'apple', price: 4.99, description: '1Kg,price'),
  GroceryItem(image: AppImages.bananaImage, name:'Banana', price: 4.99, description: '7Pcs,price') ];

List<GroceryItem> vegetables = [
  GroceryItem(image: AppImages.bellPepperRedImage, name:'Bell Pepper Red', price: 4.99, description: '1Kg,price'),
  GroceryItem(image: AppImages.gingerImage, name:'Ginger', price: 4.99, description: '250gm,price'),
  GroceryItem(image: AppImages.bellPepperRedImage, name:'Bell Pepper Red', price: 4.99, description: '1Kg,price'),
  GroceryItem(image: AppImages.gingerImage, name:'Ginger', price: 4.99, description: '250gm,price'),
  GroceryItem(image: AppImages.bellPepperRedImage, name:'Bell Pepper Red', price: 4.99, description: '1Kg,price'),
  GroceryItem(image: AppImages.gingerImage, name:'Ginger', price: 4.99, description: '250gm,price')];


List<GroceryItem> coolDrinks = [
  GroceryItem(image: AppImages.dietCokeImage, name:'Diet Coke', price: 1.99, description: '255ml,price'),
  GroceryItem(image: AppImages.spriteCanImage, name:'Sprite Can', price: 1.50, description: '325ml,price'),
  GroceryItem(image: AppImages.appleGrapeImage, name:'Apple & Grape Juice', price: 15.99, description: '2L,price'),
  GroceryItem(image: AppImages.orangeJuiceImage, name:'Orange Juice', price: 15.99, description: '2L,price'),
  GroceryItem(image: AppImages.cocaColaImage, name:'Coca Cola Can', price: 4.99, description: '325,price'),
  GroceryItem(image: AppImages.pepsiCanImage, name:'Pepsi Can', price: 4.99, description: '330ml,price') ];






// List DairyEggs = [


//   {
//     'image': 'assets/Mayonnaise Eggless.png',
//     'name': 'Mayonnaise Eggless',
//     'desc': '1pcs, Price',
//     'price': '\$10.99'
//   },
//   {
//     'image': 'assets/Egg Noodles New.png',
//     'name': 'Egg Noodles New',
//     'desc': '2L, Price',
//     'price': '\$14.99'
//   }
//   {
//     'image': 'assets/Egg Chicken Red.png',
//     'name': 'Egg Chicken Red',
//     'desc': '4pcs, Price',
//     'price': '\$1.99'
//   },
//   {
//     'image': 'assets/Egg Chicken White.png',
//     'name': 'Egg Chicken white',
//     'desc': '180g, Price',
//     'price': '\$1.50'
//   },
//   {
//     'image': 'assets/Egg Pasta.png',
//     'name': 'Egg Pasta',
//     'desc': '30gm, Price',
//     'price': '\$15.99'
//   },
//   {
//     'image': 'assets/Egg Noodles.png',
//     'name': 'Egg Chicken',
//     'desc': '2L, Price',
//     'price': '\$15.99'
//   },
// ];

// List Beverages = [
//   {
//     'image': 'assets/Diet Coke.png',
//     'name': 'Diet Coke',
//     'desc': '355ml, Price',
//     'price': '\$1.99'
//   },
//   {
//     'image': 'assets/Sprite Can.png',
//     'name': 'Sprite Can',
//     'desc': '325ml, Price',
//     'price': '\$1.50'
//   },
//   {
//     'image': 'assets/Apple & Grape Juice.png',
//     'name': 'Apple & Grape Juice',
//     'desc': '2L, Price',
//     'price': '\$15.99'
//   },
//   {
//     'image': 'assets/Orange Juice.png',
//     'name': 'Orange Juice',
//     'desc': '2L, Price',
//     'price': '\$15.99'
//   },
//   {
//     'image': 'assets/Coca Cola Can.png',
//     'name': 'Coca Cola Can',
//     'desc': '325ml, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/Pepsi Can.png',
//     'name': 'pepsi Can',
//     'desc': '330ml, Price',
//     'price': '\$4.99'
//   }
// ];

// List fruits = [
//   // GroceryItem(image: 'assets/apple.png', name: 'Apple', description: '1Kg, Price', price: '\$4.99'),
//   // GroceryItem(image: 'assets/banana.png', name: 'Banana', description: '7Pcs, Price', price: '\$4.99'),
//   // GroceryItem(image: 'assets/apple.png', name: 'Apple', description: '1Kg, Price', price: '\$4.99'),
//   // GroceryItem(image: 'assets/banana.png', name: 'Banana', description: '7Pcs, Price', price: '\$4.99'),

//   {
//     'image': 'assets/apple.png',
//     'name': 'Apple',
//     'desc': '1Kg, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/banana.png',
//     'name': 'Banana',
//     'desc': '7Pcs, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/apple.png',
//     'name': 'Apple',
//     'desc': '1Kg, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/banana.png',
//     'name': 'Banana',
//     'desc': '7Pcs, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/apple.png',
//     'name': 'Apple',
//     'desc': '1Kg, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/banana.png',
//     'name': 'Banana',
//     'desc': '7Pcs, Price',
//     'price': '\$4.99'
//   },
// ];

// List Vegetables = [
//   {
//     'image': 'assets/Bell Pepper Red.png',
//     'name': 'Bell Pepper Red',
//     'desc': '1Kg, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/Ginger.png',
//     'name': 'Ginger',
//     'desc': '250gm, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/Bell Pepper Red.png',
//     'name': 'Bell Pepper Red',
//     'desc': '1Kg, Price',
//     'price': '\$4.99'
//   },
//   {
//     'image': 'assets/Ginger.png',
//     'name': 'Ginger',
//     'desc': '250gm, Price',
//     'price': '\$4.99'
//   },
// ];
