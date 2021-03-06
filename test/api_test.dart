import 'package:flutter_test/flutter_test.dart';
import 'package:patta/api/converter/today_converter.dart' as today_converter;
import 'package:patta/ui/model/PaliWordCardModel.dart';
import 'package:patta/ui/model/StackedInspirationCardModel.dart';

void main() {
  test('Test whether sample today api is parsed correctly or not', () {
    // setup
    const baseUrl = '<giving-any-string-here-does-not-matter-for-this-test>';
    // TODO: Extract this string to a separate JSON file
    final responseJson =
        """[{"created_at":"2020-04-27T07:08:28.837Z","updated_at":"2020-04-27T07:08:34.355Z","published_at":"2020-04-27T07:08:34.000Z","header":"Pāli Word of the Day","bookmarkable":true,"shareable":true,"type":"pali_word","pali":"kosa","audio":{"url":"/uploads/cards/pali_word_card/audio/98955ba9-3819-4662-bd7c-6bff3d035d6e"},"translations":[{"language":"en","translation":"storehouse","id":"d974a7a2-492e-44ad-a4f4-b61b3639829a"}],"id":"98955ba9-3819-4662-bd7c-6bff3d035d6e"},{"created_at":"2020-04-24T10:55:17.366Z","updated_at":"2020-04-27T07:07:44.885Z","published_at":"2020-04-27T07:07:44.000Z","header":"Inspiration of the Day","bookmarkable":true,"shareable":true,"type":"stacked_inspiration","text":" Enjoy some beautiful red flowers on the ground did you know you can also turn them into jam but you have to dry them on your rootop first which maybe you don't have the time for and you'd rather buy jam from a store.","image":{"url":"/uploads/cards/stacked_inspiration_card/image/b4285e6a-ea3c-4fc1-a7f4-4de3f1ed8ca4/bluesky.png"},"id":"b4285e6a-ea3c-4fc1-a7f4-4de3f1ed8ca4"},{"created_at":"2020-04-24T10:55:17.382Z","updated_at":"2020-04-27T07:07:41.616Z","published_at":"2020-04-27T07:07:41.000Z","header":"Inspiration of the Day","bookmarkable":true,"shareable":true,"type":"overlay_inspiration","text":"This card has a Peepal leaf on it because if there's one thing we know about meditation it's that it involves a lot of Peepal leaves, right?","text_color":"yellow","image":{"url":"/uploads/cards/overlay_inspiration_card/image/bfd8f6b7-aad2-46c5-8fac-66e838c31262/flowers.jpeg"},"id":"bfd8f6b7-aad2-46c5-8fac-66e838c31262"}]""";

    // method to be tested
    final cardModels = today_converter.convertJsonToCardModels(responseJson, baseUrl);

    // check the results to be the models that we expect them to be
    expect(
      cardModels[0],
      PaliWordCardModel(
        id: '98955ba9-3819-4662-bd7c-6bff3d035d6e',
        header: 'Pāli Word of the Day',
        pali: 'kosa',
        audioUrl:
            '$baseUrl/uploads/cards/pali_word_card/audio/98955ba9-3819-4662-bd7c-6bff3d035d6e',
        translation: 'storehouse',
      ),
    );

    expect(
      cardModels[1],
      StackedInspirationCardModel(
        id: 'b4285e6a-ea3c-4fc1-a7f4-4de3f1ed8ca4',
        header: 'Inspiration of the Day',
        text:
            """ Enjoy some beautiful red flowers on the ground did you know you can also turn them into jam but you have to dry them on your rootop first which maybe you don't have the time for and you'd rather buy jam from a store.""",
        imageUrl:
            '$baseUrl/uploads/cards/stacked_inspiration_card/image/b4285e6a-ea3c-4fc1-a7f4-4de3f1ed8ca4/bluesky.png',
      ),
    );

    // TODO: After overlay-inspiration-card is added the last card parsed should be of that
  });
}
