import 'package:flutter/material.dart';
class InputWidgetsDemo extends StatefulWidget{
  const InputWidgetsDemo({super.key});
  @override
  State<InputWidgetsDemo> createState()=> _InputWidgetsDemoState();
}
class _InputWidgetsDemoState extends State<InputWidgetsDemo>{
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _ischecked = false;
  String _selectedRadio = 'Option 1';
  bool _isSwitchOn = false;
  double _sliderValue = 20.0;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _dropdownValue;
  String? _autoCompleteValue;
  bool _isFocused = false;
  String _keyPressed = "";


  Future<void> _pickDate() async{
    final DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100),initialDate: DateTime.now());
    if(picked != null){
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async{
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(picked != null){
      setState(() {
        _selectedTime = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Input Widgets Demo')),
      body: SingleChildScrollView(
        padding : const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children : [
            const Text('TextField:'),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter some text',
              ),
            ),
            const SizedBox(height: 20,),
            const Text('TextFormField inside Form : '),
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Name cannot be empty";
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Form Validated')),
                );
              }
            }, child: const Text('Submit'),),
            const SizedBox(height: 20,),
            Row(children: [
              Checkbox(value: _ischecked, onChanged: (val){
                setState(() {
                  _ischecked = val ?? false;
                });
              },),
              const Text('Accept terms and conditions'),
            ],),
            const SizedBox(height: 20,),
            const Text('Radio Buttons : '),
            Column(
              children: [
                RadioListTile<String>(value: 'Option 1', title: const Text('Option 1'),groupValue: _selectedRadio,onChanged: (value){
                  setState(() {
                    _selectedRadio = value!;
                  });
                },)
              ],
            ),
        const SizedBox(height: 20,),
            Row(children: [
              const Text('Switch:'),
              Switch(value: _isSwitchOn, onChanged: (val){
                setState(() {
                  _isSwitchOn = val;
                });
              },),
            ],),
            const SizedBox(height: 20,),
            const Text('Slider'),
            Slider(value: _sliderValue, min: 0,max: 100,divisions: 10, label: _sliderValue.round().toString(), onChanged: (val){
              setState(() {
                _sliderValue = val;
              });
            },),
            Text('Slider value: $_sliderValue'),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: _pickDate, child: const Text('Pick Date'),),
            Text(_selectedDate == null ? "No date selected": "Selected Date: ${_selectedDate!.toLocal()}".split(" ")[0]),
            const SizedBox(height:20),
            ElevatedButton(onPressed: _pickTime, child: const Text('Pick Time'),),
            Text(_selectedTime == null ? "No time selected": "Selected Time: ${_selectedTime!.format(context)}"),
            const SizedBox(height: 20,),

            const Text('DropdownButton:'),
            DropdownButton<String>(
              hint: const Text('Select an option'),
              value: _dropdownValue,
              onChanged: (String? newValue){
                setState(() {
                  _dropdownValue = newValue;
                });
              },
              items: <String>['Apple','Banana','Cherry','Mango'].map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20,),
            const Text('Autocomplete:'),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue){
                if (textEditingValue.text.isEmpty){
                  return const Iterable<String>.empty();
                }
                return ['India','Indonesia','USA','UK','Canada'].where((option)=>option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (val){
                setState(() {
                  _autoCompleteValue = val;
                });
              },
            ),
            Text(_autoCompleteValue == null? 'No country selected':'Selected : $_autoCompleteValue'),
            const SizedBox(height: 20,),
            const Text('GestureDetector : Tap the box below'),
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Box tapped!')),
                );
              },
              child: Container(
                height: 80,
                width: double.infinity,
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text('Tap me', style: TextStyle(color:Colors.white),),
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Focus Example'),
            Focus(
              onFocusChange: (hasFocus){
                setState(() {
                  _isFocused = hasFocus;
                });
              },
              child: TextField(
                decoration: InputDecoration(
                  labelText: _isFocused ? 'Focused':'Not Focused',),
              ),
            ),
            const SizedBox(height: 20,),
            const Text('RawKeyBoardListener (type something): '),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey : (event){
                setState(() {
                  _keyPressed = event.logicalKey.debugName ?? "";
                });
              },
              child:const TextField(
                decoration: InputDecoration(
                  hintText:
                    'Type here',
                ),
              ),
            ),
            Text('Last key Pressed: $_keyPressed')
          ],
        ),
      ),
    );}}