
import 'package:etteo_demo/api/orders_api.dart';
import 'package:etteo_demo/model/order_detail/order_detail_model.dart';
import 'package:etteo_demo/model/route/route_model.dart';
import 'package:etteo_demo/offline/database/database_helper.dart';
import 'package:etteo_demo/offline/database/dbmodel/order_detail_db_model.dart';
import 'package:meta/meta.dart';

class OrdersProvider {
  final OrdersApi orderApi = new OrdersApi();

  Future<List<RouteModel>> getAllOrders({@required String searchText}) async {
    return await orderApi.getAllOrders(searchText: searchText);
  }

  Future<OrderDetailModel> getOrderById({@required String orderId}) async {
    return await orderApi.getOrderById(orderId: orderId);
  }

  Future<OrderDetailModel> readOrderDetailFromOfflineStorage(
      {@required orderId}) async {
    OrderDetailDBModel orderDetail = await DatabaseHelper()
        .getByColumn(OrderDetailDBModel(), orderId, 'orderId');
    return orderDetail?.orderDetailJson;
  }

  saveOrderDetailToOfflineStorage(OrderDetailModel order) async {
    if (order == null) return;

    OrderDetailDBModel orderDetailToSave = OrderDetailDBModel(
        createdDate: DateTime.now().toUtc().toString(),
        orderId: order.orderId,
        serviceDate: order.createdDate,
        orderDetailJson: order,
        syncFlag: 0);
    DatabaseHelper().save(orderDetailToSave);
  }

  updateOrderToOfflineStorage(
    OrderDetailModel order,
    String orderId,
  ) async {
    OrderDetailDBModel orderDetailToSave = OrderDetailDBModel(
        orderId: orderId,
        updatedDate: DateTime.now().toUtc().toString(),
        orderDetailJson: order);
    DatabaseHelper().update(orderDetailToSave, order.orderId, 'orderId');
  }
}
