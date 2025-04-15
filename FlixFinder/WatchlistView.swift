import SwiftUI

struct WatchlistView: View {
    @ObservedObject var watchlistManager: WatchlistManager

    var body: some View {
        VStack(spacing: 20) {
            Text("🎞️ Your Watchlist")
                .font(.title2)

            if watchlistManager.watchlist.isEmpty {
                Text("No movies yet 😔")
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(watchlistManager.watchlist, id: \.self) { movie in
                        HStack {
                            Text(movie)
                            Spacer()
                            Button(action: {
                                watchlistManager.remove(movie: movie)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
            }

            Spacer()
        }
        .padding()
    }
}

