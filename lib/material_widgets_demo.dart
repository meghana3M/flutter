import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main(){
  runApp(const MyWidgetCatalogApp());
}

class MyWidgetCatalogApp extends StatelessWidget{
  const MyWidgetCatalogApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Widget Catalog',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    final demos = {
      'FloatingActionButton':const FABDemo(),
      'BottomNavigationBar':const BottomNavDemo(),
      'TabBar & TabBarView':const TabBarDemo(),
      'Drawer': const DrawerDemo(),
      'SnackBar':const SnackBarDemo(),
      'Tooltip':const TooltipDemo(),
      'Dialog & AlertDialog':const DialogDemo(),
      'SimpleDialog':const SimpleDialogDemo(),
      'ExpansionPanelList':const ExpansionPanelDemo(),
      'Stepper':const StepperDemo(),
      'DateTable':const DataTableDemo(),
      'PaginatedDataTable':const PaginatedDataTableDemo(),
      'CupertinoButton':const CupertinoButtonDemo(),
      'CupertinoNavigationBar':const CupertinoNavBarDemo(),
      'CupertinoTabBar':const CupertinoTabBarDemo(),
      'CupertinoPageScaffold':const CupertinoPageScaffoldDemo(),
      'CupertinoPicker':const CupertinoPickerDemo(),
      'CupertinoSwitch':const CupertinoSwitchDemo(),
      'CupertinoTextField':const CupertinoTextFieldDemo(),
      'CupertinoAlertDialog': const CupertinoAlertDialogDemo(),
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Catalog'),),
      body: ListView(
        children: demos.entries.map((entry){
          return ListTile(
            title: Text(entry.key),
            trailing: const Icon(Icons.arrow_forward),
            onTap: ()=> Navigator.push(context,
             MaterialPageRoute(builder: (_) => entry.value),
            ),);
        }).toList(),
      ),
    );
  }
}
//MaterialWidget Demos

class FABDemo extends StatelessWidget{
  const FABDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('FloatingActionButton'),),
      body: const Center(child: Text('Press the FAB below'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('FAB Pressed!'),),
        );
      }, child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomNavDemo extends StatefulWidget{
  const BottomNavDemo({super.key});
  @override
  State<BottomNavDemo> createState() => _BottomNavDemoState();
}
class _BottomNavDemoState extends State<BottomNavDemo>{
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: Text('Tab $_selectedIndex selected'),),
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
      ],onTap: (index)=> setState(() => _selectedIndex = index),
        currentIndex: _selectedIndex,),
    );
  }
}
class TabBarDemo extends StatelessWidget{
  const TabBarDemo({super.key});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(title: const Text('TabBar Demo'),
      bottom: const TabBar(tabs: [
        Tab(text:'one'),
        Tab(text:'Two'),
        Tab(text: 'Three'),
      ],),
      ),
      body: const TabBarView(children: [
        Center(child: Text('Tab One'),),
        Center(child: Text('Tab Two'),),
        Center(child: Text('Tab Three'),),
      ],),
    ),);
  }
}

class DrawerDemo extends StatelessWidget{
  const DrawerDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Demo')),
      drawer: Drawer(
        child: ListView(
          children: const[
            DrawerHeader(child: Text('Header')),
            ListTile(title: Text("Item 1"),),
            ListTile(title: Text("Item 2"),),
          ],
        ),
      ),
      body: const Center(child: Text('Swipe from left to open drawer'),),
    );
  }
}
class SnackBarDemo extends StatelessWidget{
  const SnackBarDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Demo'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hello Snackbar')),);
        }, child: const Text('Show SnackBar'),),
      ),
    );
  }
}
class TooltipDemo extends StatelessWidget{
  const TooltipDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Demo'),
      ),
      body: const Center(child: Tooltip(message:
        'This is a tooltip',
         child: Icon(Icons.info, size: 50),
      ),),
    );
  }
}
class  DialogDemo extends StatelessWidget{
  const DialogDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Demo'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (_)=> AlertDialog(
            title: const Text('AlertDialog'),
            content: const Text('This is a dialog message.'),
            actions: [
              TextButton(onPressed: ()=> Navigator.pop(context), child: const Text('OK'))
            ],
          ));
        }, child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}
class SimpleDialogDemo extends StatelessWidget{
  const SimpleDialogDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('SimpleDialog Demo'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (_)=> SimpleDialog(
            title: const Text('Pick an option'),
            children: [
              SimpleDialogOption(
                onPressed: ()=> Navigator.pop(context),
                child: const Text('Option 2'),
              ),
            ],
          ));
        }, child: const Text('Show SimpleDialog'),),
      ),
    );
  }
}

class ExpansionPanelDemo extends StatefulWidget{
  const ExpansionPanelDemo({super.key});
  @override
  State<ExpansionPanelDemo> createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo>{
  bool _expanded = false;
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(title: const Text('ExpansionPanelList'),),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (_,isOpen)=> setState(() => _expanded = !isOpen),
          children: [
            ExpansionPanel(
                headerBuilder: (_,__) => const ListTile(title: Text('Tap to Expand'),),
                body: const ListTile(title: Text('Expanded Content'),),
                isExpanded: _expanded,
            )
          ],
        ),
      ),
    );
  }
}
class StepperDemo extends StatefulWidget{
  const StepperDemo({super.key});
  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo>{
  int _currentStep =0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Stepper Demo'),),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (step)=> setState(() => _currentStep = step),
        steps: const [
          Step(title: Text('Step 1'), content: Text('Do something')),
          Step(title: Text('Step 2'), content: Text('Do next thing')),
        ],
      ),
    );
  }
}

class DataTableDemo extends StatelessWidget{
  const DataTableDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('DataTable Demo'),),
      body: DataTable(columns: const[
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Age')),
      ], rows: const[
        DataRow(cells: [DataCell(Text('Alice')),
        DataCell(Text('20'))
        ]),
        DataRow(cells: [DataCell(Text('Bob')),DataCell(Text('25'))]),
      ],),
    );
  }
}

class PaginatedDataTableDemo extends StatelessWidget{
  const PaginatedDataTableDemo({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('PaginatedDataTable')),
      body: PaginatedDataTable(header: const Text('Users'),
        rowsPerPage: 2,
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Age')),
      ], source: _DataSource(),
      ),
    );
  }
}
class _DataSource extends DataTableSource{
  final data = [
    {'name':"Alice",'age':20},
    {'name':"Bob",'age':25},
    {'name':"Charlie",'age':'30'},
  ];

  @override
  DataRow? getRow(int index){
    if(index >= data.length)
      return null;
    final item = data[index];
    return DataRow(cells: [
      DataCell(Text(item['name'].toString())),
      DataCell(Text(item['age'].toString())),
    ]);
  }
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;
}


//Cupertino widget  demos

class CupertinoButtonDemo extends StatelessWidget{
  const CupertinoButtonDemo({super.key});
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text(
        'CupertinoButton'
      ),),
      child: Center(child: CupertinoButton(
        color: CupertinoColors.activeBlue,
        child: const Text('Press Me'),
        onPressed: (){},
      ),),
    );
  }
}
class  CupertinoNavBarDemo extends StatelessWidget{
  const CupertinoNavBarDemo({super.key});
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Navigation Bar'),),
      child: const Center(child: Text('Context'),),
    );
  }
}
class CupertinoTabBarDemo extends StatelessWidget{
  const CupertinoTabBarDemo({super.key});
  @override
  Widget build(BuildContext context){
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(items: const[
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
    ]), tabBuilder: (_ , index)=> Center(child: Text('Tab $index'),));
  }
}

class CupertinoPageScaffoldDemo extends StatelessWidget {
  const CupertinoPageScaffoldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Page Scaffold'),),
      child: Center(child: Text('This is a CupertinoPageScaffold'),),
    );
  }
}
class CupertinoPickerDemo extends StatelessWidget{
  const CupertinoPickerDemo({super.key});
  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(middle: Text('CupertinoPicker'),),
    child: Center(
      child: CupertinoPicker(
        itemExtent: 40,
        onSelectedItemChanged: (index){},
        children:const[
          Text('one'),
          Text('Two'),
          Text('Three'),
        ],
      ),
    ));
  }
}

class CupertinoSwitchDemo extends StatefulWidget{
  const  CupertinoSwitchDemo({super.key});
  @override
  State<CupertinoSwitchDemo> createState() => _CupertinoSwitchDemoState();
}
class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo>{
   bool _value = false;
   @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('CupertinoSwitch'),),
  child: Center(
  child: CupertinoSwitch(value: _value, onChanged: (val)=> setState(()=> _value = val),),
  ),
    );
  }
  }

  class CupertinoTextFieldDemo extends StatelessWidget{
    const CupertinoTextFieldDemo({super.key});
    @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('CupertinoTextField'),),
      child: const Padding(padding: EdgeInsets.all(16),
      child: CupertinoTextField(placeholder: 'Enter Text',),
  ),
    );
  }
  }

  class CupertinoAlertDialogDemo extends StatelessWidget{
   const CupertinoAlertDialogDemo({super.key});
   @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('CupertinoAlertDialog'),),
      child: Center(
    child: CupertinoButton(child: const Text('Show Alert'), onPressed:(){
      showCupertinoDialog(context: context, builder: (_)=> CupertinoAlertDialog(
  title: const Text('Alert'),
  content: const Text('This is a cupertinoalertdialog'),
  actions: [
    CupertinoDialogAction(child: const Text('OK'),
  onPressed: ()=> Navigator.pop(context),)
  ],
  ));
    }
  ),
  ),

    );
  }
}