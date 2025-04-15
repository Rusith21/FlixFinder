import SwiftUI

@main
struct FlixFinderApp: App {
    @StateObject private var watchlistManager = WatchlistManager()

    var body: some Scene {
        WindowGroup {
            HomeView(watchlistManager: watchlistManager)
        }
    }
}

