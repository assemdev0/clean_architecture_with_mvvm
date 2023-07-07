import '/presentation/on_boarding/view_model/on_boarding_view_model.dart';

import '../../../domain/models.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/color_manager.dart';
import '/presentation/resources/constants_manager.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) => Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: AppSize.none,
          backgroundColor: ColorManager.white,
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject!.numOfSlides,
          onPageChanged: (int index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              _getBottomSheetIndicator(sliderViewObject),
            ],
          ),
        ),
      );

  _getBottomSheetIndicator(SliderViewObject? sliderViewObject) => Container(
        color: ColorManager.primary,
        child: Padding(
          padding: const EdgeInsets.all(
            AppPadding.p14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left arrow
              Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: GestureDetector(
                  child: SizedBox(
                    child: SvgPicture.asset(
                      ImageAssets.leftArrowIc,
                    ),
                    width: AppSize.s20,
                    height: AppSize.s20,
                  ),
                  onTap: () {
                    _pageController.animateToPage(
                      _viewModel.goPrevious(),
                      duration: const Duration(
                          milliseconds: AppConstants.sliderAnimationTimer),
                      curve: Curves.bounceInOut,
                    );
                  },
                ),
              ),

              // circle indicator
              Row(
                children: [
                  for (int i = 0; i < sliderViewObject!.numOfSlides; i++)
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child:
                          _getCircleIndicator(i, sliderViewObject.currentIndex),
                    ),
                ],
              ),

              // right arrow
              Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p8,
                ),
                child: GestureDetector(
                  child: SizedBox(
                    child: SvgPicture.asset(
                      ImageAssets.rightArrowIc,
                    ),
                    width: AppSize.s20,
                    height: AppSize.s20,
                  ),
                  onTap: () {
                    _pageController.animateToPage(
                      _viewModel.goNext(),
                      duration: const Duration(
                          milliseconds: AppConstants.sliderAnimationTimer),
                      curve: Curves.bounceInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget _getCircleIndicator(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(
        ImageAssets.hollowCircleIc,
      );
    } else {
      return SvgPicture.asset(
        ImageAssets.solidCircleIc,
      );
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._viewModel) : super();
  final SliderObject _viewModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _viewModel.title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _viewModel.description,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_viewModel.image),
      ],
    );
  }
}
