allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

plugins {
    id("com.google.gms.google-services") version "4.4.4" apply false
}


subprojects {
    afterEvaluate {
        dependencies {
            // Firebase BoM untuk mengelola versi
            implementation(platform("com.google.firebase:firebase-bom:34.7.0"))
            
            // Dependensi Firebase yang umum digunakan (sesuaikan dengan kebutuhan)
            implementation("com.google.firebase:firebase-analytics")
            implementation("com.google.firebase:firebase-auth")
            implementation("com.google.firebase:firebase-firestore")
            implementation("com.google.firebase:firebase-storage")
            implementation("com.google.firebase:firebase-messaging")
            // Tambahkan library Firebase lainnya sesuai kebutuhan
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}