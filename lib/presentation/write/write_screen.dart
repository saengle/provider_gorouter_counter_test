import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/write/write_view_model.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final _titleTextController = TextEditingController();
  final _bodyTextController = TextEditingController();

  @override
  void dispose() {
    _titleTextController.dispose();
    _bodyTextController.dispose();
    super.dispose();
  }

  final _snackBar = SnackBar(
    content: const Text('제목과 내용을 입력하세요.'),
    action: SnackBarAction(
      label: '확인',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('메모장'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              hintText: '제목을 입력하세요',
            ),
          ),
          TextField(
            controller: _bodyTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              hintText: '글을 입력하세요',
            ),
          ),
          ElevatedButton(
              onPressed: viewModel.isValid(
                      _titleTextController.text, _bodyTextController.text)
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                    }
                  : () {
                      viewModel.write(
                          _titleTextController.text, _bodyTextController.text);
                      Navigator.pop(context);
                    },
              child: const Text('등록하기'))
        ],
      ),
    );
  }
}
