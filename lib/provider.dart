import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProviderScreen with ChangeNotifier{
  List<String> bloodGroupList=["A+","A-","B+","B-","AB+","AB-","O+","O-"];
  List<String> _cityNameList=["Abbottabad", "Adezai", "Ahmed Nager", "Ahmadpur East", "Ali Khan", "Alipur", "Arifwala", "Attock", "Awaran", "Ayubia", "Badin", "Bahawalnagar", "Bahawalpur", "Banda Daud", "Bannu", "Barkhan", "Batkhela", "Battagram", "Bhera", "Bhirkan", "irote", "Burewala", "Chagai", "Chak", "Chakdara", "Chakwal", "Chaman", "Charsadda", "Chillianwala", "Chiniot", "Chishtian", "Chitral", "Dadu", "Daggar", "Dargai", "Darya Khan", "Daska", "Dera Bugti", "Dera Ghazi", "dera Ismail", "Digri", "Dina", "Dinga", "Dipalpur", "Diplo", "Dokri", "Doaba", "Dir", "Drosh", "Faisalabad", "Fateh Jhang", "Ghakhar Mandi", "Ghotki", "Gojra", "Gujranwala", "Gujrat", "Gujar Khan", "Gwadar", "Hafizabad", "Hangu", "Haripur", "Haroonabad", "Harnai", "Hasilpur", "Haveli", "Hyderabad", "Islamabad", "Islamkot", "Jacobabad", "Jamshoro", "Jampur", "Jaranwala", "Jattan", "Jhang", "Jhelum", "Jhal Magsi", "Jungshahi", "Kacchi", "Kandhkot", "Kandiaro", "Karachi", "Karor Lal", "Kashmore", "Kasur", "Kech", "Keti Bandar", "Khairpur", "Kharian", "Khuzdar", "Killa Abdullah", "Killa Saifullah", "Kohat", "Kohlu", "Kot Adu", "Kotri", "Kulachi", "Kurram Agency", "Lahore", "Lakki Marwat", "Lalamusa", "Larkana", "Latamber", "Layyah", "Lehri", "Liaquat Pur", "Lodhran", "Loralai", "Malakwal", "Mamoori", "Mailsi", "Mandi Bahauddin", "Mansehra", "Mardan", "Mastuj", "Mastung", "Matiari", "Mehar", "Mehrabpur", "Mian Channu", "Mianwali", "Mianwali Bangla", "Mingora", "Mirpur Khas", "Mithani", "Mithi", "Moro", "Multan", "Murree", "Muridke", "Muzaffargarh", "Nagarparkar", "Nankana Sahib", "Narowal", "Nasirabad", "Naudero", "Naushahro Feroze", "Naushara", "Nawabshah", "Nazimabad", "Nowshera", "Okara", "Pabbi", "Paharpur", "Pakpattan", "Panjgur", "Pattoki", "Peshawar", "Pishin valley", "Pir Mahal", "Quetta", "Qaimpur", "Qambar", "Qasimabad", "Rabwah", "Rahim Yar", "Rajanpur", "Ranipur", "Ratodero", "Rawalpindi", "Renala Khurd", "Rohri", "Sadiqabad", "Safdarabad", "Sahiwal", "Sakrand", "Sanghar", "Sangla Hill", "Sarai Alamgir", "Sargodha", "Shahbandar", "Shahdadkot", "Shahdadpur", "Shahpur Chakar", "Shakargarh", "Sheikhupura", "Shikarpaur", "Shewa Adda", "Shikarpaur", "Sialkot", "Sibi", "Sohawa", "Soianwala", "Sukkur", "Swabi", "Swat", "Tangi", "Tank", "Talagang", "Tando Adam", "Tando Allahyar", "Tando Muhammad", "Tangwani", "Taxila", "Thall", "Thatta", "Timergara", "Toba Tek", "Tordher", "Umerkot", "Vehari", "Wah Cantonment", "Warah", "Washuk", "Wazirabad", "Zhob", "Ziarat"];
  List<String> get cityNameList=>_cityNameList;
  String _bloodGroupD="A+",_city="Abbottabad";
  String get bloodGroupD=> _bloodGroupD;
  String get city=>_city;
  void bloodGroupUpdate(String update)
  {
    _bloodGroupD=update;
    notifyListeners();
  }
  void cityUpdater(String update)
  {
    _city=update;
    notifyListeners();
  }
}