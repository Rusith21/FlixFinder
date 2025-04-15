# 🎬 FlixFinder

FlixFinder is a SwiftUI-based iOS app that recommends movies based on your mood using real-time data from the TMDB API. It features a simple, modern UI with poster previews, watchlist support, and persistent storage.

---

## 📱 Screenshots


| Home Screen  
![simulator_screenshot_ABA03D8B-985B-422B-8DA7-BFD891301A7D](https://github.com/user-attachments/assets/857c6213-873c-4dde-a06a-779dc843cb24)



| Movie Recommendations
![simulator_screenshot_944F6013-9252-4D7F-B89F-2D0105FB1D91](https://github.com/user-attachments/assets/66446e36-0e00-4c6e-add9-e83ed147bab7)


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

