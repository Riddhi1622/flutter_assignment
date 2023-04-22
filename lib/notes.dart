import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> notes = [];

  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  onTap: () {
                    // Navigate to note details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteDetailsPage(note: notes[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter note here',
                    ),
                    onSubmitted: (value) {
                      // Add new note to list
                      setState(() {
                        notes.add(value);
                      });
                      // Clear text field
                      _textFieldController.clear();
                    },
                    controller: _textFieldController,
                  ),
                ),
                SizedBox(width: 16.0),
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    // Add new note to list
                    setState(() {
                      notes.add(_textFieldController.text);
                    });
                    // Clear text field
                    _textFieldController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NoteDetailsPage extends StatelessWidget {
  final String note;

  NoteDetailsPage({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(note),
      ),
    );
  }
}
