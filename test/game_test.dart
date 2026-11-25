import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bomba_kelime/oyun_bomba_kelime.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeBombasiConfig.title.length, 33);
    expect(kelimeBombasiConfig.tagline.length, 33);
    for (final s in kelimeBombasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeBombasiConfig.gameId, kelimeBombasiId);
    expect(kelimeBombasiRules.gameId, kelimeBombasiId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeBombasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeBombasiId, optionalMechanics: kelimeBombasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kelimeBombasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
