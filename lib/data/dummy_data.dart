// import 'package:flutter/material.dart';
// import 'package:ksiazkakucharska/models/category.dart';
// import 'package:ksiazkakucharska/models/meal.dart';

// const listOfCategories = [
//   Category(
//     id: 'c1',
//     title: 'Włoskie',
//     color: Colors.purple,
//   ),
//   Category(
//     id: 'c2',
//     title: 'Szybkie i łatwe',
//     color: Colors.red,
//   ),
//   Category(
//     id: 'c3',
//     title: 'Polskie smaki',
//     color: Colors.orange,
//   ),
//   Category(
//     id: 'c4',
//     title: 'Niemieckie',
//     color: Colors.amber,
//   ),
//   Category(
//     id: 'c5',
//     title: 'Lekkie i smaczne',
//     color: Colors.blue,
//   ),
//   Category(
//     id: 'c6',
//     title: 'Egzotyczne',
//     color: Colors.green,
//   ),
//   Category(
//     id: 'c7',
//     title: 'Śniadania',
//     color: Colors.lightBlue,
//   ),
//   Category(
//     id: 'c8',
//     title: 'Azjatyckie',
//     color: Colors.lightGreen,
//   ),
//   Category(
//     id: 'c9',
//     title: 'Francuzkie',
//     color: Colors.pink,
//   ),
//   Category(
//     id: 'c10',
//     title: 'Smaki Lata',
//     color: Colors.teal,
//   ),
// ];

// final dummyMeals = [
//   Meal(
//     id: 'm1',
//     categories: [
//       'c1',
//       'c2',
//     ],
//     title: 'Spaghetti z sosem pomidorowym.',
//     affordability: Affordability.tanie,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     duration: 20,
//     ingredients: [
//       '4 Pomidory',
//       '1 Łyżka oliwy',
//       '1 Cebula',
//       '250g Makaronu Spaghetti',
//       'Przyprawy',
//       'Ser żółty'
//     ],
//     steps: [
//       'Pokrój pomidory i cebulę na małe kawałki.',
//       'Zagotuj wodę - dodaj do niej sól, gdy zacznie wrzeć.',
//       'Wrzuć spaghetti do wrzącej wody - powinny być gotowe za około 10 do 12 minut.',
//       'W międzyczasie rozgrzej trochę oliwy z oliwek i dodaj pokrojoną cebulę.',
//       'Po 2 minutach dodaj kawałki pomidora, sól, pieprz i inne przyprawy.',
//       'Sos będzie gotowy, gdy spaghetti będą.',
//       'Możesz dodać trochę sera na wierzch gotowego dania.'
//     ],
//     isGlutenFree: false,
//     isVegan: true,
//     isVegetarian: true,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm2',
//     categories: [
//       'c2',
//     ],
//     title: 'Tost Hawajski',
//     affordability: Affordability.tanie,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
//     duration: 10,
//     ingredients: [
//       '1 kromka białego chleba',
//       '1 plasterek szynki',
//       '1 plasterek ananasa',
//       '1-2 plasterki sera',
//       'Masło'
//     ],
//     steps: [
//       'Posmaruj masłem jedną stronę białego chleba',
//       'Nałóż na chleb warstwę szynki, ananasa i sera',
//       'Piecz tost przez około 10 minut w piekarniku w temperaturze 200°C'
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm3',
//     categories: [
//       'c2',
//       'c4',
//     ],
//     title: 'Klasyczny Hamburger',
//     affordability: Affordability.kosztowne,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//     duration: 45,
//     ingredients: [
//       '300g Mielonej wołowiny',
//       '1 Pomidor',
//       '1 Ogórek',
//       '1 Cebula',
//       'Ketchup',
//       '2 Bułki do burgerów'
//     ],
//     steps: [
//       'Uformuj 2 kotlety',
//       'Smaż kotlety przez ok. 4 minuty z każdej strony',
//       'Szybko podsmaż bułki przez ok. 1 minutę z każdej strony',
//       'Posmaruj bułki ketchupem',
//       'Podawaj burgera z pomidorem, ogórkiem i cebulą'
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm4',
//     categories: [
//       'c4',
//     ],
//     title: 'Sznycel wiedeński',
//     affordability: Affordability.drogie,
//     complexity: Complexity.wymagajace,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
//     duration: 60,
//     ingredients: [
//       '8 Kotletów Cielęcych',
//       '4 Jajka',
//       '200g Bułki Tartej',
//       '100g Mąki',
//       '300ml Masła',
//       '100g Oleju Roślinnego',
//       'Sól',
//       'Plasterki Cytryny'
//     ],
//     steps: [
//       'Rozbij cielęcinę na grubość około 2-4 mm i posól z obu stron.',
//       'Na płaskim talerzu, roztrzep jajka widelcem.',
//       'Lekko obtocz kotlety w mące, następnie zanurz w jajku, a na końcu obtocz w bułce tartej.',
//       'Rozgrzej masło i olej na dużej patelni (tłuszcz powinien być bardzo gorący) i smaż sznycle na złoty kolor z obu stron.',
//       'Regularnie potrząsaj patelnią, aby sznycle były otoczone olejem, a panierka stała się puszysta.',
//       'Wyjmij i osusz na papierze kuchennym. Smaż natkę pietruszki na pozostałym oleju i osusz.',
//       'Umieść sznycle na podgrzanym talerzu i podawaj ozdobione pietruszką i plasterkami cytryny.'
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm5',
//     categories: [
//       'c2',
//       'c5',
//       'c10',
//     ],
//     title: 'Sałatka z Wędzonym Łososiem',
//     affordability: Affordability.drogie,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
//     duration: 15,
//     ingredients: [
//       'Rukola',
//       'Roszponka',
//       'Pietruszka',
//       'Koper włoski',
//       '200g Wędzonego łososia',
//       'Musztarda',
//       'Ocet balsamiczny',
//       'Oliwa z oliwek',
//       'Sól i pieprz'
//     ],
//     steps: [
//       'Umyj i pokrój sałatę oraz zioła.',
//       'Pokrój łososia w kostkę.',
//       'Przygotuj dressing z musztardy, octu i oliwy z oliwek.',
//       'Przygotuj sałatkę.',
//       'Dodaj kostki łososia i dressing.'
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm6',
//     categories: [
//       'c6',
//       'c10',
//     ],
//     title: 'Mus Pomarańczowy z Czekoladą',
//     affordability: Affordability.tanie,
//     complexity: Complexity.trudne,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
//     duration: 240,
//     ingredients: [
//       '4x20g Żelatyny',
//       '150ml Soku pomarańczowego',
//       '80g Cukru',
//       '300g Jogurtu',
//       '200g Śmietany',
//       'Skórka pomarańczy',
//       'Czekolada',
//     ],
//     steps: [
//       'Rozpuść żelatynę w garnku.',
//       'Dodaj sok pomarańczowy i cukier.',
//       'Zdejmij garnek z ognia.',
//       'Dodaj 2 łyżki jogurtu.',
//       'Wymieszaj żelatynę z pozostałym jogurtem.',
//       'Schłódź wszystko w lodówce.',
//       'Ubij śmietanę i delikatnie wymieszaj ją z masą pomarańczową.',
//       'Ponownie schłódź przez co najmniej 4 godziny.',
//       'Zetrzyj skórkę pomarańczy.',
//       'Pokroj drobno czekoladę.',
//       'Posyp wierzch dania skórką i czekoladą.',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm7',
//     categories: [
//       'c7',
//     ],
//     title: 'Pancake',
//     affordability: Affordability.tanie,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
//     duration: 20,
//     ingredients: [
//       '1 i 1/2 Szklanki mąki pszennej',
//       '3 i 1/2 Łyżeczki proszku do pieczenia',
//       '1 Łyżeczka soli',
//       '1 Łyżka cukru białego',
//       '1 i 1/4 Szklanki mleka',
//       '1 Jajko',
//       '3 Łyżki stopionego masła',
//     ],
//     steps: [
//       'W dużej misce przesiej mąkę, proszek do pieczenia, sól i cukier.',
//       'Zrób zagłębienie na środku i wlej mleko, jajko i stopione masło; wymieszaj, aż będzie gładkie.',
//       'Rozgrzej lekko natłuszczoną patelnię lub griddle na średnim ogniu.',
//       'Nalej lub nabierz ciasto na patelnię, używając około 1/4 szklanki na każdy naleśnik. Smaż z obu stron na złoty kolor i podawaj na gorąco.'
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm8',
//     categories: [
//       'c8',
//     ],
//     title: 'Kremowe Indyjskie Curry z Kurczakiem',
//     affordability: Affordability.kosztowne,
//     complexity: Complexity.wymagajace,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
//     duration: 35,
//     ingredients: [
//       '4 Piersi z kurczaka',
//       '1 Cebula',
//       '2 Ząbki czosnku',
//       '1 Kawałek imbiru',
//       '4 Łyżki migdałów',
//       '1 Łyżeczka ostrej papryki',
//       '500ml Mleka kokosowego',
//     ],
//     steps: [
//       'Pokrój i usmaż pierś z kurczaka.',
//       'Zmiel cebulę, czosnek i imbir na pastę i podsmaż wszystko.',
//       'Dodaj przyprawy i smaż.',
//       'Dodaj pierś z kurczaka + 250 ml wody i gotuj przez 10 minut.',
//       'Dodaj mleko kokosowe.',
//       'Podawaj z ryżem.'
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm9',
//     categories: [
//       'c9',
//     ],
//     title: 'Suflet Czekoladowy',
//     affordability: Affordability.tanie,
//     complexity: Complexity.trudne,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
//     duration: 45,
//     ingredients: [
//       '1 Łyżeczka roztopionego masła.',
//       '2 Łyżki białego cukru.',
//       '60 g 70% Gorzkiej czekolady, pokrojonej na kawałki.',
//       '1 Łyżka masła.',
//       '1 Łyżka mąki pszennej.',
//       '4 i 1/3 Łyżki zimnego mleka.',
//       '1 Szczypta soli.',
//       '1 Szczypta ostrej papryki cayenne.',
//       '1 Duże żółtko.',
//       '2 Duże białka.',
//       '1 Szczypta kwasu winowego.',
//       '1 Łyżka białego cukru”.',
//     ],
//     steps: [
//       'Rozgrzej piekarnik do 190°C. Wyłóż dno i boki 2 foremek do sufletów papierem pergaminowym.',
//       'Wysmaruj dno i boki foremek delikatnie łyżeczką roztopionego masła; pokryj dno i boki aż do samego brzegu.',
//       'Dodaj 1 łyżkę białego cukru do foremek. Obróć foremki, aż cukier pokryje wszystkie powierzchnie.',
//       'Umieść kawałki czekolady w metalowej misce.',
//       'Umieść miskę na garnku z około 3 szklankami gorącej wody na wolnym ogniu.',
//       'Rozpuść 1 łyżkę masła w rondlu na średnim ogniu. Posyp mąką. Mieszaj aż mąka połączy się z masłem i mieszanka zgęstnieje.',
//       'Wymieszaj zimne mleko aż mieszanka stanie się gładka i zgęstnieje. Przełóż mieszankę do miski z roztopioną czekoladą.',
//       'Dodaj sól i paprykę cayenne. Dokładnie wymieszaj. Dodaj żółtko i wymieszaj, aby połączyć.',
//       'Pozostaw misę nad gorącą (ale nie wrzącą) wodą, aby czekolada pozostała ciepła podczas ubijania białek.',
//       'Umieść 2 białka w misce do mieszania; dodaj kwas winowy. Ubij, aż mieszanka zacznie się gęstnieć i kropla z mieszadła pozostaje na powierzchni przez około 1 sekundę, zanim zniknie w mieszaninie.',
//       'Dodaj 1/3 cukru i ubij. Ubij przez około 15 sekund.',
//       'Dodaj resztę cukru. Kontynuuj ubijanie, aż mieszanka będzie mniej więcej gęsta jak pianka do golenia i będzie trzymała miękkie szczyty, 3-5 minut.',
//       'Przełóż nieco mniej niż połowę białek do czekolady.',
//       'Wymieszaj, aż białka zostaną dokładnie połączone z czekoladą.',
//       'Dodaj resztę białek; delikatnie wymieszaj je w czekoladzie szpatułką, podnosząc spód i składając na górę.',
//       'Przestań mieszać po zniknięciu białek. Podziel mieszankę między 2 przygotowane foremki. Umieść foremki na przygotowanej blasze do pieczenia.',
//       'Piecz w rozgrzanym piekarniku, aż suflety staną się napompowane i wyjdą ponad górną krawędź foremek, 12-15 minut.',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm10',
//     categories: [
//       'c2',
//       'c5',
//       'c10',
//     ],
//     title: 'Sałatka ze Szparagami i Pomidorkami Koktajlowymi',
//     affordability: Affordability.tanie,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
//     duration: 30,
//     ingredients: [
//       'Białe i zielone szparagi',
//       '30g Orzeszków piniowych',
//       '300g Pomidorków koktajlowych',
//       'Sałata',
//       'Sól, pieprz i oliwa z oliwek',
//     ],
//     steps: [
//       'Umyj, obierz i pokrój szparagi.',
//       'Gotuj w osolonej wodzie.',
//       'Posól i popieprz szparagi.',
//       'Podsmaż orzeszki piniowe.',
//       'Przekrój pomidorki na pół.',
//       'Wymieszaj ze szparagami, sałatą i sosem.',
//       'Podawaj z bagietką lub bułką.'
//     ],
//     isGlutenFree: true,
//     isVegan: true,
//     isVegetarian: true,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm11',
//     categories: ['c8'],
//     title: 'Pulpeciki po koreańsku',
//     affordability: Affordability.kosztowne,
//     complexity: Complexity.wymagajace,
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Gogi-wanja-jorim.jpg/640px-Gogi-wanja-jorim.jpg',
//     duration: 40,
//     ingredients: [
//       '500 g mielonego indyka (lub szynki)',
//       '1 czerstwa bułka kajzerka',
//       '1 małe jajko',
//       'po 1 łyżeczce słodkiej papryki i suszonego czosnku oraz sól i pieprz',
//       '1 łyżeczka oleju sezamowego',
//       '1 łyżka sosu sojowego',
//       'olej, mąka pszenna',
//       '1 szklanka bulionu',
//       'Składniki do sosu:',
//       '5 łyżek słodkiego sosu chilli',
//       '4 łyżki sosu sojowego',
//       '2 łyżki oleju sezamowego',
//       '3 łyżki ketchupu',
//       '1 łyżeczka suszonego czosnku',
//     ],
//     steps: [
//       'Bułkę kajzerkę włożyć do miski, zalać zimną wodą i namoczyć (ok. pół godziny lub dłużej jeśli bardzo twarda). Następnie odcisnąć z wody, rozdrobnić (np. w melakserze) i dodać do mięsa.',
//       'Do mięsa dodać również jajko, paprykę, suszony czosnek, sól, pieprz, olej sezamowy i sos sojowy. Wszystko dokładnie wyrobić na jednolitą masę.',
//       'Wigotnymi dłońmi ulepić nieduże pulpeciki. Obtoczyć je w mące pszennej i obsmażyć z dwóch stron na rozgrzanej patelni z olejem.',
//       'Jednocześnie w szerokim garnku zagotować bulion. Do gotującego się bulionu włożyć obsmażone pulpeciki i zagotować (pulpeciki nie będą przykryte bulionem). Gotować pod przykryciem przez ok. 15 - 20 minut, co jakiś czas potrząsając zamkniętym garnkiem i mieszając pulpety.',
//       'Wymieszać składniki sosu i wlać do garnka z pulpetami. Po zagotowaniu gotować przez ok. 2 - 3 minuty delikatnie mieszając od czasu do czasu.',
//       'Podawać z ugotowanym ryżem, posypać uprażonym sezamem, szczypiorkiem oraz opcjonalnie posiekaną papryczką chili.',
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm12',
//     categories: ['c7', 'c10'],
//     title: 'Truskawki zapiekane w koglu moglu',
//     affordability: Affordability.tanie,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://www.kwestiasmaku.com/sites/v123.kwestiasmaku.com/files/truskawki-zapiekane-w-koglu-moglu-01.jpg',
//     duration: 20,
//     ingredients: [
//       '200 g truskawek',
//       '4 żółtka',
//       '0,5 szklanki cukru pudru',
//       'aromat: 1 łyżka likieru amaretto lub 1 łyżeczka ekstraktu waniliowego lub 1 łyżka cukru wanilinowego',
//     ],
//     steps: [
//       'Piekarnik nagrzać do 200 stopni C. Przygotować 4 kokilki do zapiekania lub inne foremki o średnicy ok. 7 cm.',
//       'Truskawki opłukać, osuszyć, oderwać szypułki, przekroić na połówki. Włożyć do foremek (po około 50 g truskawek do każdej).',
//       'Jajka sparzyć gorącą wodą, następnie oddzielić białka od żółtek. Do deseru wykorzystamy same żółtka, natomiast z białek można upiec bezy przy innej okazji (białka można mrozić).',
//       'Żółtka ubić z cukrem pudrem na puszysty i jasny krem (w sumie przez ok. 7 minut) - najlepiej początkowo ubijać na parze (w metalowej misce zawieszonej na garnku z parującą wodą), a gdy żółtka będą już ciepłe, odstawić z pary i dalej ubijać, w międzyczasie dodając likier lub ekstrakt.',
//       'Otrzymany kogel-mogel wyłożyć na truskawki (po około 2 łyżki na porcję). Wstawić do piekarnika i piec przez 10 minut lub do lekkiego zrumienienia się i wyrośnięcia. Środek deseru ma pozostać płynny, nie może całkowicie się ściąć, tylko z zewnątrz ma utworzyć "skorupkę".',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm13',
//     categories: ['c1'],
//     title: 'Sałatka z makaronem i paluszkami krabowymi',
//     affordability: Affordability.kosztowne,
//     complexity: Complexity.wymagajace,
//     imageUrl:
//         'https://www.kwestiasmaku.com/sites/v123.kwestiasmaku.com/files/salatka-makaron-paluszki-krabowe-01.jpg',
//     duration: 40,
//     ingredients: [
//       '250 g paluszków krabowych.',
//       '2 pomidory malinowe',
//       '250 g świeżego makaronu tagliatelle lub 125 g suszonego',
//       '1 ogórek',
//       '4 łyżki słodkiego sosu chili',
//       '4 łyżki posiekanego szczypiorku',
//       '1 łyżka oliwy lub oleju roślinnego',
//       'sól, pieprz',
//     ],
//     steps: [
//       'Piekarnik nagrzać do 200 stopni C. Przygotować 4 kokilki do zapiekania lub inne foremki o średnicy ok. 7 cm.',
//       'Zagotować osoloną wodę w dużym garnku. Włożyć pomidory na pół minuty minuty aby sparzyć skórki. Pomidory wyjąć a do wrzątku włożyć makaron, gotować zgodnie z czasem na opakowaniu (świeży makaron ok. 3 - 4 minuty, suszony - ok. 10 minut). ',
//       'W czasie gdy gotuje się makaron, obrać pomidory, pokroić na ćwiartki, usunąć szypułki. Miąższ pokroić w kosteczkę, zachowując sok z pomidorów. Doprawić solą i pieprzem. Ogórka pokroić w słupki lub małe kawałeczki.',
//       'Makaron odcedzić zachowując 4 łyżki wody. Wodę tę dodać do słodkiego sosu chili, wymieszać i razem podgrzać delikatnie w garnuszku.',
//       'Odcedzony makaron włożyć z powrotem do garnka, dodać oliwę lub olej oraz pomidory wraz z sokiem. Dodać połowę szczypiorku oraz sól i pieprz, wymieszać',
//       'Wyłożyć do talerzy lub miseczek, polać połową sosu, na wierzchu położyć ogórka i paluszki, polać resztą sosu i posypać resztą szczypiorku.',
//       'Sałatkę makaronową można podawać jeszcze ciepłą, ale dobra też jest po ostudzeniu (szczególnie np. podczas upalnej pogody na dworze).',
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm14',
//     categories: ['c3'],
//     title: 'Krupnik z Piersią Kurczaka',
//     affordability: Affordability.kosztowne,
//     complexity: Complexity.proste,
//     imageUrl:
//         'https://www.kwestiasmaku.com/sites/v123.kwestiasmaku.com/files/krupnik01.jpg',
//     duration: 60,
//     ingredients: [
//       '2 litry zimnej wody',
//       '300 g piersi kurczaka',
//       'gruby plaster cebuli  ',
//       'mały kawałek selera',
//       '1 pietruszka',
//       '2 ziemniaki',
//       '2 marchewki',
//       'kawałek liścia kapusty',
//       '3 łyżki masła',
//       '1 listek laurowy, 3 ziela angielskie',
//       '100 g kaszy jęczmiennej (1 woreczek)',
//       'Opcjonalnie: 1 łyżka posiekanego koperku',
//     ],
//     steps: [
//       'Do dużego garnka wlać zimną wodę, dodać piersi kurczaka pokrojone na około 2 - 3 cm kawałki. Zagotować, zszumować i zmniejszyć ogień, gotować 10 minut. Dodać plaster cebuli, obrany i pokrojony w kosteczkę seler oraz pokrojoną na plasterki pietruszkę. Gotować przez 20 minut.',
//       'Włożyć obrane i pokrojone na plasterki marchewki, pokrojony liść kapusty oraz obrane i pokrojone w kostkę ziemniaki. Doprawić solą (około 1/2 - 2/3 łyżeczki) i zagotować. Gotować przez 5 minut.',
//       'Dodać masło, listek laurowy, ziele angielskie oraz kaszę jęczmienną. Do czasu aż kasza nie napęcznieje (około 4 - 5 minuty), gotować zupę co chwilę mieszając, aby kasza nie przywarła do dna garnka. Gotować do miękkości warzyw i kaszy przez około 20 - 25 minut. Odstawić z ognia. Zupę można posypać posiekaną natkę pietruszki lub koperkiem, ale ostrożnie, bo bardzo zmieniają jej smak.',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm15',
//     categories: ['c3'],
//     title: 'Gulasz wołowy',
//     affordability: Affordability.drogie,
//     complexity: Complexity.trudne,
//     imageUrl:
//         'https://www.kwestiasmaku.com/sites/v123.kwestiasmaku.com/files/gulasz_wolowy_01.jpg',
//     duration: 120,
//     ingredients: [
//       '1 kg wołowiny gulaszowej',
//       '150 g wędzonego boczku',
//       '2 łyżki oleju roślinnego',
//       '1/2 małego pora',
//       '1/2 cebuli',
//       '2 ząbki czosnku',
//       '1 łyżeczka papryki słodkiej i 1/3 ostrej',
//       '1,5 łyżki mąki pszennej',
//       '1/3 szklanki czerwonego wina (opcjonalnie)',
//       '750 ml bulionu wołowego',
//       '1 mała czerwona papryka',
//       '150 g małych pieczarek',
//     ],
//     steps: [
//       'Mięso pokroić w większą kostkę (ok. 3 - 4 cm). Boczek pokroić w kosteczkę, włożyć do dużego garnka z grubym dnem i co chwilę mieszając wytapiać go na małym ogniu przez ok. 3 minuty.',
//       'Zwiększyć ogień, wlać olej i stopniowo wkładać po kilka kawałków mięsa. Obsmażyć z każdej strony, w sumie przez ok. 10 minut. W międzyczasie doprawić solą oraz pieprzem.',
//       'Dodać posiekanego pora, pokrojoną cebulę oraz starty czosnek. Co chwilę mieszając smażyć wszystko przez ok. 5 - 8 minut, pod koniec dodając paprykę w proszku.',
//       'Posypać składniki mąką (bezpośrednio przez sitko), wymieszać i smażyć co chwilę mieszając przez ok. 5 minut.',
//       'Wlać wino jeśli go używamy a po chwili podgrzany bulion. Zagotować, przykryć pokrywą i zmniejszyć ogień. Gotować pod przykryciem na małym ogniu przez ok. 1 i 1/2 godziny. W międzyczasie potrząsać przykrytym garnkiem w celu przemieszania składników i sprawdzenia czy gulasz nie przywiera do dna.',
//       'Po podanym czasie dodać do gulaszu pokrojoną paprykę oraz pokrojone pieczarki. Wymieszać, przykryć i gotować jeszcze przez 1/2 godziny.',
//       'Zamiast papryki w proszku można dodać przyprawę do gulaszu / węgierską / paprykową.',
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm16',
//     categories: ['c3'],
//     title: 'Zupa fasolowa z żeberkami',
//     affordability: Affordability.drogie,
//     complexity: Complexity.trudne,
//     imageUrl:
//         'https://www.kwestiasmaku.com/sites/v123.kwestiasmaku.com/files/fasolowa_01_0.jpg',
//     duration: 90,
//     ingredients: [
//       '250 g fasoli Piękny Jaś',
//       '500 g żeberek wieprzowych',
//       '250 g wędzonego boczku',
//       '1/2 pęczka włoszczyzny',
//       '3 ziela angielskie',
//       '1 listek laurowy',
//       '1 duża cebula',
//       '1 ząbek czosnku',
//       '3 - 4 ziemniaki',
//       '1 łyżka majeranku',
//     ],
//     steps: [
//       'Dzień wcześniej namoczyć fasolę: wsypać do garnka, zalać zimną wodą w ilości około 1 litra i odstawić na całą noc do napęcznienia.',
//       'Następnego dnia odcedzić fasolę. Do dużego garnka włożyć pokrojone na 2 - 3 kawałki żeberka, wlać 2,5 litra wody, dodać fasolę oraz łyżeczkę soli. Zagotować, zszumować, zmniejszyć ogień i gotować pod przykryciem przez ok. 1 godzinę i 15 minut.',
//       'Dodać 1 obraną marchewkę (drugą obrać, zetrzeć na tarce o dużych oczkach i odłożyć na później), obraną pietruszkę, kawałek korzenia selera oraz ziela angielskie i listek laurowy. Gotować przez 15 minut.',
//       'Odkroić skórkę z boczku, wykroić białe chrząstki, pokroić w kosteczkę. Włożyć na patelnię i co chwilę mieszając podsmażyć na złoty kolor. Dodać pokrojoną w kosteczkę cebulę i mieszając smażyć przez ok. 5 minut. Pod koniec dodać rozgnieciony czosnek. Przełożyć do garnka z wywarem wypłukując patelnię częścią wywaru.',
//       'Do zupy dodać odłożoną startą marchewkę, doprawić świeżo zmielonym pieprzem i w razie potrzeby solą. Gotować 10 minut.',
//       'Ziemniaki obrać i pokroić w kosteczkę, dodać do zupy. Gotować przez 1/2 godziny. Na koniec dodać majeranek i chwilę pogotować. Podawać z pieczywem.',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   // Meal(
//   //   id: '',
//   //   categories: ['c1'],
//   //   title: '',
//   //   affordability: Affordability.kosztowne,
//   //   complexity: Complexity.wymagajace,
//   //   imageUrl:
//   //       'https://www.kwestiasmaku.com/sites/v123.kwestiasmaku.com/files/salatka-makaron-paluszki-krabowe-01.jpg',
//   //   duration: 40,
//   //   ingredients: [
//   //     
//   //   ],
//   //   steps: [
//   //    
//   //   ],
//   //   isGlutenFree: false,
//   //   isVegan: false,
//   //   isVegetarian: false,
//   //   isLactoseFree: true,
//   // ),
// ];
