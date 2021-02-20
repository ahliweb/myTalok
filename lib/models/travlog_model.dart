class TravlogModel {
  String name;
  String content;
  String place;
  String image;

  TravlogModel(this.name, this.content, this.place, this.image);
}

List<TravlogModel> travlogs = travlogsData
    .map((item) => TravlogModel(
        item['name'], item['content'], item['place'], item['image']))
    .toList();

var travlogsData = [
  {
    "name": "\"Bersih Desa\"",
    "content":
        "Bersih Desa di Desa Talok dan Desa Gedogkulon Kec. Turen, Kab. Malang",
    "place": "Talok, Indonesia",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "name": "\"Kantor Desa\"",
    "content":
        "Penerapkan jam pelayanan ini tak lepas dari kepemimpinannya Agus Harianto sebagai Kepala Desa Talok.",
    "place": "Talok, Indonesia",
    "image": "assets/images/travlog_tokyo.png"
  },
  {
    "name": "\"Bersih Desa\"",
    "content":
        "Bersih Desa di Desa Talok dan Desa Gedogkulon Kec. Turen, Kab. Malang",
    "place": "Talok, Indonesia",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "name": "\"Kantor Desa\"",
    "content":
        "Penerapkan jam pelayanan ini tak lepas dari kepemimpinannya Agus Harianto sebagai Kepala Desa Talok.",
    "place": "Talok, Indonesia",
    "image": "assets/images/travlog_tokyo.png"
  },
  {
    "name": "\"Bersih Desa\"",
    "content":
        "Bersih Desa di Desa Talok dan Desa Gedogkulon Kec. Turen, Kab. Malang",
    "place": "Talok, Indonesia",
    "image": "assets/images/travlog_yogyakarta.png"
  },
  {
    "name": "\"Kantor Desa\"",
    "content":
        "Penerapkan jam pelayanan ini tak lepas dari kepemimpinannya Agus Harianto sebagai Kepala Desa Talok.",
    "place": "Talok, Indonesia",
    "image": "assets/images/travlog_tokyo.png"
  },
];
