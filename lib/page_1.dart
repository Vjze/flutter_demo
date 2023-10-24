import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var len = appState.len;
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: appState.input,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                      onPressed: () {
                        appState.input.clear();
                      },
                      icon: Icon(Icons.cancel),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("数量：$len"),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      appState.getresult();
                    },
                    child: Text("查询"),
                  ),
                ),
              ],
            ),
            Table(
                columnWidths: {},
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    children: [
                      TableCell(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                            for (var title in appState.title)
                              Text(
                                title,
                                textAlign: TextAlign.center,
                              ),
                          ]))
                      // Text(
                      //   'Sn',
                      //   textAlign: TextAlign.center,
                      // ),
                      // Text(
                      //   '料号',
                      //   textAlign: TextAlign.center,
                      // ),
                      // Text(
                      //   '工单周',
                      //   textAlign: TextAlign.center,
                      // ),
                      // Text(
                      //   '操作员',
                      //   textAlign: TextAlign.center,
                      // ),
                      // Text(
                      //   '装盒时间',
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                  // for (var str in appState.recc)
                  for (var st in appState.result)
                    TableRow(children: [
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // for (var st1 in st)
                            Text(
                              st.pno,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              st.sn,
                              textAlign: TextAlign.center,
                            ),
                            Text(st.pn),
                            Text(st.order),
                            Text(st.workid),
                            Text(st.datatime),
                          ],
                        ),
                      )
                    ])
                ])
          ],
        ));
  }
}
