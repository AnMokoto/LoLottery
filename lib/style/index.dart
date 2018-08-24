library app.style;

import 'style.dart';
import 'cqssc.dart';
export 'style.dart';
export 'cqssc.dart';
import '11x5.dart';

class StyleSplit {
  StyleSplit._();

  /// 返回彩种 实务
  static StyleManagerIMPL of(String str) {
    if (str.contains("ssc")) if (Style.of(str) != null) return Style.of(str);
    if (str.contains("11x5")) return Style11x5.of(str) ;
  }
}
