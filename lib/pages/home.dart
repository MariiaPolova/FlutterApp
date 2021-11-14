import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List chronics = [];
  String _chronicItem = '';

  @override
  void initState() {
    super.initState();

    chronics.addAll(['Blood general analysis', 'Ferritin']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Medical Chronics'),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('No data');
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card(
                        child: ListTile(
                      title: Text(snapshot.data!.docs[index].get('item')),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline),
                        color: Colors.teal[900],
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('items')
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                      ),
                    )));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[600],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add new element'),
                  content: TextField(
                    onChanged: (String value) {
                      _chronicItem = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        // style: ButtonStyle(foregroundColor: MaterialStateProperty() Colors.teal[100]),
                        onPressed: () {
                          setState(() {
                            chronics.add(_chronicItem);
                            FirebaseFirestore.instance
                                .collection('items')
                                .add({'item': _chronicItem});
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Add')),
                    ElevatedButton(
                        onPressed: () {
                          _chronicItem = '';
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add_comment,
          color: Colors.white,
        ),
      ),
    );
  }
}
