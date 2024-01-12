import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_images.dart';

Widget button({name, color, btncolor, width,context,routename,function,height,fontsize}) {
  return GestureDetector(
    onTap: function ?? (){
      Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (BuildContext context) 
    => routename));
    },
    child: Container(
      height: height ?? 40,
      width: width ,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: btncolor),
      child: Center(
          child: Text(
        name,
        style: TextStyle(color: color,fontSize:fontsize ?? 18 ),
      )),
    ),
  );
}

Widget text({String? name, color,double? fontSize, fontweight}) {
  return Text(name ?? 'ok',
      style:
          TextStyle(color: color, fontSize: fontSize ?? 20, fontWeight: fontweight));
}

Widget backArrow({context,routename}) {
  return  IconButton(
    icon:const Icon(Icons.arrow_back_ios),
    color: Colors.black,
    onPressed:routename==null ? (){
     
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> routename));
    } :(){}
  );
}

Widget header({name1, name2, color}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
        children: [text(name: name1,fontweight: FontWeight.bold,fontSize: 20), const Spacer(), text(name: name2, color: color)]),
  );
}

Widget details({icon,name}){
  return  ListTile(
          leading: Icon(icon),
          title: Text(name),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
}

// Widget poducts({context,itemCount}) {
//   print("itemCount value is $itemCount");
//   return GestureDetector(
//     // onTap: (){
//     //   Navigator.pushReplacement(context, 
//     //   MaterialPageRoute(builder: (BuildContext context)=> AboutProduct()));
//     // },
//     child: Container(
//       height: 280,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Container(
//     padding: const EdgeInsets.all(20),
//     height: 280,
//     width: 250,
//     child: Card(
//       child: Column(children: [
//         Image.asset(fruits[index]['name'].toString()),
//         const SizedBox(height: 10),
//         Container(
//             padding: const EdgeInsets.only(left: 15),
//             alignment: Alignment.centerLeft,
//             child: text(
//                 name: fruits[index][1],
//                 fontSize: 18,
//                 fontweight: FontWeight.bold)),
//         Container(
//             padding: const EdgeInsets.only(left: 15),
//             alignment: Alignment.centerLeft,
//             child: text(name: fruits[index][2].toString())),
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
//           child: Row(
//             children: [
//               text(name: fruits[index][3].toString()),
//               const Spacer(),
//               Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           ),
//         )
//       ]),
//     ),
//   );
//         },
//         itemCount: itemCount,
//       ),
//     ),
//   );
// }

Widget cardProducts() {
  return Container(
    padding: const EdgeInsets.all(20),
    height: 280,
    width: 250,
    child: Card(
      child: Column(children: [
        Image.asset(AppImages.appleImage),
        const SizedBox(height: 10),
        Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: text(
                name: "Organic Bananas",
                fontSize: 18,
                fontweight: FontWeight.bold)),
        Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: text(name: "7pcs,Price")),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
          child: Row(
            children: [
              text(name: "\$4.99"),
              const Spacer(),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ]),
    ),
  );
}

Widget bottomBar() {
  return BottomNavigationBar(
      // backgroundColor: ,
      // unselectedItemColor: ,
      selectedItemColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      // onTap: ,
      // currentIndex: ,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favourite'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Account'),
      ]);
}
