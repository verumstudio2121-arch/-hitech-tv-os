# HiTech TV OS – Leanback launcher (Kotlin, ViewBinding, XML)

## Build
Open in Android Studio (Gradle sync generates the wrapper), or run `gradle wrapper && ./gradlew assembleDebug`.

## Install on the Mi TV
Enable Developer options > USB/Network debugging, then:
    adb connect <tv-ip>:5555
    adb install -r app/build/outputs/apk/debug/app-debug.apk

## Use as Home
Press Home -> choose "HiTech TV OS" -> Always. (Some Mi TV builds only expose it under the app list;
launch it from Apps, or set it as default via Settings > Device Preferences > Home screen if available.)

## Revert (fully reversible)
adb uninstall com.hitech.tvos   (or Settings > Apps > HiTech TV OS > Uninstall). Stock launcher is untouched.

## Customise
Names, city, coordinates, refresh interval: Config.kt. Dock pinning order: AppRepository.PRIORITY.

## Build with GitHub Codespaces
1. Push this folder to a new GitHub repo (branch `main`).
2. Code > Codespaces > Create codespace. Wait for setup (~3-5 min first time).
3. In the terminal: `./gradlew assembleDebug`
4. Right-click `app/build/outputs/apk/debug/app-debug.apk` > Download.
Or just push: GitHub Actions builds it and attaches the APK under Actions > latest run > Artifacts.
