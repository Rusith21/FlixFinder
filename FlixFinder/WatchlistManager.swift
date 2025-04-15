import Foundation

class WatchlistManager: ObservableObject {
    @Published var watchlist: [String] {
        didSet {
            save()
        }
    }

    private let key = "watchlist"

    init() {
        // Load saved watchlist from UserDefaults
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([String].self, from: data) {
            self.watchlist = decoded
        } else {
            self.watchlist = []
        }
    }

    // Add a new movie (only if not already in list)
    func add(movie: String) {
        if !watchlist.contains(movie) {
            watchlist.append(movie)
        }
    }

    // Remove a movie by name
    func remove(movie: String) {
        watchlist.removeAll { $0 == movie }
    }

    // Save the current watchlist to UserDefaults
    private func save() {
        if let encoded = try? JSONEncoder().encode(watchlist) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}

