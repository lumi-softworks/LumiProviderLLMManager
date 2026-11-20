// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LumiProviderLLMManager",
    platforms: [
        .macOS("14.0"),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "ProviderLLMManager",
            targets: ["ProviderLLMManager"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/lumi-softworks/LumiKitLLM.git", from: "1.0.1"),
        .package(url: "https://github.com/lumi-softworks/LumiProviderMessage.git", from: "1.0.0"),
        .package(url: "https://github.com/lumi-softworks/LumiLogging.git", from: "1.0.2"),
    ],
    targets: [
        .target(
            name: "ProviderLLMManager",
            dependencies: [
                .product(name: "KitLLM", package: "LumiKitLLM"),
                .product(name: "LumiLoggingKit", package: "LumiLogging"),
            ],
            path: "Sources/ProviderLLMManager"
        ),
        .testTarget(
            name: "ProviderLLMManagerTests",
            dependencies: [
                "ProviderLLMManager",
                .product(name: "KitLLM", package: "LumiKitLLM"),
                .product(name: "ProviderMessage", package: "LumiProviderMessage"),
            ],
            path: "Tests/ProviderLLMManagerTests"
        ),
    ]
)
