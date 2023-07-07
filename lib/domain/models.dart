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
