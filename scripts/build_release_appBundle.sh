echo 'Cleaning Project..⏳'
flutter clean
echo 'Cleaning project COMPLETE ✅'

echo 'Fetching packages..⏳'
flutter pub get
echo 'Fetching packages COMPLETE ✅'

echo 'Building apk..⏳'
flutter build appbundle --release
echo 'Building apk COMPLETE ✅'
