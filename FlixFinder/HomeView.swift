import SwiftUI

struct HomeView: View {
    @ObservedObject var watchlistManager: WatchlistManager
    @State private var selectedMood = "Happy"
    let moods = ["Happy", "Sad", "Romantic", "Thrilling", "Funny"]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("🎬 Welcome to FlixFinder")
                    .font(.largeTitle)
                    .bold()

                Text("Pick your mood:")
                Picker("Mood", selection: $selectedMood) {
                    ForEach(moods, id: \.self) { mood in
                        Text(mood)
                    }
                }
                .pickerStyle(.wheel)

                NavigationLink(destination: RecommendationsView(mood: selectedMood, watchlistManager: watchlistManager)) {
                    Text("Get Recommendations")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }

                NavigationLink(destination: WatchlistView(watchlistManager: watchlistManager)) {
                    Text("View Watchlist")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
    }
}

