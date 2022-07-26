
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../theme/Theme.dart';
class UploadFile extends StatefulWidget {
  const UploadFile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  bool state = true;
   late PlatformFile file;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: titleStyle,),
          //SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Row(
              children: [
                ElevatedButton(

                  child: Text("Import file"),
                  onPressed: ()async{
                    final result = await FilePicker.platform.pickFiles(

                    );
                    if (result == null)return;

                    file = result.files.first;

                    setState((){
                      state = false;
                    });

                  },
                ),
                SizedBox(width: 10,),
                state?Container():Expanded(
                  child: InkWell(
                    onTap: (){
                      openFile(file);
                    },
                    child: Text(file.name),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // Future<File> SaveFilePermanently (PlatformFile file)async{
  //    final appStorage = await getApplicationDocumentsDirectory();
  //    final newfile = File('${appStorage.path}/${file.name}');
  //    return File(file.path!).copy(newfile.path);
  // }
  void openFile(PlatformFile file){
    OpenFile.open(file.path!);
  }

}
