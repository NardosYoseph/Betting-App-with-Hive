import 'package:hive/hive.dart';
part 'hivetotal.g.dart';


@HiveType(typeId:169,adapterName:"TotalAdapter")

class Total extends HiveObject{
   @HiveField(2,defaultValue: "")
  double? recentTotal;
}