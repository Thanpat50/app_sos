import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalIDPage extends StatefulWidget {
  const MedicalIDPage({super.key});

  @override
  State<MedicalIDPage> createState() => _MedicalIDPageState();
}

class _MedicalIDPageState extends State<MedicalIDPage> {
  String firstName = '';
  String lastName = '';
  String age = '';
  String height = '';
  String weight = '';
  String bloodType = '';
  String birthDate = '';
  String disease = '';
  String allergy = '';
  String address = '';

  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadMedicalInfo();
  }

  Future<void> _loadMedicalInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('firstName') ?? '';
      lastName = prefs.getString('lastName') ?? '';
      age = prefs.getString('age') ?? '';
      height = prefs.getString('height') ?? '';
      weight = prefs.getString('weight') ?? '';
      bloodType = prefs.getString('bloodType') ?? '';
      birthDate = prefs.getString('birthDate') ?? '';
      disease = prefs.getString('disease') ?? '';
      allergy = prefs.getString('allergy') ?? '';
      address = prefs.getString('address') ?? '';
    });
  }

  Future<void> _saveMedicalInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('age', age);
    await prefs.setString('height', height);
    await prefs.setString('weight', weight);
    await prefs.setString('bloodType', bloodType);
    await prefs.setString('birthDate', birthDate);
    await prefs.setString('disease', disease);
    await prefs.setString('allergy', allergy);
    await prefs.setString('address', address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isEditing
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              isEditing = false;
                            });
                          },
                        )
                      : const Text(
                          'ฉัน',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                  if (!isEditing)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      child: const Text(
                        'แก้ไขข้อมูล',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text(
                    'Medical ID',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: isEditing ? _buildEditForm() : _buildDisplayInfo(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisplayInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('ข้อมูล'),
        _infoRow('ชื่อ', firstName, 'นามสกุล', lastName),
        _infoRow('ส่วนสูง', height.isNotEmpty ? '$height ซม.' : '', 'น้ำหนัก', weight.isNotEmpty ? '$weight กก.' : ''),
        _infoRow('กรุ๊ปเลือด', bloodType, 'อายุ', age.isNotEmpty ? '$age ปี' : ''),
        const SizedBox(height: 10),
        _sectionTitle('วันเกิด'),
        Text(birthDate, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        _sectionTitle('โรคประจำตัว'),
        Text(disease, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        _sectionTitle('ประวัติการแพ้ยา'),
        Text(allergy, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        _sectionTitle('ที่อยู่'),
        Text(address, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildEditForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('ข้อมูล'),
          _textFormRow('ชื่อ', (val) => firstName = val, 'นามสกุล', (val) => lastName = val),
          _textFormRow('ส่วนสูง', (val) => height = val, 'น้ำหนัก', (val) => weight = val),
          _textFormRow('กรุ๊ปเลือด', (val) => bloodType = val, 'อายุ', (val) => age = val),
          const SizedBox(height: 10),
          _sectionTitle('วันเกิด'),
          _textFormField('วันเกิด', (val) => birthDate = val),
          const SizedBox(height: 10),
          _sectionTitle('โรคประจำตัว'),
          _textFormField('โรคประจำตัว', (val) => disease = val),
          const SizedBox(height: 10),
          _sectionTitle('ประวัติการแพ้ยา'),
          _textFormField('ประวัติการแพ้ยา', (val) => allergy = val),
          const SizedBox(height: 10),
          _sectionTitle('ที่อยู่'),
          _textFormField('ที่อยู่', (val) => address = val),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _saveMedicalInfo();
                  setState(() {
                    isEditing = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('บันทึก', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _infoRow(String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(label1.isNotEmpty ? '$label1: $value1' : value1, style: const TextStyle(fontSize: 16))),
          const SizedBox(width: 16),
          Expanded(child: Text(label2.isNotEmpty ? '$label2: $value2' : value2, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _textFormRow(String label1, Function(String) onSave1, String label2, Function(String) onSave2) {
    return Row(
      children: [
        Expanded(child: _textFormField(label1, onSave1)),
        const SizedBox(width: 16),
        if (label2.isNotEmpty)
          Expanded(child: _textFormField(label2, onSave2))
        else
          const Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _textFormField(String label, Function(String) onSave) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: onSave,
        keyboardType: label.contains('อายุ') || label.contains('น้ำหนัก') || label.contains('ส่วนสูง')
            ? TextInputType.number
            : TextInputType.text,
      ),
    );
  }
}
