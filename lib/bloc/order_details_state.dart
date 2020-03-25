
import 'package:etteo_demo/model/order_detail/order_detail_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OrderDetailsState {}

class InitialOrderDetailsState extends OrderDetailsState {}

class OrderDetailFetching extends OrderDetailsState {}

class OrderDetailFetched extends OrderDetailsState {
  final OrderDetailModel orderDetails;
  OrderDetailFetched({@required this.orderDetails});
}

class RouteFlag extends OrderDetailsState {
  final dynamic flag;
  RouteFlag({@required this.flag});
}

class LocalOrderDetailFetching extends OrderDetailsState {}

class LocalOrderDetailFetched extends OrderDetailsState {
  final OrderDetailModel orderDetails;
  LocalOrderDetailFetched({@required this.orderDetails});
}
