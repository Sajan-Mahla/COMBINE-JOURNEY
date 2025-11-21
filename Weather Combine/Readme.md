# 🚀 GitHub Profile Fetcher

**Built with SwiftUI + Combine** • Day 21 Final Project • Sajan Mahla

A sleek, reactive GitHub username search app powered by Combine and SwiftUI. Type a username → Debounce → API fetch → Beautiful UI update. This app proves full mastery of reactive pipelines, MVVM, and real-world data binding.

---

## ✨ Features

- 🔍 Live GitHub username search
- ⏱️ Debounce to avoid unnecessary API calls
- 🔄 Reactive pipeline using Combine
- 🌐 URLSession dataTaskPublisher for API requests
- ⚡ MVVM architecture
- 📸 AsyncImage-powered avatar loading
- 🧪 Built with Apple-level code discipline

---

## 🧠 Tech Stack

- **SwiftUI**
- **Combine Framework**
- **MVVM Architecture**
- **GitHub REST API**
- **URLSession Publishers**
- Debounce, removeDuplicates, flatMap, decode

---


## 🏗️ Project Structure

```
GitHubUser/
│
├── Models/
│   └── GitHubUser.swift
│
├── ViewModel/
│   └── GitHubViewModel.swift
│
└── Views/
    └── ContentView.swift
```

---

## 🔥 Core Combine Pipeline

This is the power engine of the app:

```swift
$username
    .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
    .removeDuplicates()
    .filter { !$0.isEmpty }
    .flatMap { username -> AnyPublisher<GitHubUser, Error> in
        let url = URL(string: "https://api.github.com/users/\(username)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: GitHubUser.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    .receive(on: RunLoop.main)
    .sink { ... } receiveValue: { ... }
```

---

## 🧩 What You Learn From This Project

✔ Reactive search flow  
✔ Debouncing user input  
✔ FlatMap + decoding JSON  
✔ Error handling in pipelines  
✔ Binding Combine → SwiftUI  
✔ Clean MVVM separation  
✔ Real Apple-grade architecture

---

## 🏅 Achievement

This app marks the completion of:

**🔥 21-Day Combine Mastery Program 🔥**

**Developer:** Sajan Mahla  
**Goal:** God-level iOS → Apple Cupertino 🍎

---

## 💡 Future Upgrades

- ⭐ Add follower graph
- ⭐ Add pinned repos
- ⭐ Add dark mode custom UI
- ⭐ Add caching for repeated searches
- ⭐ Add Combine retry/backoff strategies

---

## ❤️ Built With

`SwiftUI` • `Combine` • `Focus` • `Consistency` • `Discipline`  
And a dream to work at Apple Park 🍎✨

---

## 👨‍💻 Author

**Sajan Mahla**  
iOS Developer • Combine Master • Future Apple Engineer

🚀 GitHub: [https://github.com/Sajan-Mahla]

---

**⭐ Star this repo if you learned something!**
