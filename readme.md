# 🍏 Combine 21-Day Bootcamp

**Reactive Thinking + Swift Mastery Series**  
Built by **Sajan Mahla** — Goal: Understand and master Apple's Combine framework from the ground up.

---

## 🧠 Mission

To build a rock-solid understanding of data flow in Combine and apply it to real-world SwiftUI + backend apps before joining **Apple Cupertino**.

---

## 📅 Bootcamp Structure

| Week | Focus | Key Concepts | Outcome |
|------|-------|--------------|---------|
| **1** | Core Concepts & Reactive Thinking | Publisher, Subscriber, Operators | Build simple reactive chains |
| **2** | Async + Networking Mastery | URLSession + Threading + Subjects | Create live data pipelines |
| **3** | Combine + SwiftUI Fusion | ViewModel integration, error handling, testing | Full-fledged Combine app |

---

## ✅ Progress Tracker

| Day | Topic | Status |
|-----|-------|--------|
| 1 | Publisher & Subscriber Basics | ✅ Completed |
| 2 | Just, Future, sink() Basics | ✅ Completed |
| 3 | AnyCancellable & Memory Handling | ✅ Completed |
| 4 | Basic Operators (map, filter, compactMap) | ✅ Completed|
| 5 | Error Types (Never vs Failure) | ✅ Completed |
| 6 | Chain Building | ✅ Completed |
| 7 | Project: Number Streamer | ✅ Completed  |
| 8 | URLSession.dataTaskPublisher | ✅ Completed  |
| 9 | Threading: .subscribe(on:) & .receive(on:) | ✅ Completed  |
| 10 | Error handling: catch, replaceError, tryMap | ✅ Completed  |
| 11 | CombineLatest / Merge / Zip | ✅ Completed  |
| 12 | PassthroughSubject vs CurrentValueSubject | ✅ Completed  |
| 13 | Time based Operators | ✅ Completed  |
| 14 | COMBINE exclusive app | ✅ Completed  |
| 15 | @Published + ObservableObject | ✅ Completed  |
| 16 | assigns(to: on)| ✅ Completed  |

---

## 🧩 Code Showcase

```swift

import Combine

class userViewModel : ObservableObject{
    @Published var name: String = ""
    @Published var age: Int = 0
    
    var cancellable = Set<AnyCancellable>()
    
    init(){
        setBindings()
    }
    
    private func setBindings(){
        $name
            .sink{
                newValue in
                print("Name Updated -> \(newValue)")
            }
            .store(in: &cancellable)
        
        $age
            .map {
                $0 >= 18 ? "Adult" : "Minor"
            }
            .sink{
                status in
                print("Status -> \(status)")
            }
            .store(in: &cancellable)
    }
}

let vm = userViewModel()

vm.name = "Sajan Mahla"
vm.age = 17

vm.age = 20
vm.name = "Steve"




```

---

## 💡 Takeaway of Day 14

 It's not just code; it's **data reacting in motion**.

---

## 🚀 Goal

To reach **Apple Cupertino** as a world-class iOS engineer who masters data flow like a true pro.

---

## 📝 License

This is a personal learning project by Sajan Mahla.

---

## 🤝 Connect

Building in public. Follow the journey!

---

**"From reactive thinking to reactive mastery."** 🔥
