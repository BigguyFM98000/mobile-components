import 'package:flutter/material.dart';

class DeleteExpansionTile extends StatefulWidget {
  const DeleteExpansionTile({super.key});

  @override
  State<DeleteExpansionTile> createState() => _DeleteExpansionTileState();
}

class _DeleteExpansionTileState extends State<DeleteExpansionTile> {
  final List<Map<String, dynamic>> _items = List.generate(
    50,
    (index) => {
      "id": index,
      "title": "item $index",
      "content":
          "This is the main content of item $index. It is very long and very long."
    },
  );
  UniqueKey keyTile = UniqueKey();
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  void removeItem(int id) {
    setState(() {
      _items.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 600),
        content: Text("Item with $id has been removed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Tile"),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final item = _items[index];
            return Card(
              key:
                  ObjectKey(item['id']), // to me it close after item is deleted
              color: Colors.blue,
              elevation: 4,
              child: ExpansionTile(
                key: keyTile,
                initiallyExpanded: isExpanded,
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                childrenPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                expandedCrossAxisAlignment: CrossAxisAlignment.end,
                title: Text(
                  item['title'],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                children: [
                  GestureDetector(
                    onTap: () => isExpanded ? shrinkTile() : expandTile(),
                    child: Text(
                      item['content'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () => removeItem(index),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
                onExpansionChanged: (isExpanded) =>
                    // logic of what should happen if tile is expanded or shrinked
                    ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text(isExpanded
                          ? "Tile is expanded"
                          : "Expanded is shrunk"),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
