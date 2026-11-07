#!/usr/bin/env bash
set -e
SDK=/home/vscode/android-sdk
mkdir -p $SDK/cmdline-tools && cd /tmp
curl -fsSLo cmdtools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip -q -o cmdtools.zip -d $SDK/cmdline-tools
rm -rf $SDK/cmdline-tools/latest && mv $SDK/cmdline-tools/cmdline-tools $SDK/cmdline-tools/latest
export PATH=$SDK/cmdline-tools/latest/bin:$PATH
yes | sdkmanager --licenses >/dev/null || true
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"
echo "sdk.dir=$SDK" > /workspaces/*/local.properties 2>/dev/null || true

# Gradle (for generating the wrapper)
source /usr/local/sdkman/bin/sdkman-init.sh
sdk install gradle 8.7 < /dev/null || true
cd - >/dev/null
[ -f gradlew ] || gradle wrapper --gradle-version 8.7
chmod +x gradlew
echo "Setup done. Run: ./gradlew assembleDebug"
