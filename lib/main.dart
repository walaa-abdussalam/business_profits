import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'sales_page.dart';
import 'growth_page.dart';
import 'package:business_profit/profits_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // for the date text fields
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  //for category dropdown , class contains name and picture
  CategoriesModel _categoryChoose ;

  List<CategoriesModel> categoriesList=[
    CategoriesModel("كل الفئات","https://vemaps.com/uploads/img/ly-03.png"),
    CategoriesModel("كروت الاتصالات المحلية","https://vemaps.com/uploads/img/ly-03.png"),
    CategoriesModel("كروت الانترنت المحلية ","https://vemaps.com/uploads/img/ly-03.png"),
    CategoriesModel("كروت محلية","https://vemaps.com/uploads/img/ly-03.png"),
  ];

  //for Subcategory dropdown , class contains name and picture
  CategoriesModel _subCategoryChoose ;

  List<CategoriesModel> subCategoriesList=[
    CategoriesModel("كل الأصناف","https://vemaps.com/uploads/img/ly-03.png"),
    CategoriesModel("ليبيانا","https://vemaps.com/uploads/img/ly-03.png"),
    CategoriesModel("المدار ","https://vemaps.com/uploads/img/ly-03.png"),
    CategoriesModel("هاتف ليبيا","https://vemaps.com/uploads/img/ly-03.png"),
  ];

  @override
  void initState() {
    super.initState();
    _categoryChoose = categoriesList[0];
    _subCategoryChoose = subCategoriesList[0];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Align(
            child: Text("تقارير"),
        alignment: Alignment.centerRight),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0 ,right: 20.0 ,top: 20.0,bottom: 20.0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        DateTime currentTime = DateTime.now();
                        DateTime firstDate = DateTime(currentTime.year, currentTime.month, 1);
                        String endDatea = formatDate(currentTime, [yyyy, '/', mm, '/', dd]);
                        String startDatea = formatDate(firstDate, [yyyy, '/', mm, '/', dd]);
                        startDate.text = startDatea;
                        endDate.text = endDatea;
                      });
                       },
                    child: Text(
                      "الشهر الحالي",
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                    color: Colors.deepOrange,
                    elevation: 5.0,
                    minWidth: 80,
                    height: 50,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  MaterialButton(
                  onPressed: (){
                    setState(() {
                      DateTime currentTime = DateTime.now();
                      DateTime previousTime = DateTime.now().subtract(Duration(days:1));
                      String endDatek = formatDate(currentTime, [yyyy, '/', mm, '/', dd]);
                      String startDatek = formatDate(previousTime, [yyyy, '/', mm, '/', dd]);
                      startDate.text = startDatek;
                      endDate.text = endDatek;
                    });
                  },
                   child: Text(
                    "الأمس",
                  style: TextStyle(
                  fontSize: 15
                  ),
                  ),
                 color: Colors.deepOrange,
                 elevation: 5.0,
                 minWidth: 80,
                  height: 50,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                   ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        DateTime currentTime = DateTime.now();
                        DateTime previousTime = DateTime.now().subtract(Duration(days:3));
                        String endDatel = formatDate(currentTime, [yyyy, '/', mm, '/', dd]);
                        String startDatel = formatDate(previousTime, [yyyy, '/', mm, '/', dd]);
                        startDate.text = startDatel;
                        endDate.text = endDatel;
                      });
                    },
                    child: Text(
                      "أخر ثلاثة أيام ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    color: Colors.deepOrange,
                    elevation: 5.0,
                    minWidth: 80,
                    height: 50,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              TextFormField(
                controller: startDate,
                readOnly: true,
                validator: (startDate){
                  if(startDate==null|| startDate.isEmpty){
                    return "Please Input Start Date";
                  }else return null;
                },
                onTap: () async{
                  DateTime startPickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:DateTime.now(),
                      lastDate: DateTime(2100)
                  );
                  if(startPickedDate!= null){
                    String formattedDate = DateFormat('dd-MM-yyyy').format(startPickedDate);
                    setState(() {
                      startDate.text = formattedDate; //set output date to TextField value.
                    });
                  }
                },
              ),

              TextFormField(
                controller: endDate,
                readOnly: true,

                validator: (endDate){
                  if(endDate==null || endDate.isEmpty){
                    return "Please Input End Date";
                  }else {
                    return null;
                  }
                },
                onTap: () async{
                  if (startDate.text.isNotEmpty) {
                    String dateTime = startDate.text;
                    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
                    DateTime input = inputFormat.parse(dateTime);

                    DateTime endPickedDate = await showDatePicker(
                      context: context,
                      initialDate: input.add(const Duration(days: 1)),
                      firstDate:  input.add(const Duration(days: 1)),
                      lastDate: DateTime(2100),
                    );
                    if(endPickedDate!= null){
                      String formattedDate = DateFormat('dd-MM-yyyy').format(endPickedDate);
                      setState(() {
                        endDate.text = formattedDate;
                      }
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You need to select Start Date')));
                  }
                },
              ),
              SizedBox(height: 20.0,),
            InputDecorator(
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.fromLTRB(12, 12, 12, 12),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<CategoriesModel>(

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  hint: Text(
                    "اختر الصنف",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  items: categoriesList
                      .map<DropdownMenuItem<CategoriesModel>>(
                          (CategoriesModel value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: [
                              new CircleAvatar(
                                backgroundImage: new NetworkImage(
                                    value.category_logo),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(value.category_name),
                            ],
                          ),
                        );
                      }).toList(),

                  isExpanded: true,
                  isDense: true,
                  onChanged: (CategoriesModel newSelectedCategory) {
                        setState(() {
                      _categoryChoose = newSelectedCategory;
                    });
                  },
                  value: _categoryChoose,

                ),
              ),
            ),
              SizedBox(height: 20.0,),
              InputDecorator(
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.fromLTRB(12, 12, 12, 12),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(10.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<CategoriesModel>(

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    hint: Text(
                      "اختر الفئة",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    items: subCategoriesList
                        .map<DropdownMenuItem<CategoriesModel>>(
                            (CategoriesModel value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Row(
                              children: [
                                new CircleAvatar(
                                  backgroundImage: new NetworkImage(
                                      value.category_logo),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(value.category_name),
                              ],
                            ),
                          );
                        }).toList(),

                    isExpanded: true,
                    isDense: true,
                    onChanged: (CategoriesModel newSelectedSubCategory) {
                      setState(() {
                        _subCategoryChoose = newSelectedSubCategory;
                      });
                    },
                    value: _subCategoryChoose,

                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           GrowthPage()),
                      // );
                    },
                    child: Text(
                      "النمو",
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                    color: Colors.green,
                    elevation: 5.0,
                    minWidth: 80,
                    height: 50,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SalesPage()),
                      );
                    },
                    child: Text(
                      "المبيعات",
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                    color: Colors.green,
                    elevation: 5.0,
                    minWidth: 80,
                    height: 50,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  MaterialButton(
                    onPressed: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           ProfitsPage()),
                      // );
                    },
                    child: Text(
                      "الأرباح ",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    color: Colors.green,
                    elevation: 5.0,
                    minWidth: 80,
                    height: 50,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.white,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),

            ],
          ),
        ),
        ));
  }
}

class CategoriesModel{
  String category_name;
  String category_logo;
  CategoriesModel(this.category_name,this.category_logo);
}
