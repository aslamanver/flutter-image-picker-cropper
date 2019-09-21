# image_editor

Flutter image picker and cropper.

## Getting Started

Example project for image picker using camera and gallery also cropping.

```java
// In async method: 

var image = await ImagePicker.pickImage(
  source: type == 1 ? ImageSource.camera : ImageSource.gallery,
  imageQuality: 50
);

File croppedFile = await ImageCropper.cropImage(
  sourcePath: image.path,
  ratioX: 1.0,
  ratioY: 1.0,
  maxWidth: 600,
  maxHeight: 600,
);
```

![](https://raw.githubusercontent.com/aslamanver/flutter-image-picker-cropper/master/screenshots/1.png)
![](https://raw.githubusercontent.com/aslamanver/flutter-image-picker-cropper/master/screenshots/2.png)
![](https://raw.githubusercontent.com/aslamanver/flutter-image-picker-cropper/master/screenshots/3.png)
![](https://raw.githubusercontent.com/aslamanver/flutter-image-picker-cropper/master/screenshots/4.png)
