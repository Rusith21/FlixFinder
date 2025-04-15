import SwiftUI

struct RecommendationsView: View {
    var mood: String
    @State private var movies: [Movie] = []
    @ObservedObject var watchlistManager: WatchlistManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("🎯 Recommendations for \"\(mood)\"")
                    .font(.title2)
                    .padding(.top)

                ForEach(movies) { movie in
                    VStack(alignment: .leading, spacing: 8) {
                        if let url = movie.posterURL {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 250)
                        }

                        Text(movie.title)
                            .font(.headline)

                        Text(movie.overview)
                            .font(.subheadline)
                            .lineLimit(3)
                            .foregroundColor(.secondary)

                        Button(action: {
                            watchlistManager.add(movie: movie.title)
                        }) {
                            Text("Add to Watchlist")
                                .padding(.vertical, 6)
                                .frame(maxWidth: .infinity)
                                .background(Color.green.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 3)
                }
            }
            .padding()
        }
        .onAppear {
            TMDBManager.shared.fetchMovies(for: mood) { results in
                self.movies = results
            }
        }
    }
}

