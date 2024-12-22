import SwiftUI

@main
struct MemoryCardApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .modelContainer(for: [Card.self])
        }
    }
}
