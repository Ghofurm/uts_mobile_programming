class Coffee {
  const Coffee({
    required this.name,
    required this.origin,
    required this.roastLevel,
    required this.tastingNotes,
    required this.description,
    required this.imageUrl,
    required this.infoUrl,
  });

  final String name;
  final String origin;
  final String roastLevel;
  final String tastingNotes;
  final String description;
  final String imageUrl;
  final String infoUrl;
}

const List<Coffee> coffees = [
  Coffee(
    name: 'Gayo',
    origin: 'Aceh',
    roastLevel: 'Medium',
    tastingNotes: 'Cokelat hitam, rempah, herbal',
    description: 'Arabika Gayo tumbuh di dataran tinggi Aceh dengan tanah vulkanik yang subur. Rasanya tebal namun seimbang, dengan sentuhan rempah hangat dan aftertaste manis yang panjang.',
    imageUrl: 'https://images.unsplash.com/photo-1447933601403-0c6688de566e?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Kopi_Gayo',
  ),
  Coffee(
    name: 'Mandailing',
    origin: 'Sumatera Utara',
    roastLevel: 'Medium-Dark',
    tastingNotes: 'Karamel, kacang, tembakau',
    description: 'Kopi Mandailing dikenal dengan body-nya yang kuat dan keasaman rendah. Cocok bagi pencinta kopi pekat dengan aroma karamel dan kacang panggang.',
    imageUrl: 'https://images.unsplash.com/photo-1511920170033-f8396924c348?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Kopi_Mandailing',
  ),
  Coffee(
    name: 'Lampung',
    origin: 'Lampung',
    roastLevel: 'Dark',
    tastingNotes: 'Dark chocolate, smoky, earthy',
    description: 'Robusta Lampung memiliki karakter tegas dengan rasa pahit yang bersih. Sering menjadi favorit untuk kopi susu karena aromanya kuat dan body-nya mantap.',
    imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Kopi_Lampung',
  ),
  Coffee(
    name: 'Java Preanger',
    origin: 'Jawa Barat',
    roastLevel: 'Light',
    tastingNotes: 'Jeruk, melati, gula aren',
    description: 'Java Preanger adalah arabika legendaris dari dataran tinggi Priangan. Profilnya cerah dengan keasaman jeruk lembut dan aroma bunga yang elegan.',
    imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Parahyangan',
  ),
  Coffee(
    name: 'Java Ijen',
    origin: 'Jawa Timur',
    roastLevel: 'Medium',
    tastingNotes: 'Apel merah, almond, madu',
    description: 'Ditumbuhkan di lereng Ijen, kopi ini memadukan keasaman buah yang segar dengan manis madu. Body-nya ringan dan menyenangkan untuk diseduh manual.',
    imageUrl: 'https://images.unsplash.com/photo-1442512595331-e89e73853f31?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Danau_Kawah_Ijen',
  ),
  Coffee(
    name: 'Kintamani',
    origin: 'Bali',
    roastLevel: 'Light-Medium',
    tastingNotes: 'Jeruk bali, lemon, floral',
    description: 'Arabika Kintamani ditanam berdampingan dengan pohon jeruk, memberi aroma sitrus yang khas. Rasanya ringan, bersih, dan menyegarkan.',
    imageUrl: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Kintamani,_Bangli',
  ),
  Coffee(
    name: 'Flores Bajawa',
    origin: 'Nusa Tenggara Timur',
    roastLevel: 'Medium',
    tastingNotes: 'Cokelat susu, karamel, rempah',
    description: 'Flores Bajawa memiliki body tebal dengan rasa manis cokelat susu dan rempah lembut. Keasamannya rendah sehingga mudah dinikmati siapa saja.',
    imageUrl: 'https://images.unsplash.com/photo-1498804103079-a6351b050096?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Bajawa,_Ngada',
  ),
  Coffee(
    name: 'Toraja',
    origin: 'Sulawesi Selatan',
    roastLevel: 'Medium',
    tastingNotes: 'Rempah, cokelat, jeruk',
    description: 'Kopi Toraja terkenal hingga mancanegara berkat body-nya yang kompleks. Perpaduan rempah, cokelat, dan keasaman jeruk membuatnya terasa hidup.',
    imageUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Toraja',
  ),
  Coffee(
    name: 'Mamasa',
    origin: 'Sulawesi Barat',
    roastLevel: 'Medium-Dark',
    tastingNotes: 'Gula merah, kakao, kayu manis',
    description: 'Arabika Mamasa tumbuh di ketinggian 1.400 meter. Rasanya manis seperti gula merah dengan sentuhan kakao dan kayu manis yang menghangatkan.',
    imageUrl: 'https://images.unsplash.com/photo-1518057111178-44a106bad636?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Kabupaten_Mamasa',
  ),
  Coffee(
    name: 'Papua Wamena',
    origin: 'Papua',
    roastLevel: 'Light-Medium',
    tastingNotes: 'Buah tropis, bunga, teh',
    description: 'Kopi Wamena ditanam di lembah pegunungan dengan udara dingin. Profilnya halus dengan aroma buah tropis, bunga, dan aftertaste seperti teh.',
    imageUrl: 'https://images.unsplash.com/photo-1559496417-e7f25cb247f3?auto=format&fit=crop&w=900&q=80',
    infoUrl: 'https://id.wikipedia.org/wiki/Wamena',
  ),
];
