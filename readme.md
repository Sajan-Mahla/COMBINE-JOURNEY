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
| 7 | Project: Number Streamer | ⏳ Next Up |

---

## 🧩 Code Showcase

```swift
import Combine

enum NetworkError: Error {
    case offline
}

let successPublisher = [10, 20, 30].publisher
let failPublisher = Fail<Int, NetworkError>(error: .offline)

let cancellable = successPublisher
    .setFailureType(to: NetworkError.self) // unify error types
    .merge(with: failPublisher)
    .sink(receiveCompletion: { print("Completion: \($0)") },
          receiveValue: { print("Value: \($0)") })


```

---

## 💡 Takeaway of Day 05

**Combine = Publisher → Operator → Subscriber**  

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
