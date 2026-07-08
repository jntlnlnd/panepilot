// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PanePilot",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "PanePilot", targets: ["PanePilot"])
    ],
    targets: [
        .executableTarget(
            name: "PanePilot",
            exclude: [
                "Resources/Assets/AppIconSource.png",
                "Resources/AppIcon.icns",
                "Resources/Info.plist"
            ],
            linkerSettings: [
                .linkedFramework("AppKit"),
                .linkedFramework("ApplicationServices"),
                .linkedFramework("Carbon"),
                .linkedFramework("ServiceManagement")
            ]
        )
    ]
)
