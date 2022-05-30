import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talents/constants.dart';
import 'package:talents/models/user.dart' as userModel;
import 'package:talents/views/sreens/admin_home.dart';
import 'package:talents/views/sreens/authScreens/login_screen.dart';
import 'package:talents/views/sreens/beneficiary_screen.dart';
import 'package:talents/views/sreens/home_screen.dart';
import 'package:talents/views/sreens/profile_screen.dart';
import 'package:talents/views/sreens/video_screen.dart';


class AuthController extends GetxController{

  static AuthController instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;
  
  File? get profilePhoto => _pickedImage.value;
  User get user => _user.value!;
 

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => Login());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }


//picking image from the gallery
void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // uploading image
 Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

//registering a user
  void registerUser(String username, String email, String password, File? image) async{
    
    // checking for empty fields or textiput validation
      try {
        if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);
        userModel.User user = userModel.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch (e) {
        Get.snackbar('Error registering a user', e.toString());
      }
    
  }
  //user signing in
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
            print('log in successful');
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }
   
  //signing out method
  void signOut() async {
    await firebaseAuth.signOut();
  }

  // admin signing in

  void adminSignIn( String username, String password){
    if(username =='admin@gmail.com' && password == "admin123"){
      Get.snackbar('admin message', 'admin logged in');
      Get.to(() => AdmnHome());      
    }else{
      Get.snackbar('Error', 'emailor passcode is incorrect');
    }
  }

  //admin registering a new beneficiary user
  void registerBeneficiaryUser(
      File? image, String fullname, String email, String username, String occupation, String location, 
      String problem, String academics, String dob, String gender, String bio, String password ) async {
    // checking for empty fields or textiput validation
    try {
      if (
        fullname.isNotEmpty &&
        email.isNotEmpty &&
        username.isNotEmpty &&
        occupation.isNotEmpty &&
        location.isNotEmpty &&
        problem.isNotEmpty &&
        academics.isNotEmpty &&
        dob.isNotEmpty &&
        gender.isNotEmpty &&
        bio.isNotEmpty &&
        password.isNotEmpty &&
        image != null ) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);
        userModel.BeneficiaryUser user = userModel.BeneficiaryUser(
        fullname: fullname,
        email: email,
        username:username,
        occupation: occupation,
        location: location,
        problem: problem,
        academics: academics,
        dob: dob,
        gender: gender,
        bio: bio,
        uid: cred.user!.uid,
        profilePhoto: downloadUrl,
        );
        await firestore
            .collection(' Beneficiary users')
            .doc(cred.user!.uid)
            .set(user.toJson());

            Get.snackbar('Add member','Registration successful');
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
        );
      }
    } catch(e) {
      Get.snackbar('Error registering a user', e.toString());
    }
  }
  //prrocess payment
  void processPayment(String amount, String name, String cardNumber, String expiryDtae, String passcode){
    if(
        amount.isNotEmpty ||
        name.isNotEmpty ||
        cardNumber.isNotEmpty ||
        expiryDtae.isNotEmpty ||
        passcode.isNotEmpty
    ){
      print('btn clicked');
      Get.snackbar('Stripe', 'Payment is being procesed');
      Timer(const Duration(seconds: 5), () {
        Get.to(VideoScreen());

        Get.snackbar('Stripe',
            'Timeout: It looks like the account details are incorrect');
      });
      
    }else{
      Get.snackbar(
          'Stripe', 'Timeout: It looks like the account details are incorrect');
    }
  }
  void addMoreInfo(){
    Get.snackbar('Message', 'Updating profile information');
    Timer(const Duration(seconds: 5), () {
      Get.snackbar(
          ',Message', 'Congaradulations you are now a Beneficiary');
    });
  }

  //navigate to add info screen
  void beneficiary_screen(){
    Get.to(BeneficiaryInfo());
  }

}