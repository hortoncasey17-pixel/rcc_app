import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const RCCApp());

const navy = Color(0xFF1B3A6B);
const green = Color(0xFF5B9E30);
const greenPale = Color(0xFFEEF6E6);
const navyPale = Color(0xFFEEF2F8);
const borderColor = Color(0xFFDCE3EF);
const textGray = Color(0xFF6B7A99);

class RCCApp extends StatelessWidget {
  const RCCApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RCC Student Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy, secondary: green),
        useMaterial3: true,
      ),
      home: const MainNav(),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _index = 0;

  final _screens = const [
    HomeScreen(), ResidencyScreen(), CanvasScreen(),
    TutoringScreen(), CareerScreen(), CounselingScreen(),
    AccessibilityScreen(), SoarScreen(), MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        backgroundColor: navy,
        selectedItemColor: green,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Residency'),
          BottomNavigationBarItem(icon: Icon(Icons.laptop), label: 'Canvas'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Tutoring'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Career'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Counseling'),
          BottomNavigationBarItem(icon: Icon(Icons.accessibility_new), label: 'Access'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'SOAR'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        ],
      ),
    );
  }
}

// HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130, pinned: true, backgroundColor: navy,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [navy, Color(0xFF254D8F)],
                    begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(children: [
                      Image.asset(
                        'assets/rcc_logo.png',
                        height: 48,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      const Text('Student Services Hub', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [navy, Color(0xFF254D8F)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome to RCC!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Find residency info, Canvas help, tutoring, career support, counseling, and more.',
                    style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5)),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () => _callPhone('9102723700'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(20)),
                      child: const Text('(910) 272-3700',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: Text('STUDENT SERVICES',
                style: TextStyle(color: textGray, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _Tile('Residency', 'NC residency, required docs & appeals', Icons.assignment, 1),
              _Tile('Canvas Login', 'Step-by-step guide to your online courses', Icons.laptop, 2),
              _Tile('Tutoring', 'Free tutoring in person and online 24/7', Icons.menu_book, 3),
              _Tile('Career Center', 'Resume help, job search and employer connections', Icons.work, 4),
              _Tile('Counseling', 'Academic advising, personal support and crisis help', Icons.support_agent, 5),
              _Tile('Accessibility', 'Disability services, accommodations and ADA rights', Icons.accessibility_new, 6),
              _Tile('SOAR Center', 'Advising, retention support and academic success', Icons.star, 7),
              _Tile('Campus Map', 'Building directory - 5160 Fayetteville Rd', Icons.map, 8),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: greenPale, borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: green.withOpacity(0.3)),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('RCC Main Campus', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  const Text('5160 Fayetteville Rd, Lumberton, NC 28360', style: TextStyle(color: textGray, fontSize: 13)),
                  const Text('Mon - Fri  |  8:00 AM - 5:00 PM', style: TextStyle(color: textGray, fontSize: 13)),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _openUrl('https://forms.office.com/pages/responsepage.aspx?id=OssFMiAtfEyG6-4SlBaBsOjErjtw1YpNgXqm0-JDbddURVYyNUlYQ1RIVDJTSk9LNE1ISkIwVk1BSi4u&route=shorturl'),
                    child: const Text('www.robeson.edu',
                      style: TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 13, decoration: TextDecoration.underline)),
                  ),
                ]),
              ),
              const SizedBox(height: 30),
            ]),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final int index;
  const _Tile(this.title, this.subtitle, this.icon, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final nav = context.findAncestorStateOfType<_MainNavState>();
        nav?.setState(() => nav._index = index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(children: [
          Container(width: 48, height: 48,
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: navy, size: 24)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 3),
            Text(subtitle, style: const TextStyle(color: textGray, fontSize: 12)),
          ])),
          const Icon(Icons.chevron_right_rounded, color: green, size: 22),
        ]),
      ),
    );
  }
}

// RESIDENCY SCREEN
class ResidencyScreen extends StatefulWidget {
  const ResidencyScreen({super.key});
  @override
  State<ResidencyScreen> createState() => _ResidencyState();
}

class _ResidencyState extends State<ResidencyScreen> {
  int? _open;

  static const _items = [
    ['What is Residency Determination?', 'NC residency status determines whether you pay in-state or out-of-state tuition. To qualify as an in-state student, you or your parent or guardian must have established legal domicile in North Carolina for at least 12 consecutive months before the term begins.\n\nRCC uses the NC Residency Determination Service (RDS) to confirm residency. Note: RCC is not involved in the determination process - all decisions are made by RDS directly.', '', ''],
    ['How Do I Apply?', '1. Go to ncresidency.org and create an account.\n\n2. Complete your Residency Certification Number (RCN) application.\n\n3. Submit your RCN with your RCC admissions application.\n\n4. RDS reviews and notifies you of your status.\n\nNote: RCC does not make residency decisions. Contact RDS directly with any questions about your application.', 'https://www.ncresidency.org', 'Visit ncresidency.org'],
    ['What Documents Are Required?', 'NC Drivers License or State ID\n\nNC vehicle registration\n\nNC voter registration card\n\nRecent utility bill or lease showing NC address\n\nNC tax return from the most recent year\n\nParent or guardian documents if you are a dependent student\n\nAll documents must show 12 or more months of NC domicile.', '', ''],
    ['No SSN? TIN / Alien ID / Immigration Docs', 'If you or your parent does not have a Social Security Number, you may still be able to establish NC residency using alternative documentation.\n\nTIN or ITIN - a Taxpayer Identification Number can be used in place of an SSN in many cases\n\nAlien Registration Number (A-Number) - found on your Green Card or other USCIS documents\n\nUSCIS Immigration Documents - such as I-20, I-94, Visa, EAD card, or Permanent Resident Card\n\nPassport with valid US entry stamp\n\nIf a parent does not have an SSN, provide their ITIN or immigration documentation instead.\n\nRDS handles all immigration-related residency questions directly. RCC is not involved in the determination process. Call RDS to speak confidentially with a representative who can guide you through your specific situation.', 'tel:8443193640', 'Call RDS Toll-Free - 844.319.3640'],
    ['What If My Status Is Denied?', 'If RDS determines you do not qualify for in-state tuition, you have the right to appeal their decision.\n\nWhat is an Appeal?\nAn appeal is a formal request asking RDS to take another look at your case. You will need to provide additional documents that show you have been living in North Carolina.\n\nDocuments you may be asked to provide:\n\nUtility bill showing your parents name and NC address\n\nUtility bill from the previous year to show you have been in NC longer\n\nTax papers, state or federal\n\nLease or mortgage documents\n\nAny other documents RDS specifically requests\n\nWhat is Reconsideration?\nReconsideration is similar to an appeal but happens earlier in the process. If you believe RDS made a mistake or missed something, you can ask them to reconsider before filing a full appeal.\n\nTips for a Successful Appeal:\nGather as many documents as possible that show your NC address\n\nMake sure documents show your parents full name and address\n\nSubmit everything RDS asks for as quickly as possible\n\nKeep copies of everything you send\n\nRDS handles all appeals directly - RCC does not make residency decisions.', 'tel:8443193640', 'Contact RDS - 844.319.3640'],
    ['Military Students', 'Active duty military members who are stationed in North Carolina under military orders, and their dependents, may qualify for in-state tuition rates even if they are not NC residents.\n\nEligibility is based on military status and may require documentation such as:\n\nMilitary orders\n\nProof of active duty status\n\nDependent verification\n\nBecause requirements can vary, additional review may be needed. Contact RDS directly for guidance on your specific situation.', 'tel:8443193640', 'Contact RDS - 844.319.3640'],
    ['DACA / Undocumented Students', 'Under North Carolina law, DACA and undocumented students are generally classified as non-residents for tuition purposes through the Residency Determination Service (RDS).\n\nThis means you are typically not eligible for in-state residency classification through RDS.\n\nHowever, colleges may offer institutional support, scholarships, or other funding opportunities based on your individual situation.\n\nWe encourage you to speak confidentially with an academic advisor to explore your options and available resources.', 'MULTI', 'DACA'],
    ['Emancipated Minors', 'If you are an emancipated minor in North Carolina, you may be eligible to establish your own legal residency for tuition purposes.\n\nTo qualify, you must provide official documentation showing that a court has granted you emancipated status. This allows you to be considered independent from your parent or guardian when determining residency.\n\nWhat you may need:\n\nCertified court order of emancipation\n\nProof of living independently in North Carolina\n\nDocumentation showing financial independence if requested\n\nBecause each situation is unique, additional review may be required. Contact RDS directly for guidance on your specific case.', 'tel:8443193640', 'Call RDS - 844.319.3640'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Residency Determination', 'NC residency affects your tuition rate - here is what you need to know.'),
        Expanded(child: ListView(padding: const EdgeInsets.symmetric(vertical: 12), children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: navy.withOpacity(0.15))),
            child: const Row(children: [
              Icon(Icons.info_outline, color: navy, size: 22),
              SizedBox(width: 10),
              Expanded(child: Text('RCC is not involved in the residency determination process. Contact RDS directly with all questions.',
                style: TextStyle(color: navy, fontSize: 13, fontWeight: FontWeight.w500, height: 1.4))),
            ]),
          ),
          ...List.generate(_items.length, (i) {
            final item = _items[i];
            final open = _open == i;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12),
                border: Border.all(color: open ? green : borderColor, width: open ? 2 : 1.5),
                boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
              ),
              child: Column(children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => _open = open ? null : i),
                  child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
                    const SizedBox(width: 4),
                    Expanded(child: Text(item[0], style: TextStyle(
                      color: open ? green : navy, fontWeight: FontWeight.w700, fontSize: 14))),
                    AnimatedRotation(turns: open ? 0.5 : 0, duration: const Duration(milliseconds: 250),
                      child: Icon(Icons.keyboard_arrow_down_rounded, color: open ? green : textGray)),
                  ])),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(
                      color: greenPale.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Divider(color: green.withOpacity(0.2), height: 1),
                      const SizedBox(height: 12),
                      Text(item[1], style: const TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.7)),
                      if (item[2].isNotEmpty) ...[
                        const SizedBox(height: 12),
                        if (item[2] == 'MULTI') ...[
                          _CallBtn('Call RDS Toll-Free - 844.319.3640', () => _callPhone('8443193640')),
                          const SizedBox(height: 8),
                          _CallBtn('Financial Aid Office - (910) 272-3352', () => _callPhone('9102723352')),
                          const SizedBox(height: 8),
                          _CallBtn('Foundation Office Scholarships - (910) 272-3334', () => _callPhone('9102723334')),
                        ] else
                          GestureDetector(
                            onTap: () => item[2].startsWith('tel:')
                              ? _callPhone(item[2].replaceFirst('tel:', ''))
                              : _openUrl(item[2]),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(color: green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: green.withOpacity(0.3))),
                              child: Text(item[3], style: const TextStyle(
                                color: green, fontWeight: FontWeight.w600, fontSize: 13)),
                            ),
                          ),
                      ],
                    ]),
                  ),
                  crossFadeState: open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ]),
            );
          }),
          const SizedBox(height: 20),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: ElevatedButton.icon(
            onPressed: () => _openUrl('https://www.ncresidency.org'),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: const Text('Apply at ncresidency.org'),
            style: ElevatedButton.styleFrom(backgroundColor: navy, foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          )),
          const SizedBox(height: 12),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: OutlinedButton.icon(
            onPressed: () => _callPhone('8443193640'),
            icon: const Icon(Icons.phone, size: 18),
            label: const Text('Call RDS Toll-Free - 844.319.3640'),
            style: OutlinedButton.styleFrom(foregroundColor: green,
              side: const BorderSide(color: green, width: 1.5),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          )),
          const SizedBox(height: 12),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: OutlinedButton.icon(
            onPressed: () => _openUrl('mailto:rdsinfo@ncresidency.org'),
            icon: const Icon(Icons.email, size: 18),
            label: const Text('Email RDS - rdsinfo@ncresidency.org'),
            style: OutlinedButton.styleFrom(foregroundColor: navy,
              side: const BorderSide(color: navy, width: 1.5),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          )),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

// ACCESSIBILITY SCREEN
class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Accessibility Services', 'RCC is committed to equal access for all students.'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Intro
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: const Text(
              'Robeson Community College is committed to providing education for all academically qualified students regardless of disabling conditions. The College seeks to enroll students who can complete college-level courses with the help of support services and classroom accommodations.\n\nA formal program for students with learning or physical disabilities is not offered; all students attend the same classes. Federal law prohibits RCC from requesting information regarding disabling conditions on the admissions application; therefore, it is the responsibility of the student to contact Student Services and make his/her disability known and to request academic adjustments and/or auxiliary aids.',
              style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.7)),
          ),

          // Support Services
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Support Services', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Support services may include, but are not limited to, the following auxiliary aids, services, and academic adjustments:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 14),
              ...[
                'Test administration modification',
                'Talking calculators',
                'Individual counseling',
                'Tutors',
                'Classroom modification',
                'Note takers',
                'Calculators or keyboards with large buttons',
                'Reaching device for library use',
                'Taped texts',
                'Interpreters',
                'Assistance with completing forms',
                'Readers',
              ].map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.check_circle_outline, color: green, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item, style: const TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.5))),
                ]),
              )),
            ]),
          ),

          // Contact Accessibility Coordinator
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navyPale, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.person, color: navy, size: 22),
                SizedBox(width: 8),
                Text('Accessibility Coordinator', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 10),
              const Text('If you need to speak with our Accessibility Coordinator, appointments can be made by contacting:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 12),
              const Text('Susan Mangum Moore', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(height: 10),
              _CallBtn('Call — (910) 272-3345', () => _callPhone('9102723345')),
              const SizedBox(height: 8),
              _CallBtn('Email — smoore@robeson.edu', () => _openUrl('mailto:smoore@robeson.edu')),
            ]),
          ),

          // Website Accessibility
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.language, color: navy, size: 22),
                SizedBox(width: 8),
                Text('Website Accessibility', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 10),
              const Text(
                'Robeson Community College is committed to making its website usable by all people by meeting or exceeding the requirements of the Web Content Accessibility Guidelines 2.0 Level AA (WCAG 2.0 AA). Please be aware that our efforts are ongoing as we incorporate the relevant improvements to meet WCAG 2.0 AA guidelines over time.\n\nIf you have specific questions or concerns about the accessibility of this site, need assistance using the processes found within this site, or encounter an accessibility issue, please be sure to specify the Web page and we will make all reasonable efforts to make that page accessible.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.7)),
              const SizedBox(height: 14),
              _CallBtn('Call IT Help Desk — (910) 272-3566', () => _callPhone('9102723566')),
              const SizedBox(height: 8),
              _CallBtn('Email — ithelpdesk@robeson.edu', () => _openUrl('mailto:ithelpdesk@robeson.edu')),
            ]),
          ),

        ])),
      ]),
    );
  }
}

// PLACEHOLDER SCREENS
class _Placeholder extends StatelessWidget {
  final String title, subtitle, emoji;
  const _Placeholder({required this.title, required this.subtitle, required this.emoji});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        _Header(title, subtitle),
        Expanded(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 90, height: 90,
            decoration: const BoxDecoration(color: navyPale, shape: BoxShape.circle),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 40)))),
          const SizedBox(height: 20),
          Text('$title\ncoming soon!', textAlign: TextAlign.center,
            style: const TextStyle(color: navy, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('This screen will be built next.', style: TextStyle(color: textGray, fontSize: 14)),
        ]))),
      ]),
    );
  }
}

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Canvas Login Guide', 'Simple steps to access your RCC online courses.'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // What is Canvas
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navyPale, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.info_outline, color: navy, size: 24),
                SizedBox(width: 10),
                Text('What is Canvas?', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 10),
              const Text('Canvas is RCC\'s online learning system. It is where you will find your course materials, assignments, grades, and messages from your instructor.', 
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: green.withOpacity(0.1), borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: green.withOpacity(0.3))),
                child: const Text('RCC is transitioning to Canvas this summer. Canvas replaces Moodle as our online learning platform.',
                  style: TextStyle(color: Color(0xFF2D5016), fontSize: 13, fontWeight: FontWeight.w500, height: 1.5)),
              ),
            ]),
          ),

          // Phase 1
          _PhaseHeader(phase: '1', title: 'Get Into Canvas', color: navy),
          _StepCard(step: 1, title: 'Get Your Login Credentials',
            body: 'Before you can log in you need your RCC username and password. You received these when you enrolled.\n\nYour username is usually your student email address.\n\nIf you do not have your login information contact the IT Help Desk right away.',
            callLabel: 'Call IT Help Desk - (910) 272-3566',
            onCall: () => _callPhone('9102723566')),
          _StepCard(step: 2, title: 'Go to the Canvas Website',
            body: 'Open any web browser on your phone or computer. Go to:\n\nrobeson.instructure.com\n\nYou can also go to robeson.edu and look for the Canvas link.',
            callLabel: 'Open Canvas Website',
            onCall: () => _openUrl('https://parents.canvaslms.com/login/canvas')),
          _StepCard(step: 3, title: 'Log In for the First Time',
            body: 'On the Canvas login page:\n\n1. Enter your RCC username in the Email box\n2. Enter your password\n3. Click the Log In button\n\nIf it is your first time logging in you may be asked to set up your account. Follow the instructions on screen.\n\nIf you forgot your password contact the IT Help Desk.',
            callLabel: 'Call IT Help Desk - (910) 272-3566',
            onCall: () => _callPhone('9102723566')),

          const SizedBox(height: 8),

          // Phase 2
          _PhaseHeader(phase: '2', title: 'Find Your Class', color: navy),
          _StepCard(step: 4, title: 'Find Your Dashboard',
            body: 'After logging in you will see your Dashboard. This is your home page in Canvas.\n\nYour courses appear as cards or tiles on the Dashboard. Each card shows the name of your course.\n\nIf you do not see your course it may not be published yet. Contact your advisor.',
            callLabel: null, onCall: null),
          _StepCard(step: 5, title: 'Open Your Course',
            body: 'Click or tap on the course card to open it.\n\nOnce inside your course look at the left side menu. You will see links like:\n\nHome - the course welcome page\nModules - your lessons and assignments\nSyllabus - course schedule and rules\nGrades - your current grades\nAnnouncements - messages from your instructor',
            callLabel: null, onCall: null),

          const SizedBox(height: 8),

          // Phase 3
          _PhaseHeader(phase: '3', title: 'Do Your Work', color: navy),
          _StepCard(step: 6, title: 'Find and Submit Assignments',
            body: 'Click Assignments or Modules in the left menu to find your work.\n\nTo submit an assignment:\n1. Click on the assignment name\n2. Read the instructions carefully\n3. Click the Submit Assignment button\n4. Upload your file or type your answer\n5. Click Submit again to confirm\n\nAlways check the due date before submitting.',
            callLabel: null, onCall: null),
          _StepCard(step: 7, title: 'Check Your Grades',
            body: 'Click Grades in the left menu to see all your scores.\n\nYou will see each assignment and your grade next to it.\n\nIf you have a question about a grade send a message to your instructor through Canvas.',
            callLabel: null, onCall: null),
          _StepCard(step: 8, title: 'Message Your Instructor',
            body: 'To contact your instructor through Canvas:\n\n1. Click the Inbox icon at the top of the page (it looks like an envelope)\n2. Click the Compose button\n3. Search for your instructor\'s name\n4. Type your message\n5. Click Send\n\nTip: Always include your full name and course name in your message.',
            callLabel: null, onCall: null),
          _StepCard(step: 9, title: 'Turn On Notifications',
            body: 'Turn on notifications so you never miss an announcement or grade.\n\n1. Click your name or profile picture in the top corner\n2. Click Notifications\n3. Turn on Email or Text notifications\n4. Make sure Announcements and Grades are turned on',
            callLabel: null, onCall: null),

          const SizedBox(height: 16),

          // Help Box
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: greenPale, borderRadius: BorderRadius.circular(14),
              border: const Border(left: BorderSide(color: green, width: 4)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.help_outline, color: green, size: 24),
                SizedBox(width: 10),
                Text('Need Help?', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 10),
              const Text('Canvas also has 24/7 student support. Click the Help button inside Canvas for live chat or phone support at any time.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 12),
              _CallBtn('Call RCC IT Help Desk - (910) 272-3566', () => _callPhone('9102723566')),
              const SizedBox(height: 8),
              _CallBtn('Open Canvas - robeson.instructure.com', () => _openUrl('https://parents.canvaslms.com/login/canvas')),
            ]),
          ),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class _PhaseHeader extends StatelessWidget {
  final String phase, title;
  final Color color;
  const _PhaseHeader({required this.phase, required this.title, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: navy, borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Container(
          width: 28, height: 28,
          decoration: BoxDecoration(color: green, shape: BoxShape.circle),
          child: Center(child: Text(phase, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))),
        ),
        const SizedBox(width: 12),
        Text('Phase $phase: $title', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
      ]),
    );
  }
}

class _StepCard extends StatelessWidget {
  final int step;
  final String title, body;
  final String? callLabel;
  final VoidCallback? onCall;
  const _StepCard({required this.step, required this.title, required this.body, required this.callLabel, required this.onCall});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 36, height: 36,
          decoration: const BoxDecoration(color: navy, shape: BoxShape.circle),
          child: Center(child: Text('$step', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 8),
          Text(body, style: const TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          if (onCall != null) ...[
            const SizedBox(height: 10),
            _CallBtn(callLabel!, onCall!),
          ],
        ])),
      ]),
    );
  }
}
class TutoringScreen extends StatefulWidget {
  const TutoringScreen({super.key});
  @override
  State<TutoringScreen> createState() => _TutoringState();
}

class _TutoringState extends State<TutoringScreen> {
  int? _open;

  static const _sections = [
    ['Request Tutoring', Icons.assignment_turned_in, 'request'],
    ['Face-to-Face Sessions', Icons.people, 'f2f'],
    ['Online Sessions', Icons.computer, 'online'],
    ['Before You Request a Tutor', Icons.checklist, 'before'],
    ['Online Tutoring - Upswing', Icons.laptop, 'upswing'],
    ['Tutoring Resources', Icons.menu_book, 'resources'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Tutoring Services', 'Free tutoring for all RCC students!'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Free Banner
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: green, borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Icon(Icons.star, color: Colors.white, size: 24),
                SizedBox(width: 8),
                Text('Tutoring is FREE for All RCC Students!',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
              SizedBox(height: 8),
              Text('Need help in a class? You can request face-to-face tutoring or online tutoring. Get started today!',
                style: TextStyle(color: Colors.white, fontSize: 13, height: 1.5)),
            ]),
          ),

          // Quick Contact
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: navyPale, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.contact_phone, color: navy, size: 22),
                SizedBox(width: 8),
                Text('Quick Contact - SOAR Center', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 12),
              _CallBtn('Call SOAR Center - (910) 272-3663', () => _callPhone('9102723663')),
              const SizedBox(height: 8),
              _CallBtn('Email Justin Nielsen - jnielsen@robeson.edu', () => _openUrl('mailto:jnielsen@robeson.edu')),
              const SizedBox(height: 8),
              _CallBtn('Tutor Request Form - Click Here', () => _openUrl('https://forms.office.com/pages/responsepage.aspx?id=OssFMiAtfEyG6-4SlBaBsOjErjtw1YpNgXqm0-JDbddURVYyNUlYQ1RIVDJTSk9LNE1ISkIwVk1BSi4u&route=shorturl')),
            ]),
          ),

          // Accordion Sections
          ...List.generate(_sections.length, (i) {
            final section = _sections[i];
            final open = _open == i;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12),
                border: Border.all(color: open ? green : borderColor, width: open ? 2 : 1.5),
                boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
              ),
              child: Column(children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => _open = open ? null : i),
                  child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
                    Icon(section[1] as IconData, color: open ? green : navy, size: 22),
                    const SizedBox(width: 12),
                    Expanded(child: Text(section[0] as String,
                      style: TextStyle(color: open ? green : navy, fontWeight: FontWeight.w700, fontSize: 14))),
                    AnimatedRotation(turns: open ? 0.5 : 0, duration: const Duration(milliseconds: 250),
                      child: Icon(Icons.keyboard_arrow_down_rounded, color: open ? green : textGray)),
                  ])),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(
                      color: greenPale.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Divider(color: green.withOpacity(0.2), height: 1),
                      const SizedBox(height: 12),
                      _buildSectionBody(section[2] as String),
                    ]),
                  ),
                  crossFadeState: open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ]),
            );
          }),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }

  Widget _buildSectionBody(String key) {
    switch (key) {
      case 'request':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Tutoring is FREE for all RCC students! Start here to get matched with a tutor.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
          const SizedBox(height: 12),
          _CallBtn('Tutor Request Form - Click Here', () => _openUrl('https://forms.office.com/pages/responsepage.aspx?id=OssFMiAtfEyG6-4SlBaBsOjErjtw1YpNgXqm0-JDbddURVYyNUlYQ1RIVDJTSk9LNE1ISkIwVk1BSi4u&route=shorturl')),
          const SizedBox(height: 8),
          _CallBtn('Call SOAR Center - (910) 272-3663', () => _callPhone('9102723663')),
          const SizedBox(height: 8),
          _CallBtn('Email Justin Nielsen - jnielsen@robeson.edu', () => _openUrl('mailto:jnielsen@robeson.edu')),
          const SizedBox(height: 12),
          const Text('Face-to-face tutoring takes place in the Library (SOAR Center) with RCC tutors.\n\nOnline tutoring is provided through Upswing - live tutoring, assignment review, and study support.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
        ]);

      case 'f2f':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Face-to-face tutoring takes place in the Library (SOAR Center) with RCC tutors.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
          const SizedBox(height: 12),
          _InfoItem(icon: Icons.looks_one, text: 'Complete the Tutor Request Form, call (910) 272-3663, or email jnielsen@robeson.edu'),
          _InfoItem(icon: Icons.looks_two, text: 'Indicate your preference for face-to-face tutoring'),
          _InfoItem(icon: Icons.looks_3, text: 'You will be contacted to set up your session time'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: navy.withOpacity(0.08), borderRadius: BorderRadius.circular(8)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Important Reminders:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              SizedBox(height: 6),
              Text('- Be on time and come prepared with notes, assignment instructions, and what you are struggling with\n- If you cannot make your session contact your tutor as soon as possible\n- During your session take notes and ask for any sample problems or diagrams used',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
            ]),
          ),
        ]);

      case 'online':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Online tutoring may occur in one of two ways:',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: navy.withOpacity(0.08), borderRadius: BorderRadius.circular(8)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Option 1 - Upswing (Fully Online)', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('Upswing provides live online tutoring and academic support.\n\n- Log in to Upswing 5-10 minutes before your session\n- Make sure your camera and microphone are working\n- Join the session and work with the tutor\n- Download any notes or files before ending the session\n- Complete the session evaluation',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Log in to Upswing', () => _openUrl('https://rcc.upswing.io')),
            ]),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: navy.withOpacity(0.08), borderRadius: BorderRadius.circular(8)),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Option 2 - Online with RCC Tutor (By Arrangement)', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              SizedBox(height: 6),
              Text('In some cases an RCC tutor may offer online sessions.\n\n- These sessions are arranged directly with the tutor\n- Online sessions are not the first mode of tutoring for in-person tutors\n- Availability is based on course needs, tutor schedule, and student circumstances',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
            ]),
          ),
        ]);

      case 'before':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Before you submit the Tutor Request Form please have the following ready:',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
          const SizedBox(height: 12),
          _InfoItem(icon: Icons.class_, text: 'Your course and section number (example: CIS 110-01)'),
          _InfoItem(icon: Icons.schedule, text: 'Your weekly availability based on your class, work, and life schedule'),
          _InfoItem(icon: Icons.tips_and_updates, text: 'Tip: plan for about 2 hours per week per course when possible'),
          _InfoItem(icon: Icons.block, text: 'Remember: tutoring cannot be scheduled during your face-to-face class time'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: navy.withOpacity(0.08), borderRadius: BorderRadius.circular(8)),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Attendance Expectations:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              SizedBox(height: 6),
              Text('If you miss sessions without communication, tutoring may be discontinued after repeated absences.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
            ]),
          ),
        ]);

      case 'upswing':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('FREE online tutoring and academic assistance is available for all RCC students through Upswing.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
          const SizedBox(height: 12),
          const Text('With Upswing you can:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 6),
          _InfoItem(icon: Icons.people, text: 'Connect with live online tutors'),
          _InfoItem(icon: Icons.edit_document, text: 'Submit essays for review'),
          _InfoItem(icon: Icons.library_books, text: 'Access writing and academic support tools'),
          const SizedBox(height: 12),
          const Text('How to Log In:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 6),
          const Text('Log in to Upswing using your RCC login credentials.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
          const SizedBox(height: 8),
          _CallBtn('Log in to Upswing - Click Here', () => _openUrl('https://rcc.upswing.io')),
        ]);

      case 'resources':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Academic Skills', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          _CallBtn('Study and Time Management', () => _openUrl('https://www.studygs.net/')),
          const Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
            child: Text('Tip: When the page opens, type "study tips" or "time management" in the search bar to find helpful guides.',
              style: TextStyle(color: textGray, fontSize: 12, fontStyle: FontStyle.italic, height: 1.5)),
          ),
          const SizedBox(height: 8),
          _CallBtn('Note-Taking Strategies', () => _openUrl('https://www.goodnotes.com/blog/note-taking-methods')),
          const SizedBox(height: 8),
          _CallBtn('Test Preparation - Harvard Tips', () => _openUrl('https://summer.harvard.edu/blog/14-tips-for-test-taking-success/')),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (ctx) => Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.all(12),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: InteractiveViewer(
                        child: Image.asset('assets/test_anxiety.png', fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      top: 8, right: 8,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(ctx),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: navy, shape: BoxShape.circle),
                          child: const Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: green.withOpacity(0.1), borderRadius: BorderRadius.circular(8),
                border: Border.all(color: green.withOpacity(0.3))),
              child: const Text('Test Taking Anxiety Tips - Tap to View',
                style: TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Writing and Math Support', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          _CallBtn('Writing, Grammar and Citations - Purdue OWL', () => _openUrl('https://owl.purdue.edu/owl/general_writing/grammar/index.html')),
          const SizedBox(height: 8),
          _CallBtn('Math Practice and Review - Khan Academy', () => _openUrl('https://www.khanacademy.org/math')),
          const SizedBox(height: 16),
          const Text('Online Learning Tools', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          _CallBtn('Khan Academy - Free Courses and Lessons', () => _openUrl('https://www.khanacademy.org')),
          const SizedBox(height: 8),
          _CallBtn('Practice Quizzes and Flashcards - Quizlet', () => _openUrl('https://quizlet.com/subject/college/')),
        ]);

      default:
        return const SizedBox.shrink();
    }
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoItem({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: green, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.5))),
      ]),
    );
  }
}
class CareerScreen extends StatefulWidget {
  const CareerScreen({super.key});
  @override
  State<CareerScreen> createState() => _CareerState();
}

class _CareerState extends State<CareerScreen> {
  int? _open;

  static const _sections = [
    ['College Central Network', Icons.work_outline],
    ['Career Assessments', Icons.psychology],
    ['Career Exploration', Icons.explore],
    ['Employment Opportunities', Icons.business_center],
    ['Resumes, Cover Letters, Interview Skills', Icons.description],
    ['Contact Career Services', Icons.contact_phone],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Career Services', 'Need a job? Want a better job? We can help!'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Mission Banner
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navy, borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Icon(Icons.star, color: green, size: 24),
                SizedBox(width: 8),
                Expanded(child: Text('RCC Career Services',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              ]),
              SizedBox(height: 10),
              Text('Our mission is to assist current students and alumni in setting career goals, explore career opportunities, and access employment.',
                style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
            ]),
          ),

          // Services Provided
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: navyPale, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.checklist, color: navy, size: 22),
                SizedBox(width: 8),
                Text('Services Provided', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 12),
              _InfoItem(icon: Icons.psychology, text: 'Career Planning (interests and skills inventories)'),
              _InfoItem(icon: Icons.description, text: 'Resume and Cover Letter Assistance'),
              _InfoItem(icon: Icons.record_voice_over, text: 'Interview Preparation'),
              _InfoItem(icon: Icons.people, text: 'Community Resource Networking'),
              _InfoItem(icon: Icons.handshake, text: 'Internship and Apprenticeship Connections'),
              _InfoItem(icon: Icons.work, text: 'Employability Workshops'),
              _InfoItem(icon: Icons.search, text: 'Job Search and Online Job Portal - College Central Network'),
            ]),
          ),

          // College Central Network Banner
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: greenPale, borderRadius: BorderRadius.circular(14),
              border: const Border(left: BorderSide(color: green, width: 4)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('About College Central Network',
                style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Robeson Community College uses College Central Network as the official job resource and resume system. This site is available 24/7 to students, alumni, employers, and community residents.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 12),
              _CallBtn('Visit College Central Network', () => _openUrl('https://www.collegecentral.com/robeson')),
            ]),
          ),

          // Accordion Sections
          ...List.generate(_sections.length, (i) {
            final section = _sections[i];
            final open = _open == i;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12),
                border: Border.all(color: open ? green : borderColor, width: open ? 2 : 1.5),
                boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
              ),
              child: Column(children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => _open = open ? null : i),
                  child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
                    Icon(section[1] as IconData, color: open ? green : navy, size: 22),
                    const SizedBox(width: 12),
                    Expanded(child: Text(section[0] as String,
                      style: TextStyle(color: open ? green : navy, fontWeight: FontWeight.w700, fontSize: 14))),
                    AnimatedRotation(turns: open ? 0.5 : 0, duration: const Duration(milliseconds: 250),
                      child: Icon(Icons.keyboard_arrow_down_rounded, color: open ? green : textGray)),
                  ])),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(
                      color: greenPale.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Divider(color: green.withOpacity(0.2), height: 1),
                      const SizedBox(height: 12),
                      _buildCareerBody(i),
                    ]),
                  ),
                  crossFadeState: open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ]),
            );
          }),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }

  Widget _buildCareerBody(int index) {
    switch (index) {
      case 0: // College Central Network
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('College Central Network (CCN) is a modern platform that provides cutting-edge technology to best connect employers with qualified candidates, quickly, and intuitively.\n\nThe Network app alone features opportunities for part-time jobs, internships, and full-time employment, making the job search experience easier for students.\n\nYour future starts here!',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          const SizedBox(height: 12),
          _CallBtn('Visit College Central Network', () => _openUrl('https://www.collegecentral.com/robeson')),
        ]);

      case 1: // Career Assessments
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Are you unsure of your career path? Are you interested in multiple career fields? We can help!\n\nThis is your first step in planning for your career — understanding yourself. The more you know about your personality type, career-related interests, skills, and values, the better equipped you are in identifying your career and educational pathway.\n\nYour career decisions will impact your lifestyle — income, work and leisure hours, travel, job security, colleagues and friends, and where you live. Therefore, when exploring your career interests, take these factors into consideration.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          const SizedBox(height: 16),

          // Personality Type Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.psychology, color: green, size: 20),
              SizedBox(width: 8),
              Text('Personality Type', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),

          // Myers & Briggs
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Myers & Briggs 16 Personality Types', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('Take this personality assessment to explore the 16 personality types and learn more about yourself. When you discover your own personality type, you will understand more clearly why you do the things you do. This will help to gain confidence in your strengths and better equip you in making career-related decisions.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Take Myers & Briggs Assessment', () => _openUrl('https://www.truity.com/test/type-finder-personality-test-new')),
            ]),
          ),

          // Keirsey
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Keirsey Temperament Sorter', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('Classifies temperament types and their connection to careers of interest.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Take Keirsey Temperament Sorter', () => _openUrl('https://www.keirsey.com')),
            ]),
          ),

          // Career Interests Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.explore, color: green, size: 20),
              SizedBox(width: 8),
              Text('Career Interests', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),

          // O*NET
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('O*NET Interest Profiler', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('Explore your career interests and find what type of career pathway fits you best. This Interest Finder measures interests in each of the six Holland RIASEC types.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Take O*NET Interest Profiler', () => _openUrl('https://www.mynextmove.org/explore/ip')),
            ]),
          ),

          // NC Careers
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('NC Careers', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('This skills matcher helps to match your skills with careers.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Explore NC Careers', () => _openUrl('https://nccareers.org/')),
            ]),
          ),

          // College Foundation of NC
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('College Foundation of NC (CFNC)', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 6),
              const Text('Explores interests, transferrable skills, abilities, and work values to identify career options.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Visit CFNC', () => _openUrl('https://www.cfnc.org/plan-your-future/career-center/')),
            ]),
          ),

          _CallBtn('Contact Career Services - (910) 272-3353', () => _callPhone('9102723353')),
        ]);

      case 2: // Career Exploration
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Career Exploration is key to finding a career that best fits your interests, skills, and values. Explore the various career resources included below to plan and prepare for your future.\n\nIf you are unsure of your career path, take a look at the Assessments tab and complete a career survey to get you started.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          const SizedBox(height: 16),

          // Career Planning Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.map, color: green, size: 20),
              SizedBox(width: 8),
              Text('Career Planning - NC Careers', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Career planning helps you to:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 8),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Identify what you are good at'),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Identify how your skills, talents, values, and interests translate into possible jobs or careers'),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Match your skills to existing jobs or careers'),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Match your career goals to your financial needs'),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Match your career goals to your educational needs'),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Help you make good decisions for yourself'),
              _InfoItem(icon: Icons.check_circle_outline, text: 'Assist in finding ways to meet your educational and financial needs on your schedule'),
              const SizedBox(height: 10),
              const Text('Visit NC Careers for various career planning resources.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Visit NC Careers', () => _openUrl('https://nccareers.org/')),
            ]),
          ),

          // CFNC Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.school, color: green, size: 20),
              SizedBox(width: 8),
              Text('College Foundation of NC (CFNC)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('CFNC offers tools for college transition, exploration of programs and majors, career videos, and transfer planning.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Visit CFNC', () => _openUrl('https://www.cfnc.org/plan-your-future/plan-for-a-career/')),
            ]),
          ),

          // RCC Library Guide Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.library_books, color: green, size: 20),
              SizedBox(width: 8),
              Text('RCC Library Guide', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Explore career fields, professions, and industries, and get advice to help perfect the skills you need to be successful.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: green.withOpacity(0.1), borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: green.withOpacity(0.3))),
                child: const Row(children: [
                  Icon(Icons.lock_outline, color: green, size: 16),
                  SizedBox(width: 6),
                  Expanded(child: Text('You must be logged into your RCC user account to access this resource.',
                    style: TextStyle(color: Color(0xFF2D5016), fontSize: 12, fontStyle: FontStyle.italic, height: 1.4))),
                ]),
              ),
              const SizedBox(height: 8),
              _CallBtn('Visit RCC Library Guide - KeyTrain', () => _openUrl('https://libguides.robeson.edu/c.php?g=1012428')),
            ]),
          ),

          _CallBtn('Email Career Services - careers4u@robeson.edu', () => _openUrl('mailto:careers4u@robeson.edu')),
        ]);

      case 3: // Employment Opportunities
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Browse the employment resources below to find opportunities that best fit your needs. If you need additional assistance contact Career Services.',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          const SizedBox(height: 16),

          // College Central Network
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.work, color: green, size: 20),
              SizedBox(width: 8),
              Text('College Central Network', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Download the app and register to become part of RCC\'s College Central Network. This app features local and state-wide job opportunities. You can also upload your resume, career portfolio, view career podcasts, and get tips on succeeding in a job interview.\n\nYour account remains active after you graduate.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Visit College Central Network', () => _openUrl('https://www.collegecentral.com/robeson/')),
            ]),
          ),

          // Veterans
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.military_tech, color: green, size: 20),
              SizedBox(width: 8),
              Text('Veterans', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Job resources specifically for veterans and military personnel:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 10),
              _CallBtn('U.S. Military Pipeline Interest', () => _openUrl('https://docs.google.com/forms/d/e/1FAIpQLSdrztjM6-kEVkIXXdRJKpHD699DJgskkD0S5L6eWGrR7F52zw/viewform')),
              const SizedBox(height: 8),
              _CallBtn('NC Works Online', () => _openUrl('https://www.ncworks.gov')),
              const SizedBox(height: 8),
              _CallBtn('USA Jobs - Federal Government Employment', () => _openUrl('https://www.usajobs.gov')),
              const SizedBox(height: 8),
              _CallBtn('Military.com - Veteran Jobs and Benefits', () => _openUrl('https://www.military.com/veteran-jobs')),
              const SizedBox(height: 8),
              _CallBtn('NC State Government Jobs', () => _openUrl('https://oshr.nc.gov/careers')),
            ]),
          ),

          // Workers with Disabilities
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.accessibility_new, color: green, size: 20),
              SizedBox(width: 8),
              Text('Workers with Disabilities', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('NC Vocational Rehabilitation provides employment resources and support services for people with disabilities.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('NC DHHS - Employment and Independence for People with Disabilities', () => _openUrl('https://www.ncdhhs.gov/divisions/dvrs')),
            ]),
          ),

          const SizedBox(height: 4),
          _CallBtn('Call Career Services - (910) 272-3353', () => _callPhone('9102723353')),
        ]);

      case 4: // Resumes, Cover Letters, Interview Skills
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Need assistance with building your resume, writing a cover letter, or excelling in interviews? You are in the right place! Visit the resources below to assist in these areas:',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          const SizedBox(height: 16),

          // Resume Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.description, color: green, size: 20),
              SizedBox(width: 8),
              Text('Resume', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Use these free tools to build or improve your resume:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Resume Now - Free AI Resume Builder', () => _openUrl('https://www.resume-now.com')),
              const SizedBox(height: 8),
              _CallBtn('LiveCareer - Resume Templates', () => _openUrl('https://www.livecareer.com/resume-builder')),
              const SizedBox(height: 8),
              _CallBtn('Resume Genius - How to Make a Resume', () => _openUrl('https://resumegenius.com/blog/resume-help/how-to-write-a-resume')),
            ]),
          ),

          // Cover Letter Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.mail_outline, color: green, size: 20),
              SizedBox(width: 8),
              Text('Cover Letters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Build a professional cover letter with these free tools:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Resume Now - Cover Letter Builder', () => _openUrl('https://www.resume-now.com/cover-letter/builder')),
              const SizedBox(height: 8),
              _CallBtn('Cover Letter Builder - Build Online', () => _openUrl('https://www.livecareer.com/cover-letter-builder')),
              const SizedBox(height: 8),
              _CallBtn('LiveCareer - AI Cover Letter Generator', () => _openUrl('https://www.livecareer.com/cover-letter-builder')),
              const SizedBox(height: 8),
              _CallBtn('Resume Genius - Cover Letter Generator', () => _openUrl('https://resumegenius.com/cover-letter-builder')),
            ]),
          ),

          // Interview Skills Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Icon(Icons.record_voice_over, color: green, size: 20),
              SizedBox(width: 8),
              Text('Interview Skills', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Prepare for your interview with these helpful resources:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 8),
              _CallBtn('Best Interview Questions - Resume Genius', () => _openUrl('https://resumegenius.com/blog/interview/interview-questions-and-answers')),
              const SizedBox(height: 8),
              _CallBtn('Job Interview Questions and Answers - Indeed', () => _openUrl('https://www.indeed.com/career-advice/interviewing/top-interview-questions-and-answers')),
              const SizedBox(height: 8),
              _CallBtn('Interview Tips - Resume Genius', () => _openUrl('https://resumegenius.com/blog/interview')),
            ]),
          ),

          const SizedBox(height: 4),
          _CallBtn('Schedule Appointment - (910) 272-3353', () => _callPhone('9102723353')),
          const SizedBox(height: 8),
          _CallBtn('Email careers4u@robeson.edu', () => _openUrl('mailto:careers4u@robeson.edu')),
        ]);

      case 5: // Contact
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Have questions or need help? Contact Counseling and Career Services today!',
            style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.65)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.location_on, color: navy, size: 20),
                SizedBox(width: 8),
                Text('Counseling and Career Services', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
              ]),
              const SizedBox(height: 10),
              const Text('Building 13, Room 1315', style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const Text('Robeson Community College', style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const Text('5160 Fayetteville Rd, Lumberton, NC 28360', style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const Text('Mon - Fri  |  8:00 AM - 5:00 PM', style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
            ]),
          ),
          const SizedBox(height: 12),
          _CallBtn('Call - (910) 272-3353', () => _callPhone('9102723353')),
          const SizedBox(height: 8),
          _CallBtn('Email - cquintero@robeson.edu', () => _openUrl('mailto:cquintero@robeson.edu')),
          const SizedBox(height: 8),
          _CallBtn('Email - careers4u@robeson.edu', () => _openUrl('mailto:careers4u@robeson.edu')),
          const SizedBox(height: 8),
          _CallBtn('Visit College Central Network', () => _openUrl('https://www.collegecentral.com/robeson')),
        ]);

      default:
        return const SizedBox.shrink();
    }
  }
}
class CounselingScreen extends StatelessWidget {
  const CounselingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Counseling Services', 'Academic advising, personal support & crisis resources.'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Intro
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'At RCC\'s Counseling Services, we are dedicated to providing comprehensive support to help college students thrive academically, emotionally, and personally. Our team of experienced and compassionate counselors is here to assist you in navigating the challenges and opportunities that come with college life.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.7)),
            ]),
          ),

          // Our Services
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Our Services', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('We offer a range of counseling services tailored specifically to meet the unique needs of college students. Our services include:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 14),

              _ServiceRow(number: '1', title: 'Individual Counseling',
                body: 'One-on-one sessions with a counselor who will provide a safe and confidential space to address your personal concerns, such as stress, anxiety, depression, relationship issues, grief, thoughts of suicide, addictions, and more.'),
              const SizedBox(height: 12),
              _ServiceRow(number: '2', title: 'Group Counseling',
                body: 'Join supportive and interactive counseling groups led by our skilled counselors. Engage in discussions and activities with peers who may be facing similar challenges, fostering connection and personal growth.'),
              const SizedBox(height: 12),
              _ServiceRow(number: '3', title: 'Workshops and Events',
                body: 'Participate in informative workshops and events covering topics like stress management, study skills, time management, mindfulness, and self-care. These interactive sessions are designed to equip you with practical tools and strategies to enhance your well-being and academic success.'),
              const SizedBox(height: 12),
              _ServiceRow(number: '4', title: 'Referrals',
                body: 'If you require specialized services beyond our scope, we can provide you with appropriate referrals to external professionals and resources in the community.'),
            ]),
          ),

          // Getting Started
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navyPale, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Getting Started', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Taking the first step toward seeking support is commendable, and we are here to assist you. To schedule an appointment or learn more about our services, please contact our counseling center through the following methods:',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 14),

              _ContactRow(icon: Icons.phone, text: 'Phone: (910) 272-3353', onTap: () => _callPhone('9102723353')),
              const SizedBox(height: 10),
              const _ContactRow(icon: Icons.location_on,
                text: 'Location: Building 13\nM–Th: 8:00–5:00  ·  F: 8:00–3:00\nSummer Hours: M–Th: 7:30–5:30'),
              const SizedBox(height: 10),
              const _ContactRow(icon: Icons.door_front_door, text: 'Walk-Ins Welcome'),
              const SizedBox(height: 14),

              const Text('Set Up an Appointment:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _openUrl('https://forms.office.com/Pages/ResponsePage.aspx?id=OssFMiAtfEyG6-4SlBaBsOjErjtw1YpNgXqm0-JDbddURVYyNUlYQ1RIVDJTSk9LNE1ISkIwVk1BSi4u&route=shorturl'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(10)),
                  child: const Row(children: [
                    Icon(Icons.assignment_turned_in, color: green, size: 22),
                    SizedBox(width: 10),
                    Expanded(child: Text('"RCC Cares" Appointment Request Form',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                    Icon(Icons.open_in_new, color: Colors.white54, size: 16),
                  ]),
                ),
              ),
            ]),
          ),

          // Meet Your Counselors
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.people, color: navy, size: 22),
                SizedBox(width: 8),
                Text('Meet Your Counselors', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 14),
              _CounselorTile(
                name: 'Susan Moore',
                title: 'Counselor / Accessibilities Coordinator',
                location: 'Building 13, Room 1315',
                phone: '9102723345',
                email: 'smoore@robeson.edu',
              ),
              const Divider(height: 24),
              _CounselorTile(
                name: 'Cynthia Quintero',
                title: 'Counselor / Special Populations',
                location: 'Building 13, Room 1315',
                phone: '9102723344',
                email: 'cquintero@robeson.edu',
              ),
              const Divider(height: 24),
              _CounselorTile(
                name: 'Samantha Oxendine',
                title: 'Director of Advising, Counseling & Career Services',
                location: 'Building 13, Room 1315',
                phone: '9102723354',
                email: 'soxendine@robeson.edu',
              ),
            ]),
          ),

        ])),
      ]),
    );
  }
}

class _CounselorTile extends StatelessWidget {
  final String name, title, location, phone, email;
  const _CounselorTile({
    required this.name, required this.title,
    required this.location, required this.phone, required this.email,
  });
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(name, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 15)),
      const SizedBox(height: 2),
      Text(title, style: const TextStyle(color: textGray, fontSize: 13, fontStyle: FontStyle.italic, height: 1.4)),
      const SizedBox(height: 2),
      Text(location, style: const TextStyle(color: textGray, fontSize: 13)),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () => _callPhone(phone),
        child: Row(children: [
          const Icon(Icons.phone, color: green, size: 14),
          const SizedBox(width: 5),
          Text('(${phone.substring(0,3)}) ${phone.substring(3,6)}-${phone.substring(6)}',
            style: const TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w600)),
        ]),
      ),
      const SizedBox(height: 4),
      GestureDetector(
        onTap: () => _openUrl('mailto:$email'),
        child: Row(children: [
          const Icon(Icons.email, color: green, size: 14),
          const SizedBox(width: 5),
          Text(email, style: const TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w600)),
        ]),
      ),
    ]);
  }
}

class _AdvisorTile extends StatelessWidget {
  final String name, credentials, title, location, phone, email, caseload;
  const _AdvisorTile({
    required this.name, required this.credentials, required this.title,
    required this.location, required this.phone, required this.email,
    required this.caseload,
  });
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(name, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
      const SizedBox(height: 2),
      Text(credentials, style: const TextStyle(color: textGray, fontSize: 12, fontStyle: FontStyle.italic)),
      const SizedBox(height: 2),
      Text(title, style: const TextStyle(color: textGray, fontSize: 12)),
      const SizedBox(height: 2),
      Text(location, style: const TextStyle(color: textGray, fontSize: 12)),
      const SizedBox(height: 6),
      GestureDetector(
        onTap: () => _callPhone(phone),
        child: Row(children: [
          const Icon(Icons.phone, color: green, size: 14),
          const SizedBox(width: 5),
          Text('(${phone.substring(0,3)}) ${phone.substring(3,6)}-${phone.substring(6)}',
            style: const TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w600)),
        ]),
      ),
      const SizedBox(height: 3),
      GestureDetector(
        onTap: () => _openUrl('mailto:$email'),
        child: Row(children: [
          const Icon(Icons.email, color: green, size: 14),
          const SizedBox(width: 5),
          Text(email, style: const TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w600)),
        ]),
      ),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: navyPale, borderRadius: BorderRadius.circular(8),
          border: const Border(left: BorderSide(color: navy, width: 3)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Caseload:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 4),
          Text(caseload, style: const TextStyle(color: Color(0xFF4A5568), fontSize: 12, height: 1.6)),
        ]),
      ),
    ]);
  }
}

class _ServiceRow extends StatelessWidget {
  final String number, title, body;
  const _ServiceRow({required this.number, required this.title, required this.body});
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 28, height: 28,
        decoration: const BoxDecoration(color: navy, shape: BoxShape.circle),
        child: Center(child: Text(number,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
      ),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 3),
        Text(body, style: const TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
      ])),
    ]);
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const _ContactRow({required this.icon, required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: navy, size: 18),
        const SizedBox(width: 10),
        Expanded(child: Text(text,
          style: TextStyle(
            color: onTap != null ? green : const Color(0xFF4A5568),
            fontSize: 13, height: 1.55,
            fontWeight: onTap != null ? FontWeight.w600 : FontWeight.normal,
          ))),
      ]),
    );
  }
}

class SoarScreen extends StatelessWidget {
  const SoarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('SOAR Center', 'Student Orientation, Advising, and Retention'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Mission
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navy, borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Icon(Icons.star, color: green, size: 24),
                SizedBox(width: 8),
                Expanded(child: Text('Mission of the SOAR Center',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              ]),
              SizedBox(height: 10),
              Text(
                'The purpose of The Student Orientation, Advising, and Retention (SOAR) Center at Robeson Community College is to provide students with additional assistance and resources to enhance their academic success, as well as to promote self-directed learning and decision-making; build confidence and motivation; and develop a greater appreciation for education and learning.',
                style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
            ]),
          ),

          // Hours & Location
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: navyPale, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.schedule, color: navy, size: 22),
                SizedBox(width: 8),
                Text('Hours & Location', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 12),
              const _ContactRow(icon: Icons.location_on, text: 'Location: Library – Room 422'),
              const SizedBox(height: 8),
              const _ContactRow(icon: Icons.schedule, text: 'Mon – Thu:  8:00 AM – 5:00 PM\nFri:  8:00 AM – 3:00 PM'),
              const SizedBox(height: 8),
              const _ContactRow(icon: Icons.wb_sunny, text: 'Summer Hours:\nMon – Thu:  7:30 AM – 5:30 PM\nFri:  Closed'),
              const SizedBox(height: 12),
              _CallBtn('Call SOAR Center — (910) 272-3663', () => _callPhone('9102723663')),
            ]),
          ),

          // Meet Your Academic Advisor
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.school, color: navy, size: 22),
                SizedBox(width: 8),
                Expanded(child: Text('Meet Your Academic Advisor', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold))),
              ]),
              const SizedBox(height: 6),
              const Text('Our Academic Advisors are here to support you with course planning, registration, and degree progress.',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.6)),
              const SizedBox(height: 16),

              // Academic Advisors header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
                child: const Row(children: [
                  Icon(Icons.people, color: green, size: 18),
                  SizedBox(width: 8),
                  Text('Academic Advisors', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                ]),
              ),
              const SizedBox(height: 12),

              _AdvisorTile(name: 'Dr. Dionne Pursley', credentials: 'Ph.D. Business Administration', title: 'Assistant Director, SOAR', location: 'Library, Main Floor Right', phone: '9102723348', email: 'dpursley@robeson.edu',
                caseload: 'Business Administration (A25120)\nAccounting (A25800)\nCriminal Justice (A55180, A55180BL, DL)\nCosmetology (A55140)'),
              const Divider(height: 20),
              _AdvisorTile(name: 'Casey Horton', credentials: 'B.S. in Business Administration', title: 'Academic Advisor', location: 'Library, Main Floor Right', phone: '9102723323', email: 'chorton@robeson.edu',
                caseload: 'Education / Early Childhood (A55220-CR,TL,TN; A1010T, A1040T)\nElectrical Systems Technology (A35130)\nAir Conditioning, Heating & Refrigeration (A35100)\nWelding Technology (A50420)'),
              const Divider(height: 20),
              _AdvisorTile(name: 'Cecelia Locklear', credentials: 'B.S. Molecular Biology', title: 'Academic Advisor', location: 'Library, Main Floor Right', phone: '9102723523', email: 'celocklear@robeson.edu',
                caseload: 'Associate of Arts (A10100)\nAssociate of Science (A10400)\nMedical Office Administration (A25310BC)\nMechatronics Engineering Technology (A40350)'),
              const Divider(height: 20),
              _AdvisorTile(name: 'Kaylee Ransom', credentials: 'B.A. Psychology, Minor in American Indian and Indigenous Studies', title: 'Academic Advisor', location: 'Library, Main Floor Right', phone: '9102723443', email: 'kransom@robeson.edu',
                caseload: 'Culinary (A55150)\nBaking & Pastry (A55130)\nInformation Technology (A25590-AI,CS,SG)'),

              const SizedBox(height: 20),

              // FAPSS header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
                child: const Row(children: [
                  Icon(Icons.science, color: green, size: 18),
                  SizedBox(width: 8),
                  Expanded(child: Text("First Americans' Pathway to STEM Success (FAPSS) Advisors", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                ]),
              ),
              const SizedBox(height: 12),

              _AdvisorTile(name: 'Amanda Cummings', credentials: 'MSW, LCSW, STEM Coach', title: 'FAPSS Advisement Coach', location: 'Library, Main Floor Right', phone: '9102723454', email: 'acummings@robeson.edu',
                caseload: 'Electrical Systems Technology (A35130)\nInformation Technology (A25590-AI,CS,SG)\nMechatronics Engineering Technology (A40350)\nAir Conditioning, Heating & Refrigeration (A35100)\nWelding Technology (A50420)\nCyber Security (A25590CS)'),
              const Divider(height: 20),
              _AdvisorTile(name: 'Lena Lowry', credentials: 'MA, NCC, LCMHC', title: 'FAPSS Advisement Coach', location: 'Library, Main Floor Right', phone: '9102723459', email: 'llowry@robeson.edu',
                caseload: 'Electrical Systems Technology (A35130)\nInformation Technology (A25590-AI,CS,SG)\nMechatronics Engineering Technology (A40350)\nAir Conditioning, Heating & Refrigeration (A35100)\nWelding Technology (A50420)\nCyber Security (A25590CS)'),

              const SizedBox(height: 20),

              // Health Science header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
                child: const Row(children: [
                  Icon(Icons.local_hospital, color: green, size: 18),
                  SizedBox(width: 8),
                  Expanded(child: Text('Health Science Enrollment Coordinator', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                ]),
              ),
              const SizedBox(height: 12),

              _AdvisorTile(name: 'Stephanie McNeill', credentials: 'Health Science Enrollment Coordinator', title: 'Pre-Health Programs', location: 'Building 17', phone: '9102723380', email: 'smcneill@robeson.edu',
                caseload: 'Pre-Health Nursing (A10300RN)\nPre-Health Practical Nursing (A10300PN)\nPre-Health Radiography (A10300RA)\nPre-Health Sonography (A10300SN)\nPre-Health Dental Assisting (A10300DA)\nPre-Health Respiratory (A10300RT)\nPre-Health Surgical (A10300ST)\nPre-Health Dental Hygiene (A10300DH)\nPre-Health Funeral Services (A10300FS)\nPre-Health Emergency Medical Science (A10300EM)'),
            ]),
          ),

          // Your First Stop
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(children: [
                Icon(Icons.flag, color: green, size: 22),
                SizedBox(width: 8),
                Text('Your First Stop: Admissions', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 12),
              _CallBtn('Call Admissions — (910) 272-3700', () => _callPhone('9102723700')),
              const SizedBox(height: 8),
              _CallBtn('Visit robeson.edu', () => _openUrl('https://www.robeson.edu')),
            ]),
          ),

          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const _buildings = [
    ['AC/Heating & Refrigeration Technology', 'Building 9'],
    ['A.D. Lewis Auditorium', 'Building 15'],
    ['Academic Success Center', 'Building 4, Library'],
    ['Administration', 'Building 2'],
    ['Admissions', 'Building 13'],
    ['Advanced Manufacturing Labs', 'Building 12'],
    ['Adult Basic Education', 'Building 12'],
    ['Adult Basic Education Transitions', 'Building 12'],
    ['Adult High School', 'Building 12'],
    ['Anne Moss Biggs Library', 'Building 4'],
    ['Basic Law Enforcement Training', 'Building 11'],
    ['Board Room', 'Building 15'],
    ['Bookstore', 'Building 9'],
    ['Business Programs', 'Building 14, 2nd Floor'],
    ['Business Office', 'Building 3'],
    ['Campbell Soup Conference Room', 'Building 18'],
    ['Campus Security', 'Building 5'],
    ['Campus Facilities', 'Building 5'],
    ['Charles V. Chrestman Workforce Development Center (WDC)', 'Building 18'],
    ['College and Career Readiness Administrative Offices', 'Building 14'],
    ['College and Career Readiness Labs', 'Building 12'],
    ['Computer Services / IT Helpdesk', 'Building 14, 1st Floor'],
    ['Conference Room', 'Building 14, 1st Floor; Building 17, 1st Floor'],
    ['Cosmetology', 'Building 3'],
    ['Counseling & Career Services', 'Building 13'],
    ['Criminal Justice', 'Building 11'],
    ['Culinary Arts Dining Room', 'Building 14, 1st Floor'],
    ['Culinary Arts Lab', 'Building 14, 1st Floor'],
    ['Accessibility Services', 'Building 13; Building 14, 1st Floor'],
    ['Distance Learning (Moodle)', 'Building 4, 2nd Floor'],
    ['Education Programs', 'Building 14, 2nd Floor'],
    ['Education Lab', 'Building 14, 2nd Floor'],
    ['Electrical Systems Technology Programs', 'Building 9'],
    ['Emergency Medical Science Faculty', 'Building 19'],
    ['Emergency Medical Science Labs', 'Building 17, 2nd Floor'],
    ['Emergency Medical Services Training', 'Building 19'],
    ['English as a Second Language', 'Building 12'],
    ['English Department (Curriculum)', 'Building 4'],
    ['Faculty Offices', 'Buildings 1, 3, 4, 5, 8, 9, 11, 12, 14, 17, 18, 19'],
    ['Financial Aid', 'Building 13'],
    ['Fred G. Williams Jr. Student Center', 'Building 13'],
    ['General Classrooms', 'Buildings 1, 7, 8, 9, 11, 12, 14, 17, 18'],
    ['Grants', 'Building 4'],
    ['Honors College', 'Building 4'],
    ['Human Resource Development (HRD)', 'Building 18'],
    ['I.J. Williams Administration Building', 'Building 2'],
    ['Industrial Technology Labs', 'Building 12'],
    ['Industrial Systems Technology Program', 'Building 12'],
    ['Institutional Effectiveness', 'Building 2'],
    ['Institutional Storage Facility', 'Building 10'],
    ['Instruction & Student Support Services', 'Building 2'],
    ['Literacy Education (College and Career Readiness)', 'Building 14, 1st Floor'],
    ['Lumbee Guaranty Bank Building', 'Building 1'],
    ['Lumbee Guaranty Bank Conference Room', 'Building 18'],
    ['Math Department', 'Building 5'],
    ['Media Services', 'Anne Moss Biggs Library, Building 4'],
    ['Medical Sonography', 'Building 17, 1st Floor'],
    ['Military Affiliated Resource Center', 'Building 13'],
    ['Nurse Aide', 'Building 17, 1st Floor'],
    ['Nursing', 'Building 17, 2nd Floor'],
    ['Pearson Vue Testing Center', 'Building 14, 2nd Floor'],
    ['Physical Plant Operations', 'Building 6'],
    ['Piedmont Natural Gas Building', 'Building 3'],
    ['Pottery', 'Building 14, 1st Floor'],
    ['RCC Foundation, Inc.', 'Building 13'],
    ['Radiography', 'Building 17, 1st Floor'],
    ['Registrar', 'Building 13'],
    ['Respiratory Therapy', 'Building 17, 1st Floor'],
    ['Sammy Cox Law Enforcement Center', 'Building 11'],
    ['Science Department', 'Building 5'],
    ['Science Labs', 'Buildings 1, 7'],
    ['Simulation and Cooperation Training (Health Sciences)', 'Building 17'],
    ['Small Business Center', 'Building 18'],
    ['Student Government', 'Building 13'],
    ['Surgical Technology', 'Building 17, 2nd Floor'],
    ['Tiered Lecture/Demo Room', 'Building 9'],
    ['Truist Conference Center', 'Building 18'],
    ['Tutorial Services', 'Building 4, Library'],
    ['Welding Technology Program', 'Building 1'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const _Header('Campus Map', '5160 Fayetteville Rd, Lumberton, NC 28360'),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Campus Map Image
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                'assets/campus_map.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Directions Buttons
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: navy, borderRadius: BorderRadius.circular(14),
            ),
            child: Column(children: [
              const Text('5160 Fayetteville Rd, Lumberton, NC 28360',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
              const Text('RCC I-95 Exit #22',
                style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: GestureDetector(
                  onTap: () => _openUrl('https://maps.google.com/?q=Robeson+Community+College+5160+Fayetteville+Rd+Lumberton+NC'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(8)),
                    child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.directions, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text('Get Directions', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                    ]),
                  ),
                )),
                const SizedBox(width: 10),
                Expanded(child: GestureDetector(
                  onTap: () => _callPhone('9102723700'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38, width: 1.5),
                      borderRadius: BorderRadius.circular(8)),
                    child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.phone, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text('Call Campus', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                    ]),
                  ),
                )),
              ]),
            ]),
          ),

          // Parking Legend
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: greenPale, borderRadius: BorderRadius.circular(12),
              border: const Border(left: BorderSide(color: green, width: 4)),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Parking Information', style: TextStyle(color: navy, fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('• Handicapped parking spaces available in all lots\n• Visitor parking in front of Buildings 1 & 2, between Buildings 3 & 14, and in front of Building 17\n• Callboxes located throughout campus\n• Campus Police located in Building 6',
                style: TextStyle(color: Color(0xFF4A5568), fontSize: 13, height: 1.7)),
            ]),
          ),

          // Building Directory Header
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(10)),
            child: const Row(children: [
              Icon(Icons.domain, color: green, size: 20),
              SizedBox(width: 10),
              Text('Building Directory', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
            ]),
          ),

          // Building List
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(14),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
            ),
            child: Column(
              children: List.generate(_buildings.length, (i) {
                final b = _buildings[i];
                final isLast = i == _buildings.length - 1;
                return Container(
                  decoration: BoxDecoration(
                    border: isLast ? null : Border(bottom: BorderSide(color: borderColor, width: 1)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Icon(Icons.location_on, color: green, size: 18),
                    const SizedBox(width: 10),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(b[0], style: const TextStyle(color: navy, fontWeight: FontWeight.w600, fontSize: 13)),
                      const SizedBox(height: 2),
                      Text(b[1], style: const TextStyle(color: textGray, fontSize: 12)),
                    ])),
                  ]),
                );
              }),
            ),
          ),

        ])),
      ]),
    );
  }
}

// SHARED WIDGETS
class _Header extends StatelessWidget {
  final String title, subtitle;
  const _Header(this.title, this.subtitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 16, 20, 20),
      color: navy,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 12),
        Container(width: 48, height: 4,
          decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(2))),
      ]),
    );
  }
}

class _CallBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _CallBtn(this.label, this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: green.withOpacity(0.1), borderRadius: BorderRadius.circular(8),
          border: Border.all(color: green.withOpacity(0.3))),
        child: Text(label, style: const TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 13)),
      ),
    );
  }
}

Future<void> _callPhone(String number) async {
  final uri = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(uri)) await launchUrl(uri);
}

Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
}
