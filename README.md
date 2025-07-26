# 💰 Money Tracker Flutter App

## 📱 Overview
**Money Tracker** is a simple and user-friendly Flutter app that helps users **set a savings target** and **track income** against that target. The app automatically subtracts added income from the target and displays the **remaining amount**, along with a complete **history of transactions** including date and time.

All user data is stored securely using **Firebase Firestore**.

---

## ✅ Features
- 🎯 **Set Target** — Define how much money you want to save.
- 💵 **Add Income** — Record any amount of income received.
- ➖ **Auto-Subtract** — Income is subtracted from the target automatically.
- 📊 **Remaining Balance** — See how much is left to reach your savings goal.
- 🕓 **Income History** — Displays each income entry with:
  - Amount
  - Date & Time
  - Remaining target

---

## 🔥 Firebase Integration
This app uses **Firebase Firestore** to:
- Store target, income, and remaining amounts
- Save income history with timestamps
- Retrieve real-time data for each session

**Note:** No Firebase Auth is used; data is stored for general use or a single user session.

---

## 🛠️ Tech Stack
- **Flutter** (Frontend)
- **Firebase Firestore** (Backend/Database)
- **GetX** (State Management)

![Alt Image](https://github.com/AbdulHadiKhan-Flutter-Developer/money-tracker/blob/6182653cea3e2ae5ff71224cfe6cf9822ebdfb72/moneytracker.png)
