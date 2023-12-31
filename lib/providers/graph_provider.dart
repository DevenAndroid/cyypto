
import 'package:flutter/cupertino.dart';

import '../models/API.dart';
import '../models/GraphPoint.dart';

class GraphProvider with ChangeNotifier {

  List<GraphPoint> graphPoints = [];

  Future<void> initializeGraph(String id, int days) async {
    List<dynamic> priceData = await API.fetchGraphData(id, days);

    List<GraphPoint> temp = [];
    for(var pricePoint in priceData) {
      GraphPoint graphPoint = GraphPoint.fromList(pricePoint);
      temp.add(graphPoint);
    }

    graphPoints = temp;
    notifyListeners();
  }

}