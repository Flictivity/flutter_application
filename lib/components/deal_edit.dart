import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/deals.dart';

class EditDeal extends StatefulWidget {
  Deal deal;
  String title;
  bool isEdit;

  EditDeal(this.title, this.deal, this.isEdit, {super.key});

  @override
  State<EditDeal> createState() => _EditDealState();
}

class _EditDealState extends State<EditDeal> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  
  @override
  void dispose()
  {
    super.dispose(); 
    titleController.dispose();
    descriptionController.dispose();
    imageController.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    bool imageTwest() {
      return widget.deal.image == null ? true : false;
    }

    if (widget.deal != null &&
        (widget.deal.title != null ||
            widget.deal.description != null ||
            widget.deal.image != null)) {
      titleController.text = widget.deal.title.toString();
      descriptionController.text = widget.deal.description.toString();
      imageController.text = widget.deal.image.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextField(
                  decoration: InputDecoration(
                  label: const Text("Title"),
                  labelStyle: const TextStyle(color: Color(0xFFFFDF4A)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
                  ),
                ),
                  controller: titleController,
                  cursorColor: Colors.amber,
                ),
                                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                  label: const Text("Description"),
                  labelStyle: const TextStyle(color: Color(0xFFFFDF4A)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
                  ),
                ),
                  controller: descriptionController,
                  cursorColor: Colors.amber,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                
                TextField(
                  decoration: InputDecoration(
                  label: const Text("Image"),
                  labelStyle: const TextStyle(color: Color(0xFFFFDF4A)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
                  ),
                ),
                  controller: imageController,
                  cursorColor: Colors.amber,
                ),
                                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              
              Visibility(
                visible: !widget.isEdit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        onPressed: () async {
                          widget.deal.title = titleController.text;
                          widget.deal.description = descriptionController.text;
                          widget.deal.image = imageController.text;

                          CollectionReference deals =
                              FirebaseFirestore.instance.collection('deals');

                          await deals.add({
                            'title': widget.deal.title,
                            'description': widget.deal.description,
                            'image': widget.deal.image,
                          });

                          titleController.clear();
                          descriptionController.clear();
                          imageController.clear();
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text("Добавить"), Icon(Icons.add)],
                        ),
                      )),
                ],
              )),
              Visibility(
                visible: widget.isEdit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () async {
                        CollectionReference deals =
                            FirebaseFirestore.instance.collection('deals');
                        await deals.doc(widget.deal.id).delete();
                        titleController.clear();
                        descriptionController.clear();
                        imageController.clear();
                        Navigator.pop(context);
                      },
                      child: Row(children: const [
                        Text("Удалить"),
                        Icon(Icons.delete)
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () async {
                        CollectionReference deals =
                            FirebaseFirestore.instance.collection('deals');
                        await deals.doc(widget.deal.id).update({
                          "title": titleController.text,
                          "description": descriptionController.text,
                          "image": imageController.text,
                        });
                        titleController.clear();
                        descriptionController.clear();
                        imageController.clear();
                        Navigator.pop(context);
                      },
                      child: Row(children: const [
                        Text("Обновить"),
                        Icon(Icons.update)
                      ]),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
