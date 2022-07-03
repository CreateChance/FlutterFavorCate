import 'dart:ui';

class ScreenFit {
  static late double _rpx;

  // 需要初始化，并且有必要的话指定一下标准宽度，默认采用小程序做法，标准宽度 750
  static void init({double standardWidth = 750}) {
    double physicalWidth = window.physicalSize.width;
    print('物理宽度：$physicalWidth');
    _rpx = physicalWidth / standardWidth;
  }

  static double toRpx(double size) {
    return size * _rpx;
  }
}

extension IntSizeExt on int {
  double get rpx {
    double finalSize = ScreenFit.toRpx(toDouble());
    // print('Final size: $finalSize');
    return finalSize;
  }
}

extension DoubleSizeExt on double {
  double get rpx {
    return ScreenFit.toRpx(this);
  }
}