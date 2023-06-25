// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SwiftWhisper",
    products: [
        .library(name: "SwiftWhisper", targets: ["SwiftWhisper"])
    ],
    targets: [
        .target(name: "SwiftWhisper", dependencies: [.target(name: "whisper_cpp")]),
        .target(name: "whisper_cpp", cSettings: [
            .unsafeFlags(["-O3", "-DGGML_USE_ACCELERATE=1", "-DWHISPER_USE_COREML", "-DWHISPER_COREML_ALLOW_FALLBACK"])
        ]),
        .testTarget(name: "WhisperTests", dependencies: [.target(name: "SwiftWhisper")], resources: [.copy("TestResources/")])
    ],
    cxxLanguageStandard: CXXLanguageStandard.cxx11
)
