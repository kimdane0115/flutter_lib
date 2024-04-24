import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/feature/2.home/presentation/widget/image_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/index.dart';
import '../../../1.auth/presentation/provider/supabase_auth_provider.async_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // XFile? _image;
  // final ImagePicker picker = ImagePicker();
  File? _selectedImage;
  String? imageUrl;
  // late final ValueNotifier<String> imageUrl;
  // late String userId;
  late Key _key;

  @override
  void initState() {
    super.initState();
    // imageUrl = ValueNotifier<String>('');
    // userId = Supabase.instance.client.auth.currentUser!.id;
    // final imagePath = '$userId/profile';
    // imageUrl = Supabase.instance.client.storage
    //             .from('test2')
    //             .getPublicUrl(imagePath);
    // print('>>>> $imageUrl');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: home(),
      ),
    );
  }

  Widget home() {
    return Column(
      children: [
        // ElevatedButton(
        //   onPressed: () {
        //     // googlelogin();
        //     ref.watch(authAsyncNotifierProvider.notifier).signInWithGoogle();
        //   },
        //   child: const Text('Login Button'),
        // ),
        ElevatedButton(
          onPressed: () {
            // googlelogin();
            ref.watch(supaBaseAuthAsyncNotifierProvider.notifier).signOut();
          },
          child: const Text('LogOut'),
        ),
        ElevatedButton(
          onPressed: () {
            // googlelogin();
            getFcmToken();
          },
          child: const Text('getFcm Token'),
        ),
        ElevatedButton(
          onPressed: () async {
            // googlelogin();
            final userId = Supabase.instance.client.auth.currentUser!.id;
            final data =
                await Supabase.instance.client.from('profiles').select().eq('id', userId).single();
            print('>>>> $data');
          },
          child: const Text('get Profile'),
        ),
        ElevatedButton(
          onPressed: () async {
            // getImage(ImageSource.gallery);
            //   final pickedFile =
            //     await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);

            // if (pickedFile != null) {
            //   // setState(() {
            //   //   _selectedImage = File(pickedFile.path);
            //   // });

            //   await uploadImage(File(pickedFile.path));
            // }
            final userId = Supabase.instance.client.auth.currentUser!.id;
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image == null) {
              return;
            }

            final imageExtension = image.path.split('.').last.toLowerCase();
            final imageBytes = await image.readAsBytes();
            final imagePath = '$userId/profile';
            
            await Supabase.instance.client.storage.from('test2').uploadBinary(
                  imagePath,
                  imageBytes,
                  fileOptions: FileOptions(
                    upsert: true,
                    contentType: 'image/$imageExtension',
                  ),
                );
            String imageUrlNew = Supabase.instance.client.storage
                .from('test2')
                .getPublicUrl(imagePath);
            imageUrlNew = Uri.parse(imageUrlNew).replace(queryParameters: {
              't': DateTime.now().millisecondsSinceEpoch.toString()
            }).toString();
            print('>>>>> $imageUrlNew');
            // imageUrl = imageUrlNew.toString();
            setState(() {
              imageUrl = imageUrlNew.toString();
              print('>>>> update : $imageUrl');
            });
          },
          child: const Text('Upload image'),
        ),
        SizedBox(
          width: 70,
          height: 70,
          child: imageUrl == null ? const SizedBox.shrink() : ImageWidget(imageUrl: imageUrl!,),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   // child: Image.network(
          //   //     'https://mccoypiqwvukvcgvxlvi.supabase.co/storage/v1/object/sign/test/test.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJ0ZXN0L3Rlc3QucG5nIiwiaWF0IjoxNzEzNzQ5MTQ4LCJleHAiOjE3MTQzNTM5NDh9.o0_WEQc3Qwl3DE7YZ1iNPrHAzAMsM9dkim7hlCiw5PA&t=2024-04-22T01%3A25%3A47.991Z'),
          //   child: Image.network(
          //     // 'https://mccoypiqwvukvcgvxlvi.supabase.co/storage/v1/object/public/test2//68318c72-5144-4a14-8aff-ab833a97041a/profile',
          //     // key: _key,
          //     imageUrl ?? 'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
      ],
    );
  }

  Future<void> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();

    print('>>>> fcmToken : $token');
  }

  Future<void> uploadImage(File imageFile) async {
    final response = await Supabase.instance.client.storage
        .from('test2') // Replace with your storage bucket name
        .upload('/profiles', imageFile);

    print('>>>> response : $response');
    // if (response.error == null) {
    //   print('Image uploaded successfully');
    // } else {
    //   print('Upload error: ${response.error!.message}');
    // }
  }
  //이미지를 가져오는 함수
  // Future getImage(ImageSource imageSource) async {
  //   //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
  //   final XFile? pickedFile = await picker.pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     // setState(() {
  //     //   _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
  //     // });
  //     print('>>>> ${pickedFile.path}');
  //     uploadImage(File(pickedFile.path));
  //   }
  // }

  Future<void> googlelogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    print('>>>> displayName : ${googleUser?.displayName}');
    print('>>>> email : ${googleUser?.email}');
    print('>>>> accessToken : ${googleAuth?.accessToken}');
    print('>>>> idToken : ${googleAuth?.idToken}');

    OAuthCredential _googleCredential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    UserCredential _credential =
        await FirebaseAuth.instance.signInWithCredential(_googleCredential);
    if (_credential.user != null) {
      print(">>>> ${_credential.user}");
    }

    // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
  }
}
