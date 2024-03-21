import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard/editprofile/email.dart';
import 'package:keyboard/editprofile/location.dart';
import 'package:keyboard/editprofile/name.dart';
import 'package:keyboard/editprofile/password.dart';
import 'package:provider/provider.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProfileProvider(),
      child: _MyDetailsWidget(),
    );
  }
}

class _MyDetailsWidget extends StatefulWidget {
  @override
  _MyDetailsWidgetState createState() => _MyDetailsWidgetState();
}

class _MyDetailsWidgetState extends State<_MyDetailsWidget> {
  late UserProfileProvider _userProfileProvider;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final userProfile = _userProfileProvider.userProfile;
    _nameController.text = userProfile.name;
    _emailController.text = userProfile.email;
    _addressController.text = userProfile.address;
    _contactController.text = userProfile.contactNumber;
    _image =
        userProfile.userImage != null ? File(userProfile.userImage!) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null ? Icon(Icons.person, size: 70) : null,
                  ),
                  Positioned(
                    bottom: -7,
                    right: -9,
                    child: IconButton(
                      onPressed: () => _getImage(context),
                      icon: Icon(Icons.camera_alt_rounded),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NameWidget()));
                  // Add onTap functionality
                },
                child: Card(
                  elevation: 0.8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: Icon(Icons.person),
                    title: Text(
                      "Name ",
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Optional: Adjust the style as needed
                      ),
                    ),
                    subtitle: Text(
                      "prajaljungkunwar",
                      style: TextStyle(
                        fontStyle: FontStyle
                            .italic, // Optional: Adjust the style as needed
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EmailWidget()));
                  // Add onTap functionality
                },
                child: Card(
                  elevation: 0.8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: Icon(Icons.email),
                    title: Text(
                      "Email Address",
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Optional: Adjust the style as needed
                      ),
                    ),
                    subtitle: Text(
                      "prajaljungkunwar@gmail.com",
                      style: TextStyle(
                        fontStyle: FontStyle
                            .italic, // Optional: Adjust the style as needed
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LocationWidget()));
                  // Add onTap functionality
                },
                child: Card(
                  elevation: 0.8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: Icon(Icons.location_pin),
                    title: Text(
                      "Location",
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Optional: Adjust the style as needed
                      ),
                    ),
                    subtitle: Text(
                      "Rambazar",
                      style: TextStyle(
                        fontStyle: FontStyle
                            .italic, // Optional: Adjust the style as needed
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PasswordWidget()));
                  // Add onTap functionality
                },
                child: Card(
                  elevation: 0.8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: Icon(Icons.lock),
                    title: Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Optional: Adjust the style as needed
                      ),
                    ),
                    subtitle: Text(
                      "******",
                      style: TextStyle(
                        fontStyle: FontStyle
                            .italic, // Optional: Adjust the style as needed
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _saveChanges(context),
                child: Text("Save Changes"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveChanges(BuildContext context) {
    _userProfileProvider.updateUserProfile(
      name: _nameController.text,
      email: _emailController.text,
      address: _addressController.text,
      contactNumber: _contactController.text,
      image: _image,
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Profile updated')));
  }
}

class UserProfileProvider extends ChangeNotifier {
  late UserProfile _userProfile;

  UserProfileProvider() {
    _userProfile = UserProfile(
      userId: 0,
      userImage: null,
      name: '',
      email: '',
      address: '',
      contactNumber: '',
    );
  }

  UserProfile get userProfile => _userProfile;

  void updateUserProfile({
    required String name,
    required String email,
    required String address,
    required String contactNumber,
    File? image,
  }) {
    _userProfile = UserProfile(
      userId: _userProfile.userId,
      userImage: image != null ? image.path : _userProfile.userImage,
      name: name,
      email: email,
      address: address,
      contactNumber: contactNumber,
    );
    notifyListeners();
  }
}

class UserProfile {
  final int userId;
  final String? userImage;
  final String name;
  final String email;
  final String address;
  final String contactNumber;

  UserProfile({
    required this.userId,
    this.userImage,
    required this.name,
    required this.email,
    required this.address,
    required this.contactNumber,
  });
}
