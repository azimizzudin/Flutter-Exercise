import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/image_model.dart';
import 'package:flutter_exercise/repo/image_repository.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function(String) onImageSelected;

  NetworkImagePickerBody({Key? key, required this.onImageSelected})
      : super(key: key);

  final ImageRepository _imageRepository = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: FutureBuilder<List<ImageModel>>(
          future: _imageRepository.getNetworkImages(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        onImageSelected(snapshot.data![index].urlFullSize);
                      },
                      child: Image.network(snapshot.data![index].urlFullSize));
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.5),
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('This is the error: ${snapshot.error}'),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
