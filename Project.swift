import ProjectDescription

let project = Project(
    name: "MemoryCard",
    targets: [
        .target(
            name: "MemoryCard",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.MemoryCard",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["MemoryCard/Sources/**"],
            resources: ["MemoryCard/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "MemoryCardTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MemoryCardTests",
            infoPlist: .default,
            sources: ["MemoryCard/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MemoryCard")]
        ),
    ]
)
