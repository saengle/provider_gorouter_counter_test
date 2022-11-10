import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/memo_write/memo_write_view_model.dart';

class MemoWriteScreen extends StatefulWidget {
  const MemoWriteScreen({Key? key}) : super(key: key);

  @override
  State<MemoWriteScreen> createState() => _MemoWriteScreenState();
}

class _MemoWriteScreenState extends State<MemoWriteScreen> {
  final _titleTextController = TextEditingController();
  final _bodyTextController = TextEditingController();

  @override
  void dispose() {
    _titleTextController.dispose();
    _bodyTextController.dispose();
    super.dispose();
  }

  // final _snackBar = SnackBar(
  //   content: const Text('제목과 내용을 입력하세요.'),
  //   action: SnackBarAction(
  //     label: '확인',
  //     onPressed: () {
  //       // Some code to undo the change.
  //     },
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MemoWriteViewModel>();
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
                  ? null
                  : () {
                      viewModel.writeNote(
                          _titleTextController.text, _bodyTextController.text);
                      Navigator.pop(context);
                    },
              child: const Text('등록하기'))
        ],
      ),
    );
  }
}
