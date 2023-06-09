// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "docgen",
    products: [
        .library(
            name: "docgenlib",
            targets: ["docgenlib"]),
        .executable(
            name: "docgen",
            targets: ["docgen"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/DavidSkrundz/Regex", from: "0.3.0"),
        .package(url: "https://github.com/DavidSkrundz/Collections.git", from: "1.1.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "docgenlib",
            dependencies: [.product(name: "Regex", package: "Regex")]
        ),
        .executableTarget(
            name: "docgen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "docgenlib"
            ]),
        .testTarget(
            name: "docgenTests",
            dependencies: ["docgen"]),
        .testTarget(
            name: "docgenlibTests",
            dependencies: ["docgenlib"]),
    ]
)
