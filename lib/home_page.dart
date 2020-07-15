import 'package:flutter/material.dart';
import 'package:test_app/search_page.dart';

enum OrderStatus { all, placed, approved, canceled, rejected, completed }

class Filter {
  String email;
  String orderId;
  String orderDate;
  String serviceType;
  OrderStatus status;

  Filter(
      {this.email,
      this.orderId,
      this.orderDate,
      this.serviceType,
      this.status = OrderStatus.all});
}

Filter filter = Filter();

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<TagWidget> _tags = tags();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SearchPage()))
                      .then(
                    (value) {
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
          _tags.length > 0
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: _tags,
                  ),
                )
              : Container(),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Hai",
                ),
              ),
            ),
            itemCount: 10,
          ),
        ],
      ),
    );
  }

  List<TagWidget> tags() {
    List<TagWidget> _tags = [];

    print(filter.email);
    if (filter.email != null) {
      _tags.add(
        TagWidget(
          title: filter.email,
          type: TagWidgetType.email,
          onClick: () {
            setState(() {
              filter.email = null;
            });
          },
        ),
      );
    }
    if (filter.orderId != null) {
      _tags.add(
        TagWidget(
          title: filter.orderId,
          type: TagWidgetType.orderId,
          onClick: () {
            setState(() {
              filter.orderId = null;
            });
          },
        ),
      );
    }
    if (filter.orderDate != null) {
      _tags.add(
        TagWidget(
          title: filter.orderDate,
          type: TagWidgetType.orderDate,
          onClick: () {
            setState(() {
              filter.orderDate = null;
            });
          },
        ),
      );
    }
    if (filter.serviceType != null) {
      _tags.add(
        TagWidget(
          title: filter.serviceType,
          type: TagWidgetType.serviceType,
          onClick: () {
            setState(() {
              filter.serviceType = null;
            });
          },
        ),
      );
    }

    return _tags;
  }
}

enum TagWidgetType {
  email,
  orderId,
  orderDate,
  serviceType,
}

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key key,
    this.type,
    this.title,
    this.onClick,
  }) : super(key: key);

  final TagWidgetType type;
  final String title;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tagString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 7,
              child: Icon(
                Icons.close,
                size: 10,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        onTap: onClick,
      ),
    );
  }

  String tagString() {
    String _tagString;
    switch (this.type) {
      case TagWidgetType.email:
        _tagString = "Email: ";
        break;
      case TagWidgetType.orderId:
        _tagString = "Order ID: ";
        break;
      case TagWidgetType.orderDate:
        _tagString = "Order Date: ";
        break;
      case TagWidgetType.serviceType:
        _tagString = "Service Type: ";
        break;
    }
    return _tagString + title;
  }
}
