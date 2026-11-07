plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}
android {
    namespace = "com.hitech.tvos"
    compileSdk = 34
    defaultConfig {
        applicationId = "com.hitech.tvos"
        minSdk = 28            // Android 9 (Mi TV)
        targetSdk = 28         // matches device; avoids newer background/package-visibility rules
        versionCode = 1
        versionName = "1.0"
    }
    buildFeatures { viewBinding = true }
    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"))
        }
    }
    compileOptions { sourceCompatibility = JavaVersion.VERSION_17; targetCompatibility = JavaVersion.VERSION_17 }
    kotlinOptions { jvmTarget = "17" }
}
dependencies {
    implementation("androidx.leanback:leanback:1.0.0")
}
