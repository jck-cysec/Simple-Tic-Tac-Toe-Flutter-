![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter\&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart\&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-4CAF50?logo=android\&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-black)
![Status](https://img.shields.io/badge/Project-Portfolio-success)

# Tic Tac Toe (Flutter)

Aplikasi **Tic Tac Toe** sederhana yang dikembangkan menggunakan **Flutter**. Project ini dirancang sebagai latihan pengembangan game mobile berbasis Flutter dengan struktur kode yang terpisah, mudah dipahami, dan siap dikembangkan lebih lanjut (audio, score, UI enhancement, dll).

---

## 📱 Fitur Utama

* Permainan Tic Tac Toe (2 Player)
* Tampilan UI sederhana dan responsif
* Validasi langkah pemain
* Deteksi pemenang dan kondisi draw
* Tampilan hasil permainan
* Riwayat skor permainan
* Aturan permainan terpisah dalam modul tersendiri

---

## 🗂️ Struktur Project

Berdasarkan struktur folder pada project:

```
lib/
├── widgets/
│   ├── displayResult.dart
│   ├── displayScores.dart
│   ├── gameRules.dart
│   ├── tic_tac_toe_screen.dart
│   └── main.dart
```

### Penjelasan File

* **main.dart**
  Entry point aplikasi Flutter. Mengatur `MaterialApp`, tema, dan halaman utama.

* **tic_tac_toe_screen.dart**
  Layar utama permainan Tic Tac Toe. Berisi logika permainan dan interaksi pemain.

* **gameRules.dart**
  Modul yang menangani aturan permainan seperti pengecekan pemenang dan kondisi draw.

* **displayResult.dart**
  Widget untuk menampilkan hasil permainan (menang / kalah / seri).

* **displayScores.dart**
  Widget untuk menampilkan skor atau riwayat hasil permainan.

---

## 🖼️ Screenshot Aplikasi

### Tampilan Game

> Berikut adalah tampilan utama permainan Tic Tac Toe pada aplikasi ini:

<p align="center">
  <img src="screenshots/tic_tac_toe_game.png" alt="Tampilan Game Tic Tac Toe" width="300" />
</p>

---

## 🚀 Cara Menjalankan Project

1. Pastikan Flutter sudah terinstall

   ```bash
   flutter --version
   ```

2. Clone repository

   ```bash
   git clone https://github.com/username/tic_tac_toe.git
   cd tic_tac_toe
   ```

3. Install dependencies

   ```bash
   flutter pub get
   ```

4. Jalankan aplikasi

   ```bash
   flutter run
   ```

---

## 🛠️ Teknologi yang Digunakan

* **Flutter**
* **Dart**
* Material Design

---

## 📌 Catatan Pengembangan

Project ini masih dapat dikembangkan lebih lanjut, seperti:

* Penambahan background music & sound effect
* Mode Player vs AI
* Penyimpanan skor menggunakan database
* Animasi transisi dan efek visual
* Mode online multiplayer

---

## 📄 Lisensi

Project ini dibuat untuk keperluan pembelajaran dan bebas digunakan untuk pengembangan lebih lanjut.

---

**Happy Coding 🚀**
