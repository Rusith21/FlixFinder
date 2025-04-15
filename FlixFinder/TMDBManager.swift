import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

class TMDBManager {
    static let shared = TMDBManager()

    private let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTNlY2U0ZGVlNmY0N2E2ZjJiYWNlOTY3ZGQwZmEwYSIsIm5iZiI6MTc0MTMyOTEyMS41ODYsInN1YiI6IjY3Y2E5MmUxZGJhMTQ5MTYwNjJiNDkxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BWb1RzGZ3df3TuQ3IacGPsx3cb--XPLmy8f8bzQnJpw"

    func fetchMovies(for mood: String, completion: @escaping ([Movie]) -> Void) {
        let query = mood.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "happy"
        let urlString = "https://api.themoviedb.org/3/search/movie?query=\(query)&include_adult=false&language=en-US&page=1"

        guard let url = URL(string: urlString) else {
            print("❌ Invalid URL")
            completion([])
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        // ✅ Force fresh connection with ephemeral config
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)

        session.dataTask(with: request) { data, response, error in
            if let data = data {
                print("📦 Raw JSON:\n", String(data: data, encoding: .utf8) ?? "nil")

                do {
                    let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                    print("✅ Decoded \(result.results.count) movies")
                    DispatchQueue.main.async {
                        completion(result.results)
                    }
                } catch {
                    print("❌ Decoding error: \(error)")
                    completion([])
                }
            } else {
                print("❌ Network error: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
            }
        }.resume()
    }
}

