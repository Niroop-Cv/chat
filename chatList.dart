import 'package:flutter/material.dart';

class DataList extends StatefulWidget {
  const DataList({super.key});

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  List data = [];

  TextEditingController datactr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            data.removeAt(index); // Corrected line
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      tileColor: Colors.greenAccent,
                      title: Text(
                        data[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: data.length)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: datactr,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    suffixIcon: datactr.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                data.add(datactr.text);
                                datactr.clear();
                              });
                            },
                            icon: const Icon(Icons.send))
                        : IconButton(
                            icon: const Icon(Icons.mic),
                            onPressed: () {},
                          ))),
          ),
        ],
      ),
    );
  }
}
