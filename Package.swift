// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SafePasswordiOSLib",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SafePasswordiOSLib",
            targets: ["SafePasswordiOSLib"]),
    ],
    targets: [
        .binaryTarget(
            name: "secretsFFI",
            path: "Sources/SafePasswordiOSLib/SafePasswordFFI.xcframework"
        ),
        .target(
            name: "SafePasswordiOSLib",
            dependencies: [
                "secretsFFI",
            ],
            path: "Sources/SafePasswordiOSLib",
            sources: ["SafePasswordiOSLib.swift"],
            publicHeadersPath: "include",
        ),
            
        .testTarget(
            name: "SafePasswordiOSLibTests",
            dependencies: ["SafePasswordiOSLib"]
        ),
    ]
)
