extension NonNullableSring on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullableInteger on int? {
  int orEmpty() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
