import 'package:flutter_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var len = appState.len;
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
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
