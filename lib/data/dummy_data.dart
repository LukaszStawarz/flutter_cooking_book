import 'package:flutter/material.dart';
import 'package:ksiazkakucharska/models/category.dart';
import 'package:ksiazkakucharska/models/meal.dart';

const listOfCategories = [
  Category(
    id: 'c1',
    title: 'Włoskie',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Szybkie i łatwe',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Hamburgery',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Niemieckie',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Lekkie i smaczne',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Egzotyczne',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Śniadania',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Azjatyckie',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Francuzkie',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Smaki Lata',
    color: Colors.teal,
  ),
];

const dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti z sosem pomidorowym.',
    affordability: Affordability.tanie,
    complexity: Complexity.proste,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      '4 Pomidory',
      '1 Łyżka oliwy',
      '1 Cebula',
      '250g Makaronu Spaghetti',
      'Przyprawy',
      'Ser żółty'
    ],
    steps: [
      'Pokrój pomidory i cebulę na małe kawałki.',
      'Zagotuj wodę - dodaj do niej sól, gdy zacznie wrzeć.',
      'Wrzuć spaghetti do wrzącej wody - powinny być gotowe za około 10 do 12 minut.',
      'W międzyczasie rozgrzej trochę oliwy z oliwek i dodaj pokrojoną cebulę.',
      'Po 2 minutach dodaj kawałki pomidora, sól, pieprz i inne przyprawy.',
      'Sos będzie gotowy, gdy spaghetti będą.',
      'Możesz dodać trochę sera na wierzch gotowego dania.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Tost Hawajski',
    affordability: Affordability.tanie,
    complexity: Complexity.proste,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      '1 kromka białego chleba',
      '1 plasterek szynki',
      '1 plasterek ananasa',
      '1-2 plasterki sera',
      'Masło'
    ],
    steps: [
      'Posmaruj masłem jedną stronę białego chleba',
      'Nałóż na chleb warstwę szynki, ananasa i sera',
      'Piecz tost przez około 10 minut w piekarniku w temperaturze 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Klasyczny Hamburger',
    affordability: Affordability.kosztowne,
    complexity: Complexity.proste,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      '300g Mielonej wołowiny',
      '1 Pomidor',
      '1 Ogórek',
      '1 Cebula',
      'Ketchup',
      '2 Bułki do burgerów'
    ],
    steps: [
      'Uformuj 2 kotlety',
      'Smaż kotlety przez ok. 4 minuty z każdej strony',
      'Szybko podsmaż bułki przez ok. 1 minutę z każdej strony',
      'Posmaruj bułki ketchupem',
      'Podawaj burgera z pomidorem, ogórkiem i cebulą'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Sznycel wiedeński',
    affordability: Affordability.drogie,
    complexity: Complexity.wymagajace,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      '8 Kotletów Cielęcych',
      '4 Jajka',
      '200g Bułki Tartej',
      '100g Mąki',
      '300ml Masła',
      '100g Oleju Roślinnego',
      'Sól',
      'Plasterki Cytryny'
    ],
    steps: [
      'Rozbij cielęcinę na grubość około 2-4 mm i posól z obu stron.',
      'Na płaskim talerzu, roztrzep jajka widelcem.',
      'Lekko obtocz kotlety w mące, następnie zanurz w jajku, a na końcu obtocz w bułce tartej.',
      'Rozgrzej masło i olej na dużej patelni (tłuszcz powinien być bardzo gorący) i smaż sznycle na złoty kolor z obu stron.',
      'Regularnie potrząsaj patelnią, aby sznycle były otoczone olejem, a panierka stała się puszysta.',
      'Wyjmij i osusz na papierze kuchennym. Smaż natkę pietruszki na pozostałym oleju i osusz.',
      'Umieść sznycle na podgrzanym talerzu i podawaj ozdobione pietruszką i plasterkami cytryny.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Sałatka z Wędzonym Łososiem',
    affordability: Affordability.drogie,
    complexity: Complexity.proste,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Rukola',
      'Roszponka',
      'Pietruszka',
      'Koper włoski',
      '200g Wędzonego łososia',
      'Musztarda',
      'Ocet balsamiczny',
      'Oliwa z oliwek',
      'Sól i pieprz'
    ],
    steps: [
      'Umyj i pokrój sałatę oraz zioła.',
      'Pokrój łososia w kostkę.',
      'Przygotuj dressing z musztardy, octu i oliwy z oliwek.',
      'Przygotuj sałatkę.',
      'Dodaj kostki łososia i dressing.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Mus Pomarańczowy z Czekoladą',
    affordability: Affordability.tanie,
    complexity: Complexity.trudne,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    ingredients: [
      '4x20g Żelatyny',
      '150ml Soku pomarańczowego',
      '80g Cukru',
      '300g Jogurtu',
      '200g Śmietany',
      'Skórka pomarańczy',
      'Czekolada',
    ],
    steps: [
      'Rozpuść żelatynę w garnku.',
      'Dodaj sok pomarańczowy i cukier.',
      'Zdejmij garnek z ognia.',
      'Dodaj 2 łyżki jogurtu.',
      'Wymieszaj żelatynę z pozostałym jogurtem.',
      'Schłódź wszystko w lodówce.',
      'Ubij śmietanę i delikatnie wymieszaj ją z masą pomarańczową.',
      'Ponownie schłódź przez co najmniej 4 godziny.',
      'Zetrzyj skórkę pomarańczy.',
      'Pokroj drobno czekoladę.',
      'Posyp wierzch dania skórką i czekoladą.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Pancake',
    affordability: Affordability.tanie,
    complexity: Complexity.proste,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      '1 i 1/2 Szklanki mąki pszennej',
      '3 i 1/2 Łyżeczki proszku do pieczenia',
      '1 Łyżeczka soli',
      '1 Łyżka cukru białego',
      '1 i 1/4 Szklanki mleka',
      '1 Jajko',
      '3 Łyżki stopionego masła',
    ],
    steps: [
      'W dużej misce przesiej mąkę, proszek do pieczenia, sól i cukier.',
      'Zrób zagłębienie na środku i wlej mleko, jajko i stopione masło; wymieszaj, aż będzie gładkie.',
      'Rozgrzej lekko natłuszczoną patelnię lub griddle na średnim ogniu.',
      'Nalej lub nabierz ciasto na patelnię, używając około 1/4 szklanki na każdy naleśnik. Smaż z obu stron na złoty kolor i podawaj na gorąco.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Kremowe Indyjskie Curry z Kurczakiem',
    affordability: Affordability.kosztowne,
    complexity: Complexity.wymagajace,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      '4 Piersi z kurczaka',
      '1 Cebula',
      '2 Ząbki czosnku',
      '1 Kawałek imbiru',
      '4 Łyżki migdałów',
      '1 Łyżeczka ostrej papryki',
      '500ml Mleka kokosowego',
    ],
    steps: [
      'Pokrój i usmaż pierś z kurczaka.',
      'Zmiel cebulę, czosnek i imbir na pastę i podsmaż wszystko.',
      'Dodaj przyprawy i smaż.',
      'Dodaj pierś z kurczaka + 250 ml wody i gotuj przez 10 minut.',
      'Dodaj mleko kokosowe.',
      'Podawaj z ryżem.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Suflet Czekoladowy',
    affordability: Affordability.tanie,
    complexity: Complexity.trudne,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      '1 Łyżeczka roztopionego masła.',
      '2 Łyżki białego cukru.',
      '60 g 70% Gorzkiej czekolady, pokrojonej na kawałki.',
      '1 Łyżka masła.',
      '1 Łyżka mąki pszennej.',
      '4 i 1/3 Łyżki zimnego mleka.',
      '1 Szczypta soli.',
      '1 Szczypta ostrej papryki cayenne.',
      '1 Duże żółtko.',
      '2 Duże białka.',
      '1 Szczypta kwasu winowego.',
      '1 Łyżka białego cukru”.',
    ],
    steps: [
      'Rozgrzej piekarnik do 190°C. Wyłóż dno i boki 2 foremek do sufletów papierem pergaminowym.',
      'Wysmaruj dno i boki foremek delikatnie łyżeczką roztopionego masła; pokryj dno i boki aż do samego brzegu.',
      'Dodaj 1 łyżkę białego cukru do foremek. Obróć foremki, aż cukier pokryje wszystkie powierzchnie.',
      'Umieść kawałki czekolady w metalowej misce.',
      'Umieść miskę na garnku z około 3 szklankami gorącej wody na wolnym ogniu.',
      'Rozpuść 1 łyżkę masła w rondlu na średnim ogniu. Posyp mąką. Mieszaj aż mąka połączy się z masłem i mieszanka zgęstnieje.',
      'Wymieszaj zimne mleko aż mieszanka stanie się gładka i zgęstnieje. Przełóż mieszankę do miski z roztopioną czekoladą.',
      'Dodaj sól i paprykę cayenne. Dokładnie wymieszaj. Dodaj żółtko i wymieszaj, aby połączyć.',
      'Pozostaw misę nad gorącą (ale nie wrzącą) wodą, aby czekolada pozostała ciepła podczas ubijania białek.',
      'Umieść 2 białka w misce do mieszania; dodaj kwas winowy. Ubij, aż mieszanka zacznie się gęstnieć i kropla z mieszadła pozostaje na powierzchni przez około 1 sekundę, zanim zniknie w mieszaninie.',
      'Dodaj 1/3 cukru i ubij. Ubij przez około 15 sekund.',
      'Dodaj resztę cukru. Kontynuuj ubijanie, aż mieszanka będzie mniej więcej gęsta jak pianka do golenia i będzie trzymała miękkie szczyty, 3-5 minut.',
      'Przełóż nieco mniej niż połowę białek do czekolady.',
      'Wymieszaj, aż białka zostaną dokładnie połączone z czekoladą.',
      'Dodaj resztę białek; delikatnie wymieszaj je w czekoladzie szpatułką, podnosząc spód i składając na górę.',
      'Przestań mieszać po zniknięciu białek. Podziel mieszankę między 2 przygotowane foremki. Umieść foremki na przygotowanej blasze do pieczenia.',
      'Piecz w rozgrzanym piekarniku, aż suflety staną się napompowane i wyjdą ponad górną krawędź foremek, 12-15 minut.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Sałatka ze Szparagami i Pomidorkami Koktajlowymi',
    affordability: Affordability.tanie,
    complexity: Complexity.proste,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    duration: 30,
    ingredients: [
      'Białe i zielone szparagi',
      '30g Orzeszków piniowych',
      '300g Pomidorków koktajlowych',
      'Sałata',
      'Sól, pieprz i oliwa z oliwek',
    ],
    steps: [
      'Umyj, obierz i pokrój szparagi.',
      'Gotuj w osolonej wodzie.',
      'Posól i popieprz szparagi.',
      'Podsmaż orzeszki piniowe.',
      'Przekrój pomidorki na pół.',
      'Wymieszaj ze szparagami, sałatą i sosem.',
      'Podawaj z bagietką lub bułką.'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  // Meal(
  //     id: 'm11',
  //     categories: ['c4'],
  //     title: 'Pierogi',
  //     imageUrl:
  //         'https://upload.wikimedia.org/wikipedia/commons/5/5d/Skwarki.jpg',
  //     ingredients: ingredients,
  //     steps: 'steps',
  //     duration: duration,
  //     complexity: complexity,
  //     affordability: affordability,
  //     isGlutenFree: isGlutenFree,
  //     isLactoseFree: isLactoseFree,
  //     isVegan: isVegan,
  //     isVegetarian: isVegetarian)
];
