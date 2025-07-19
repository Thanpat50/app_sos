import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'medical_id_page.dart';


void main() {
  runApp(MySOSApp());
}

class MySOSApp extends StatefulWidget {
  @override
  _MySOSAppState createState() => _MySOSAppState();
}

class _MySOSAppState extends State<MySOSApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    SOSPage(),
    MedicalIDPage(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My SOS',
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'My SOS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services, size: 30, color: Colors.black),
              label: '',
            ),
          ],
          selectedItemColor: Colors.red,
        ),
      ),
    );
  }
}


//**************** ลิงก์หน้าไปหน้าโทรออก ****************//

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  void _navigateToDetail(BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EmergencyDetailPage(
          icon: data['icon'],
          title: data['title'],
          subtitle: data['subtitle'],
          color: data['color'],
          phone: data['phone'],
        ),
      ),
    );
  }


//********************************//


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardData = [
      {
        'icon': Icons.local_hospital,
        'title': 'กู้ภัย ฉุกเฉิน',
        'subtitle': 'สายด่วนฉุกเฉิน',
        'color': Colors.red,
        'phone': '1669',
      },
      {
        'icon': Icons.local_police,
        'title': 'ตำรวจ',
        'subtitle': 'เหตุด่วน เหตุร้าย',
        'color': Colors.blue,
        'phone': '191',
      },
      {
        'icon': Icons.directions_boat,
        'title': 'อุบัติเหตุทางน้ำ',
        'subtitle': 'แจ้งเหตุทางน้ำ',
        'color': Colors.teal,
        'phone': '1196',
      },
      {
        'icon': Icons.fire_extinguisher,
        'title': 'เพลิงไหม้',
        'subtitle': 'แจ้งเหตุเพลิงไหม้',
        'color': Colors.orange,
        'phone': '199',
      },
    ];

    final List<Map<String, dynamic>> contactList = [
      {
        'icon': Icons.flash_on,
        'title': 'การไฟฟ้านครหลวง',
        'subtitle': 'แจ้งไฟฟ้าขัดข้อง (กรุงเทพมหานคร จังหวัดนนทบุรี และจังหวัดสมุทรปราการ)',
        'color': Colors.black,
        'phone': '1130',
      },
      {
        'icon': Icons.flash_on,
        'title': 'การไฟฟ้าส่วนภูมิภาค',
        'subtitle': 'แจ้งไฟฟ้าขัดข้อง',
        'color': Colors.yellow,
        'phone': '1129',
      },
            {
        'icon': Icons.water,
        'title': 'การประปาส่วนภูมิภาค',
        'subtitle': 'แจ้งปัญหาน้ำประปา',
        'color': Colors.blueAccent,
        'phone': '1662',
      },
      {
        'icon': Icons.water_drop,
        'title': 'การประปานครหลวง',
        'subtitle': 'แจ้งปัญหาน้ำประปา (กรุงเทพมหานคร จังหวัดนนทบุรี และจังหวัดสมุทรปราการ)',
        'color': Colors.lightBlueAccent,
        'phone': '1125',
      },
      {
        'icon': Icons.construction,
        'title': 'ความปลอดภัยกรมทางหลวง',
        'subtitle': 'กรมทางหลวง',
        'color': Colors.indigo,
        'phone': '1146',
      },
      {
        'icon': Icons.travel_explore,
        'title': 'ตำรวจท่องเที่ยว',
        'subtitle': 'Tourist Police',
        'color': Colors.green,
        'phone': '1155',
      },
      {
        'icon': Icons.directions_car,
        'title': 'แจ้งรถหาย',
        'subtitle': 'ศูนย์รถหาย',
        'color': Colors.purple,
        'phone': '1192',
      },
      {
        'icon': Icons.local_shipping,
        'title': 'ตำรวจทางหลวง',
        'subtitle': 'Highway Police',
        'color': Colors.brown,
        'phone': '1193',
      },
      {
        'icon': Icons.traffic,
        'title': 'ศูนย์ข้อมูลจราจร',
        'subtitle': 'จราจรกลาง',
        'color': Colors.deepOrange,
        'phone': '1197',
      },
      {
        'icon': Icons.warning_amber, 
        'title': 'ภัยพิบัติแห่งชาติ',
        'subtitle': 'ศูนย์แจ้งเตือนภัยพิบัติแห่งชาติ',
        'color': Colors.redAccent,
        'phone': '192',
      },
     {
        'icon': Icons.person_search,
        'title': 'แจ้งบุคคลสูญหาย',
        'subtitle': 'ศูนย์ประชาบดี',
        'color': Colors.deepPurple, 
        'phone': '1300',
      },
     {
        'icon': Icons.alt_route,
        'title': 'กรมทางหลวงชนบท',
        'subtitle': 'ท้องถนนในพื้นที่ต่างจังหวัด',
        'color': Colors.orange, 
        'phone': '1146',
     },
    {
        'icon': Icons.train, 
        'title': 'การรถไฟแห่งประเทศไทย',
        'subtitle': 'สอบถามสายรถไฟ ตั๋ว และอื่น ๆ',
        'color': Colors.green, 
        'phone': '1690',
    },
    {
      'icon': Icons.directions_car,
      'title': 'กรมการขนส่งทางบก',
      'subtitle': 'สอบถาม ตรวจสภาพรถ ทำใบขับขี่',
      'color': Colors.blueGrey,
      'phone': '1584',
    },
    {
      'icon': Icons.sync,
      'title': 'Zeaa',
      'subtitle': '',
      'color': Colors.red,
      'phone': '0649731986',
    },

    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SOSCountdownPage()),
                );
              },
              child: const Center(child: SOSCircleButton()),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.2,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(cardData.length, (index) {
                  return GestureDetector(
                    onTap: () => _navigateToDetail(context, cardData[index]),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              cardData[index]['icon'],
                              size: 40,
                              color: cardData[index]['color'],
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cardData[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  cardData[index]['subtitle'],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'เบอร์ติดต่ออื่น ๆ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                final contact = contactList[index];
                return GestureDetector(
                  onTap: () => _navigateToDetail(context, contact),
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: Icon(contact['icon'], color: contact['color']),
                      title: Text(
                        contact['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contact['subtitle'], style: const TextStyle(color: Colors.grey)),
                      trailing: const Icon(Icons.call, color: Colors.grey),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


//**************** นับถอยหลัง เวลา SOS ****************//

class SOSCountdownPage extends StatefulWidget {
  const SOSCountdownPage({super.key});

  @override
  State<SOSCountdownPage> createState() => _SOSCountdownPageState();
}

class _SOSCountdownPageState extends State<SOSCountdownPage> {
  int countdown = 5;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (countdown == 0) {
          timer.cancel();
          launchUrl(Uri(scheme: 'tel', path: '1669'));
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade700,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, size: 80, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'SOS',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '$countdown',
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, size: 30, color: Colors.white),
              onPressed: () {
                timer.cancel();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

//********************************//



//**************** หน้าโทรออก ****************//


class EmergencyDetailPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String phone;

  const EmergencyDetailPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.phone,
  });

void _makePhoneCall() async {
  final Uri url = Uri(scheme: 'tel', path: phone);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'ไม่สามารถโทรออกได้: $phone';
  }
}

//********************************//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: color),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: color,
              ),
              onPressed: _makePhoneCall,
              icon: const Icon(Icons.call, color: Colors.white),
              label: const Text('โทรออก', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class SOSCircleButton extends StatelessWidget {
  const SOSCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.shade700,
      ),
      child: Center(
        child: Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.shade900,
          ),
          child: const Center(
            child: Text(
              'SOS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

