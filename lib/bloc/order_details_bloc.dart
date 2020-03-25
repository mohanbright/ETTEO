import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:etteo_demo/bloc/order_details_event.dart';
import 'package:etteo_demo/bloc/order_details_state.dart';
import 'package:etteo_demo/model/order_detail/order_detail_model.dart';
import 'package:etteo_demo/providers/orders_provider.dart';

import './bloc.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  bool routeFlag = true;
  OrderDetailModel orderDetails;

  OrderDetailsBloc();

  @override
  dispose() {
    super.dispose();
  }

  OrdersProvider _ordersProvider = OrdersProvider();
  @override
  OrderDetailsState get initialState => InitialOrderDetailsState();

  @override
  Stream<OrderDetailsState> mapEventToState(
    OrderDetailsEvent event,
  ) async* {
    if (event is FetchLocalOrderDetail) {
      // Set order progressing
      yield LocalOrderDetailFetching();
      // Read from local db.
      orderDetails = await _ordersProvider.readOrderDetailFromOfflineStorage(
          orderId: event.orderId);

      if (orderDetails == null) {
        dispatch(FetchOrderDetail(orderId: event.orderId));
        return;
      }

      yield OrderDetailFetched(orderDetails: orderDetails);
      // yield LocalOrderDetailFetched(orderDetails: orderDetails);
    }

    if (event is FetchOrderDetail) {
      print('FetchOrderDetail ${event.orderId}');

      yield OrderDetailFetching();

      orderDetails = await _ordersProvider.getOrderById(orderId: event.orderId);
      _ordersProvider.saveOrderDetailToOfflineStorage(orderDetails);
      yield OrderDetailFetched(orderDetails: orderDetails);
    }

    if (event is UpdateOrderDetail) {
      await _ordersProvider.updateOrderToOfflineStorage(
          event.orderDetailModel, event.orderDetailModel.orderId);
    }

    if (event is SetRouteFlag) {
      routeFlag = event.flag;
    }
  }
}
