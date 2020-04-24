// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Brain",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Brain",
            targets: ["Brain"])
    ],
    targets: [
        .target(
            name: "Brain",
            path: "Sources"),
        .testTarget(
            name: "Tests",
            dependencies: ["Brain"],
            path: "Tests")
    ]
)
