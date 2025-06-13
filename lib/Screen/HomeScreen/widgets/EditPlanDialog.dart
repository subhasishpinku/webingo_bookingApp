import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_webingo/Screen/HomeScreen/HomeProvider.dart';
import 'package:test_webingo/Screen/HomeScreen/model/Plan.dart';

class EditPlanDialog extends StatefulWidget {
  final Plan plan;

  const EditPlanDialog({Key? key, required this.plan}) : super(key: key);

  @override
  State<EditPlanDialog> createState() => _EditPlanDialogState();
}

class _EditPlanDialogState extends State<EditPlanDialog> {
  late TextEditingController titleController;
  late TextEditingController levelController;
  late TextEditingController timeController;
  late TextEditingController roomController;
  late TextEditingController trainerController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.plan.title);
    levelController = TextEditingController(text: widget.plan.level);
    timeController = TextEditingController(text: widget.plan.time);
    roomController = TextEditingController(text: widget.plan.room);
    trainerController = TextEditingController(text: widget.plan.trainer);
  }

  @override
  void dispose() {
    titleController.dispose();
    levelController.dispose();
    timeController.dispose();
    roomController.dispose();
    trainerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return AlertDialog(
      title: const Text("Edit Plan"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter title' : null,
              ),
              TextFormField(
                controller: levelController,
                decoration: const InputDecoration(labelText: "Level"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter level' : null,
              ),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(labelText: "Time"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter time' : null,
              ),
              TextFormField(
                controller: roomController,
                decoration: const InputDecoration(labelText: "Room"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter room' : null,
              ),
              TextFormField(
                controller: trainerController,
                decoration: const InputDecoration(labelText: "Trainer"),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter trainer' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final updatedPlan = {
                "id": widget.plan.id, // pass plan ID if required
                "title": titleController.text,
                "level": levelController.text,
                "time": timeController.text,
                "room": roomController.text,
                "trainer": trainerController.text,
              };

              await homeProvider.updatePlans(updatedPlan);
              Navigator.pop(context);
            }
          },
          child: const Text("Update"),
        ),
      ],
    );
  }
}
