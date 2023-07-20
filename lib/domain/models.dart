// OnBoarding models
class SliderObject {
  final String title;
  final String description;
  final String image;

  SliderObject(
    this.title,
    this.description,
    this.image,
  );
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}

// Login models

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer({
    required this.id,
    required this.name,
    required this.numOfNotifications,
  });
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts({
    required this.phone,
    required this.email,
    required this.link,
  });
}

class Authentication {
  Customer customer;
  Contacts contacts;

  Authentication({
    required this.contacts,
    required this.customer,
  });
}
