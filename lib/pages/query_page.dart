import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:rinf/rinf.dart';
import 'page.dart';
import 'package:flutter_demo/messages/query_resource.pb.dart' as queryResource;

class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> with PageMixin {
  bool selected = true;
  String? comboboxValue;
  final input = TextEditingController();
  DateTime starttime = DateTime.now();
  DateTime endtime = DateTime.now();
  final List<String> comboboxItems = [
    'Sn查询',
    '盒号查询',
    '箱号查询',
    '工号查询',
  ];
  String? comboboxItem;
  String dropdownItem = 'Sn查询';
  final boxtitle = <String>["盒号", "Sn", "料号", "工单", "操作员", "装盒时间"];
  var boxresult = [];
  var boxlen = "";
  void getresult() async {
    final requestMessage = queryResource.ReadRequest(
      inputString: input.text,
    );
    final rustRequest = RustRequest(
      resource: queryResource.ID,
      operation: RustOperation.Read,
      message: requestMessage.writeToBuffer(),
    );
    final rustResponse = await requestToRust(rustRequest);
    final responseMessage = queryResource.ReadResponse.fromBuffer(
      rustResponse.message!,
    );
    setState(() {
      boxresult = responseMessage.outputLists;
      boxlen = boxresult.length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              constraints.maxWidth < 960
                  ? Column(children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: TextBox(
                                placeholder: "输入要查询的SN、箱号、盒号或者工号......",
                                controller: input,
                                suffix: IconButton(
                                  icon: const Icon(FluentIcons.cancel),
                                  onPressed: () {
                                    input.clear();
                                  },
                                ),
                                textInputAction: TextInputAction.search,
                                onEditingComplete: () {
                                  getresult();
                                },
                              )),
                          Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FilledButton(
                                    child: const Text('查 询'),
                                    onPressed: () {
                                      getresult();
                                    },
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: DropDownButton(
                              items: comboboxItems
                                  .map(
                                    (e) => MenuFlyoutItem(
                                      text: Text(e),
                                      onPressed: () =>
                                          setState(() => dropdownItem = e),
                                    ),
                                  )
                                  .toList(),
                              title: Text(dropdownItem),
                            ),
                          ),
                          Expanded(
                            child: dropdownItem == "箱号查询" ||
                                    dropdownItem == "盒号查询"
                                ? Row(children: [
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              icon: const Icon(
                                                  FluentIcons.date_time12),
                                              onPressed: () async {
                                                final newTime =
                                                    await m.showDatePicker(
                                                  context: context,
                                                  initialDate: starttime,
                                                  firstDate: DateTime(
                                                      starttime.year - 100),
                                                  lastDate: DateTime(
                                                      starttime.year + 100),
                                                );
                                                if (newTime != null) {
                                                  setState(() =>
                                                      starttime = newTime);
                                                }
                                              },
                                            ))),
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              icon:
                                                  const Icon(FluentIcons.timer),
                                              onPressed: () async {
                                                final newTime =
                                                    await m.showTimePicker(
                                                  context: context,
                                                  initialTime: m.TimeOfDay(
                                                    hour: starttime.hour,
                                                    minute: starttime.minute,
                                                  ),
                                                );
                                                if (newTime != null) {
                                                  starttime = DateTime(
                                                    starttime.year,
                                                    starttime.month,
                                                    starttime.day,
                                                    newTime.hour,
                                                    newTime.minute,
                                                    starttime.second,
                                                  );
                                                }
                                              },
                                            ))),
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              icon: const Icon(
                                                  FluentIcons.date_time12),
                                              onPressed: () async {
                                                final newTime =
                                                    await m.showDatePicker(
                                                  context: context,
                                                  initialDate: endtime,
                                                  firstDate: DateTime(
                                                      endtime.year - 100),
                                                  lastDate: DateTime(
                                                      endtime.year + 100),
                                                );
                                                if (newTime != null) {
                                                  setState(
                                                      () => endtime = newTime);
                                                }
                                              },
                                            ))),
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              icon:
                                                  const Icon(FluentIcons.timer),
                                              onPressed: () async {
                                                final newTime =
                                                    await m.showTimePicker(
                                                  context: context,
                                                  initialTime: m.TimeOfDay(
                                                    hour: endtime.hour,
                                                    minute: endtime.minute,
                                                  ),
                                                );
                                                if (newTime != null) {
                                                  endtime = DateTime(
                                                    endtime.year,
                                                    endtime.month,
                                                    endtime.day,
                                                    newTime.hour,
                                                    newTime.minute,
                                                    endtime.second,
                                                  );
                                                }
                                              },
                                            ))),
                                  ])
                                : const SizedBox(),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "数量：$boxlen",
                                    textAlign: TextAlign.right,
                                  ))),
                        ],
                      )
                    ])
                  : Row(children: [
                      Expanded(
                          flex: 4,
                          child: TextBox(
                            placeholder: "输入要查询的SN、箱号、盒号或者工号......",
                            controller: input,
                            suffix: IconButton(
                              icon: const Icon(FluentIcons.cancel),
                              onPressed: () {
                                input.clear();
                              },
                            ),
                            textInputAction: TextInputAction.search,
                            onEditingComplete: () {
                              getresult();
                            },
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropDownButton(
                              items: comboboxItems
                                  .map(
                                    (e) => MenuFlyoutItem(
                                      text: Text(e),
                                      onPressed: () =>
                                          setState(() => dropdownItem = e),
                                    ),
                                  )
                                  .toList(),
                              title: Text(dropdownItem),
                            ),
                          )),
                      Expanded(
                        child: dropdownItem == "箱号查询" || dropdownItem == "盒号查询"
                            ? Row(children: [
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: const Icon(
                                              FluentIcons.date_time12),
                                          onPressed: () async {
                                            final newTime =
                                                await m.showDatePicker(
                                              context: context,
                                              initialDate: starttime,
                                              firstDate: DateTime(
                                                  starttime.year - 100),
                                              lastDate: DateTime(
                                                  starttime.year + 100),
                                            );
                                            if (newTime != null) {
                                              setState(
                                                  () => starttime = newTime);
                                            }
                                          },
                                        ))),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: const Icon(FluentIcons.timer),
                                          onPressed: () async {
                                            final newTime =
                                                await m.showTimePicker(
                                              context: context,
                                              initialTime: m.TimeOfDay(
                                                hour: starttime.hour,
                                                minute: starttime.minute,
                                              ),
                                            );
                                            if (newTime != null) {
                                              starttime = DateTime(
                                                starttime.year,
                                                starttime.month,
                                                starttime.day,
                                                newTime.hour,
                                                newTime.minute,
                                                starttime.second,
                                              );
                                            }
                                          },
                                        ))),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: const Icon(
                                              FluentIcons.date_time12),
                                          onPressed: () async {
                                            final newTime =
                                                await m.showDatePicker(
                                              context: context,
                                              initialDate: endtime,
                                              firstDate:
                                                  DateTime(endtime.year - 100),
                                              lastDate:
                                                  DateTime(endtime.year + 100),
                                            );
                                            if (newTime != null) {
                                              setState(() => endtime = newTime);
                                            }
                                          },
                                        ))),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: const Icon(FluentIcons.timer),
                                          onPressed: () async {
                                            final newTime =
                                                await m.showTimePicker(
                                              context: context,
                                              initialTime: m.TimeOfDay(
                                                hour: endtime.hour,
                                                minute: endtime.minute,
                                              ),
                                            );
                                            if (newTime != null) {
                                              endtime = DateTime(
                                                endtime.year,
                                                endtime.month,
                                                endtime.day,
                                                newTime.hour,
                                                newTime.minute,
                                                endtime.second,
                                              );
                                            }
                                          },
                                        ))),
                              ])
                            : const SizedBox(),
                      ),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "数量：$boxlen",
                                textAlign: TextAlign.right,
                              ))),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FilledButton(
                                child: const Text('查 询',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  getresult();
                                },
                              ),
                            ]),
                      ),
                    ]),
              dropdownItem == "盒号查询"
                  ? Table(
                      columnWidths: const {},
                      border: TableBorder.all(
                          width: 2.0,
                          color: const Color.fromARGB(255, 148, 147, 147)),
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                  for (var title in boxtitle)
                                    Text(title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                ]))
                          ],
                        ),
                        for (var st in boxresult)
                          TableRow(children: [
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                  : const SizedBox()
            ],
          ),
        ),
      );
    });
  }
}
