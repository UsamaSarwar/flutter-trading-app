flutter pub get
flutter build web --release --web-renderer html

# Remove old docs
# rm -rf docs/*

# Move build/web/ files to docs/
cp -r build/web/* docs/

# Remove build/web/
# rm -rf build/web

# Remove build/
# rm -rf build


# cp -r lib/ docs/