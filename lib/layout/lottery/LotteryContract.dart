import 'package:lowlottery/common/mvp.dart';
import 'package:lowlottery/net/net.dart' show HttpRetrofit;
// import 'dart:convert';s
import 'package:lowlottery/layout/lottery/LotteryModel.dart';
import 'dart:async';

abstract class LotteryIView extends IView {
  /// 当前期数信息
  void requestLotteryWithExpectNowSuccess(LotteryModel data);

  ///历史档期
  void requestLotteryLastCurrentSuccess(List<Lottery> history);
}

class LotteryPresenter extends Presenter<LotteryIView> {
  Future<dynamic> requestLotteryWithExpectNow() =>
      HttpRetrofit.request("expectNow", {"gameEn": "cqssc"}, (data) {
        view.requestLotteryWithExpectNowSuccess(LotteryModel.fromJson(data));
      });

  Future<dynamic> requestLotteryLastCurrent() => HttpRetrofit
          .request("opencodeList", {"gameEn": "cqssc", "total": 1}, (data) {
        print("opencodeList----------------------");
        print(data);
        view.requestLotteryLastCurrentSuccess(Lottery.fromJsonToList(data));
      });
}