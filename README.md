# 🎬 FlixFinder

FlixFinder is a SwiftUI-based iOS app that recommends movies based on your mood using real-time data from the TMDB API. It features a simple, modern UI with poster previews, watchlist support, and persistent storage.

---

## 📱 Screenshots

| Home Screen  |/var/folders/jn/5qx3pprn3_528czfh112qddh0000gn/T/simulator_screenshot_93CFAD42-D5C9-4404-854C-EBCF144C70D1.png
| Movie Recommendations
/var/folders/jn/5qx3pprn3_528czfh112qddh0000gn/T/simulator_screenshot_E5630124-6515-4BE7-B4E4-7D49D1B8793B.png

---

## ✨ Features

- 🎭 Select a mood (Happy, Sad, Romantic, etc.)
- 📡 Fetch real-time movie suggestions via TMDB API
- 🖼 View movie posters, titles, and overviews
- 💙 Add movies to your Watchlist
- 📚 View and manage your Watchlist (with delete)

---

## 🛠 Tech Stack

- Swift 5 / SwiftUI
- TMDB API (v3 or v4)
- AsyncImage for poster loading
- `@ObservedObject` & `@StateObject` for watchlist sync
- `UserDefaults` for persistent watchlist storage

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/Rusith21/FlixFinder.git
cd FlixFinder
open FlixFinder.xcodeproj

