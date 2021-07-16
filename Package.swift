// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewsAPI",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "NewsAPI",
            targets: ["NewsAPI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NewsAPI",
            dependencies: []),
        .testTarget(
            name: "NewsAPITests",
            dependencies: ["NewsAPI"]),
    ]
)
