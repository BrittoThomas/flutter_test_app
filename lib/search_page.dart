import 'package:flutter/material.dart';
import 'package:test_app/bookings_page.dart';
import 'package:test_app/home_page.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController emailController;
  TextEditingController orderIdController;
  TextEditingController orderDateController;
  TextEditingController serviceTypeController;

  @override
  void initState() {
    emailController = TextEditingController();
    orderIdController = TextEditingController();
    orderDateController = TextEditingController();
    serviceTypeController = TextEditingController();

    emailController.text = filter.email;
    orderIdController.text = filter.orderId;
    orderDateController.text = filter.orderDate;
    serviceTypeController.text = filter.serviceType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          20,
        ),
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              labelText: "Email",
            ),
          ),
          TextField(
            controller: orderIdController,
            decoration: InputDecoration(
              hintText: "OrderID",
              labelText: "OrderID",
            ),
          ),
          TextField(
            controller: orderDateController,
            decoration: InputDecoration(
              hintText: "OrderDate",
              labelText: "OrderDate",
            ),
          ),
          TextField(
            controller: serviceTypeController,
            decoration: InputDecoration(
              hintText: "ServiceType",
              labelText: "ServiceType",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Order Status"),
          DropdownButton(
            isExpanded: true,
            items: orderStatusMenuItems(),
            value: filter.status,
            onChanged: (value) {
              setState(() {
                filter.status = value;
              });
            },
          ),
          SizedBox(
            height: 100,
          ),
          FlatButton(
            color: Colors.orange,
            child: Text("Search"),
            onPressed: () {
              if (emailController.text.length > 0) {
                filter.email = emailController.text;
              } else {
                filter.email = null;
              }
              if (orderIdController.text.length > 0) {
                filter.orderId = orderIdController.text;
              } else {
                filter.orderId = null;
              }
              if (orderDateController.text.length > 0) {
                filter.orderDate = orderDateController.text;
              } else {
                filter.orderDate = null;
              }
              if (serviceTypeController.text.length > 0) {
                filter.serviceType = serviceTypeController.text;
              } else {
                filter.serviceType = null;
              }

              if (filter.status != OrderStatus.all) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BookingsPage()));
              } else {
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem> orderStatusMenuItems({List<String> statusTitles}) {
    List<DropdownMenuItem> items = [];

    items.addAll(
      [
        DropdownMenuItem(
          value: OrderStatus.all,
          child: Text(
            "All",
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.placed,
          child: Text(
            "Order Placed",
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.approved,
          child: Text(
            "Order Approved",
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.canceled,
          child: Text(
            "Order Cancelled",
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.rejected,
          child: Text(
            "Order Rejected",
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.completed,
          child: Text(
            "Order Completed",
          ),
        ),
      ],
    );

    return items;
  }
}
