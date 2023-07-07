import 'dart:async';

import 'package:clean_architecture_with_mvvm/domain/models.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  // Stream Controller output
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // OnBoarding view model Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    postDataToView();
  }

  @override
  int goNext() {
    if (_currentIndex == _list.length - 1) {
      return 0;
    } else {
      return ++_currentIndex;
    }
  }

  @override
  int goPrevious() {
    if (_currentIndex == 0) {
      return --_list.length;
    } else {
      return --_currentIndex;
    }
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  // OnBoarding view model Outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // Private methods

  void postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        sliderObject: _list[_currentIndex],
        numOfSlides: _list.length,
        currentIndex: _currentIndex,
      ),
    );
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingDescription1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingDescription2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingDescription3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingDescription4, ImageAssets.onBoardingLogo4),
      ];
}

mixin OnBoardingViewModelInput {
  int goNext(); // on user clicks on right arrow or swipes to left
  int goPrevious(); // on user clicks on left arrow or swipes to right
  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutput {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
