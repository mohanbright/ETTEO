import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:etteo_demo/bloc/orders_event.dart';
import 'package:etteo_demo/bloc/orders_state.dart';
import 'package:etteo_demo/providers/orders_provider.dart';




class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersProvider orderProvider = new OrdersProvider();

  @override
  OrdersState get initialState => InitialOrderState();

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if (event is OrdersSearch) {
      yield OrdersSearching();
      var orders =
          await orderProvider.getAllOrders(searchText: event.searchText);

      // Persist in local database
      //  this will be removed and add it to router fetch call.
      // orderProvider.saveRouteToOfflineStorage(orders);
      yield OrdersSearched(orders: orders);
      //
    }
  }
}
