class Person {
  final String name;
  final String phone;
  final String picture;
  const Person(this.name, this.phone, this.picture);
}

final List<Person> people = _people
    .map((e) => Person(
        e['name'] as String, e['phone'] as String, e['picture'] as String))
    .toList(growable: false);

final List<Map<String, Object>> _people = [
  {
    "_id": "6502c0b33bd42aae43717395",
    "index": 0,
    "guid": "9d4a4532-1882-4879-91ec-ef4f1616420c",
    "isActive": true,
    "balance": "\$1,681.83",
    "picture": "http://placehold.it/32x32",
    "age": 32,
    "eyeColor": "blue",
    "name": "Jarvis Reyes",
    "gender": "male",
    "company": "VELOS",
    "email": "jarvisreyes@velos.com",
    "phone": "+1 (956) 580-2789",
    "address": "172 Keap Street, Williamson, Maryland, 6696",
    "about":
        "Officia officia adipisicing irure aliqua laborum veniam excepteur. Dolore dolore culpa ad incididunt anim ad est voluptate fugiat dolore ullamco. Ex anim adipisicing aliquip Lorem. Ut sit duis et amet irure voluptate tempor deserunt duis sunt incididunt commodo eu.\r\n",
    "registered": "2018-11-13T06:53:16 -07:00",
    "latitude": 47.722722,
    "longitude": -158.983258,
    "tags": ["duis", "enim", "et", "do", "ipsum", "proident", "pariatur"],
    "friends": [
      {"id": 0, "name": "Arline Joyce"},
      {"id": 1, "name": "Gomez Chan"},
      {"id": 2, "name": "Stephanie Blake"}
    ],
    "greeting": "Hello, Jarvis Reyes! You have 9 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "6502c0b3e04e3b5cbb5a3820",
    "index": 1,
    "guid": "ded6a048-2da7-4285-983e-96d44131e084",
    "isActive": true,
    "balance": "\$2,425.40",
    "picture": "http://placehold.it/32x32",
    "age": 39,
    "eyeColor": "brown",
    "name": "Duke Hartman",
    "gender": "male",
    "company": "PLASMOX",
    "email": "dukehartman@plasmox.com",
    "phone": "+1 (823) 507-2733",
    "address": "914 Norfolk Street, Leming, Connecticut, 4939",
    "about":
        "Labore officia et dolor culpa sit. Ad eu pariatur elit culpa reprehenderit aute aliquip minim amet. Incididunt aliqua commodo irure laborum laborum elit laborum magna minim adipisicing fugiat. Sit occaecat tempor veniam ad pariatur dolore cillum est cillum nostrud magna cillum Lorem amet. Aliquip aliqua quis sint in ipsum esse laboris reprehenderit anim. Id aute aliquip aute est dolor sunt et culpa.\r\n",
    "registered": "2015-06-19T06:56:10 -07:00",
    "latitude": 48.197978,
    "longitude": -145.639847,
    "tags": [
      "officia",
      "proident",
      "irure",
      "deserunt",
      "velit",
      "excepteur",
      "nostrud"
    ],
    "friends": [
      {"id": 0, "name": "Griffin Santiago"},
      {"id": 1, "name": "Guadalupe Faulkner"},
      {"id": 2, "name": "Rosa Cohen"}
    ],
    "greeting": "Hello, Duke Hartman! You have 1 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "6502c0b3a00dc4679c12da09",
    "index": 2,
    "guid": "dc5161a2-f7e8-44fc-b4a6-b7eb7b3b0e9e",
    "isActive": true,
    "balance": "\$2,437.70",
    "picture": "http://placehold.it/32x32",
    "age": 29,
    "eyeColor": "brown",
    "name": "Deidre Stewart",
    "gender": "female",
    "company": "BIOSPAN",
    "email": "deidrestewart@biospan.com",
    "phone": "+1 (902) 519-2652",
    "address": "769 Harrison Place, Weeksville, Virginia, 1265",
    "about":
        "Officia ea sit id cillum velit elit ut reprehenderit aliqua nisi aliquip. Dolore fugiat deserunt aliqua non cillum ad ut ullamco consectetur. Tempor cupidatat proident reprehenderit veniam velit cillum magna ad proident dolor officia. Deserunt officia velit ut deserunt irure adipisicing laborum Lorem eiusmod eiusmod ipsum excepteur ex. Quis excepteur proident laboris magna mollit magna cupidatat officia excepteur anim culpa id.\r\n",
    "registered": "2016-05-27T11:34:26 -07:00",
    "latitude": -27.034792,
    "longitude": 62.123487,
    "tags": [
      "nostrud",
      "ad",
      "aliqua",
      "laborum",
      "adipisicing",
      "culpa",
      "laboris"
    ],
    "friends": [
      {"id": 0, "name": "Welch Monroe"},
      {"id": 1, "name": "Stacy Case"},
      {"id": 2, "name": "Melisa Hobbs"}
    ],
    "greeting": "Hello, Deidre Stewart! You have 10 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "6502c0b3e5e772648a1ec86a",
    "index": 3,
    "guid": "4a84b9f1-e898-4b7e-b89a-0caa7e0608b4",
    "isActive": true,
    "balance": "\$3,121.53",
    "picture": "http://placehold.it/32x32",
    "age": 34,
    "eyeColor": "green",
    "name": "Barr Mcdaniel",
    "gender": "male",
    "company": "CABLAM",
    "email": "barrmcdaniel@cablam.com",
    "phone": "+1 (925) 584-2200",
    "address": "224 Alton Place, Mathews, District Of Columbia, 6543",
    "about":
        "Amet magna fugiat et id. Nostrud do nostrud labore velit qui culpa ea elit labore adipisicing laborum eiusmod cillum quis. Pariatur pariatur anim eu fugiat. Incididunt dolor dolore qui consequat cupidatat ut labore exercitation reprehenderit. Sint consectetur commodo ipsum cupidatat id ex sunt in. Ullamco fugiat dolor eu esse non reprehenderit nisi quis ipsum dolor incididunt. Dolor quis duis incididunt nisi eu adipisicing nisi voluptate.\r\n",
    "registered": "2017-12-04T11:54:30 -07:00",
    "latitude": -44.234532,
    "longitude": 168.032606,
    "tags": ["do", "pariatur", "sit", "nulla", "elit", "ut", "quis"],
    "friends": [
      {"id": 0, "name": "Mccray Heath"},
      {"id": 1, "name": "Marcie Walker"},
      {"id": 2, "name": "Fields Becker"}
    ],
    "greeting": "Hello, Barr Mcdaniel! You have 4 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "6502c0b3ac8abc4e65e29ffd",
    "index": 4,
    "guid": "2dc4a4db-57c9-433a-803d-a08379c1f80e",
    "isActive": true,
    "balance": "\$2,935.77",
    "picture": "http://placehold.it/32x32",
    "age": 26,
    "eyeColor": "brown",
    "name": "Bessie Cain",
    "gender": "female",
    "company": "EXOPLODE",
    "email": "bessiecain@exoplode.com",
    "phone": "+1 (919) 478-3802",
    "address": "983 Johnson Avenue, Tolu, Palau, 3283",
    "about":
        "Eiusmod ea officia et esse nisi do deserunt dolor dolor aute cillum officia dolore voluptate. Sint est amet dolore nisi occaecat veniam cillum incididunt laborum reprehenderit eu aliqua. Esse sit officia in laboris eiusmod consectetur. Qui aliquip eiusmod cupidatat consequat in laboris mollit adipisicing sit Lorem. Consectetur elit reprehenderit duis sit exercitation duis dolore Lorem elit.\r\n",
    "registered": "2022-07-18T01:48:11 -07:00",
    "latitude": 3.615851,
    "longitude": 75.835832,
    "tags": ["ad", "et", "consequat", "sint", "culpa", "commodo", "pariatur"],
    "friends": [
      {"id": 0, "name": "Foley Dyer"},
      {"id": 1, "name": "Robin Crane"},
      {"id": 2, "name": "Page Wells"}
    ],
    "greeting": "Hello, Bessie Cain! You have 10 unread messages.",
    "favoriteFruit": "apple"
  }
];
