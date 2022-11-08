import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/write/write_view_model.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final inputTextController = TextEditingController();

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

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
            controller: inputTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              suffixIcon: IconButton(
                onPressed: () => viewModel.write(inputTextController.text),
                icon: const Icon(Icons.save),
              ),
              hintText: '글을 쓰세요',
            ),
          ),
        ],
      ),
    );
  }
}