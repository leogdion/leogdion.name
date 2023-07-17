// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeoGDionName",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "leogdionnamewg",
            targets: ["leogdionnamewg"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/johnsundell/Publish.git",
            from: "0.9.0"
        ),
        .package(
          url: "https://github.com/apple/swift-argument-parser.git",
          from: "1.1.3"
        ),
        .package(
          name: "ContributeWordPress", path: "./Packages/ContributeWordPress"
        ),
    ],
    targets: [
        .executableTarget(
          name: "leogdionnamewg",
          dependencies: ["LeoGDionNameArgs"]
        ),
        .target(
            name: "LeoGDionNameArgs",
            dependencies: [
              .product(
                name: "ArgumentParser",
                package: "swift-argument-parser"
              ),
              "LeoGDionNameSite",
              "ContributeWordPress"
            ]
        ),
        .target(
            name: "LeoGDionNameSite",
            dependencies: ["Publish"]
        ),
        .testTarget(
            name: "LeoGDionNameSiteTests",
            dependencies: ["LeoGDionNameSite"]
        ),
    ]
)
