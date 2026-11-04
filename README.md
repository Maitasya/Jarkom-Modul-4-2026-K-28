# Jarkom-Modul-4-2026-K-28
 ---
## Kelompok K-28

| Nama | NRP |
| :---: | :---: |
| Maitasya Rohmatul Ula | 5027251026 |
| A. Algifari Rantiga Isdar | 5027251084 |

---
Laporan

[LINK SPREADSHEET]

https://docs.google.com/spreadsheets/d/1kFEHDruR02-eszw0coIqQ5S9SRrWQ9jt/edit?gid=668533367#gid=668533367
---

### GNS3 – VLSM (Variable Length Subnet Mask)


1. **Berikut topologi yang dibuat untuk GNS3.**

   <img width="1920" height="1032" alt="topologi_subnet" src="https://github.com/user-attachments/assets/1dcd2931-7dee-4885-be8a-dfc39a7c4b48" />


   Setelah dilakukan analisis terhadap topologi tersebut, dapat disimpulkan terdapat sebanyak **25 subnet** yang perlu dibuat.

2. **Total penggunaan subnet.**

   Total subnet yang digunakan adalah **25 subnet**, dengan network utama `192.225.0.0/19`. Pembagian subnet dilakukan menggunakan metode VLSM berdasarkan kebutuhan jumlah host pada setiap jaringan.

   Langkah-langkah subnetting VLSM:
   - Mengidentifikasi jumlah kebutuhan host pada setiap subnet.
   - Mengurutkan subnet berdasarkan kebutuhan host dari terbesar hingga terkecil.
   - Menentukan prefix dan subnet mask sesuai kebutuhan host.
   - Membagi alamat IP mulai dari subnet dengan kebutuhan host terbesar.
   - Menentukan Network ID, broadcast, dan rentang IP yang dapat digunakan.
   - Memastikan seluruh subnet tidak saling bertabrakan.

   Untuk hasil pembagian subnet secara lengkap dapat dilihat pada spreadsheet yang telah disediakan di atas.

   Berikut adalah hasil **VLSM Tree** yang telah dibuat:

   <img width="4300" height="2000" alt="pohon_vlsm_dark" src="https://github.com/user-attachments/assets/81706f05-7b35-4e8f-8585-99ed94c36723" />

3. **Konfigurasi IP Address Router.**

   Setelah pembagian subnet selesai, setiap interface router dikonfigurasi menggunakan alamat IP sesuai hasil perhitungan VLSM.

   Bukti 1 — Konfigurasi IP

   <img width="960" height="516" alt="Bukti 1 — Konfigurasi IP" src="https://github.com/user-attachments/assets/3bc95b08-a0c7-4a92-a9b4-aab6c132a3eb" />

5. **Static Routing.**

   Pada praktikum ini dilakukan konfigurasi static routing pada setiap router agar dapat menentukan jalur menuju subnet lainnya. Jalur routing ditentukan berdasarkan topologi dan next-hop dari setiap jaringan tujuan.

   Berikut merupakan routing table pada router Wired:

  Bukti 2 — Routing table
  
  <img width="960" height="516" alt="Bukti 2 — Routing table" src="https://github.com/user-attachments/assets/d72a7c1e-3c63-48d2-a8b9-b5e4d678b29f" />

6. **Mengaktifkan IP Forwarding.**

   IP forwarding diaktifkan agar router dapat meneruskan paket data dari satu interface ke interface lainnya.

   Bukti 3 — IP forwarding

   <img width="960" height="516" alt="Bukti 3 — IP forwarding" src="https://github.com/user-attachments/assets/8501232a-40a8-4c3d-afdc-16268506497d" />

8. **Pengujian koneksi antar-router.**

   Pengujian dilakukan menggunakan perintah `ping` untuk memastikan setiap router dapat saling terhubung.

   Bukti 4 — Koneksi antar-router
  
  <img width="960" height="516" alt="Bukti 4 — Koneksi antar-router" src="https://github.com/user-attachments/assets/54b559e6-20fe-42f0-89f2-e0c52053bd5d" />

9. **Konfigurasi IP Address Host.**

   Setiap host diberikan alamat IP sesuai dengan subnet yang telah ditentukan.

   Bukti 5 — Konfigurasi IP host

  <img width="960" height="516" alt="Bukti 5 — Konfigurasi IP host" src="https://github.com/user-attachments/assets/75fbc825-9977-478b-a802-09544f0fc8b2" />

10. **Konfigurasi Default Gateway.**

   Setiap host menggunakan default gateway yang mengarah ke alamat interface router pada subnet yang sama.

   Bukti 6 — Default gateway
   
   <img width="960" height="516" alt="Bukti 6 — Default gateway" src="https://github.com/user-attachments/assets/55fdeb7a-b8db-4417-b153-009c4d7774d9" />

11. **Pengujian koneksi host ke gateway.**

   Pengujian dilakukan dengan melakukan ping dari host menuju default gateway untuk memastikan koneksi ke router berjalan dengan baik.

   Bukti 7 — Koneksi host ke gateway

   <img width="960" height="516" alt="Bukti 7 — Koneksi host ke gateway" src="https://github.com/user-attachments/assets/6097c4d8-2daf-483b-a9ca-d582c1b55152" />

11. **Pengujian koneksi antar-host dalam satu LAN.**

    Pengujian dilakukan untuk memastikan host yang berada dalam satu subnet dapat saling berkomunikasi.

    Bukti 8 — Koneksi antar-host satu LAN
    
    <img width="960" height="516" alt="Bukti 8 — Koneksi antar-host satu LAN" src="https://github.com/user-attachments/assets/70baa761-2357-44a0-9011-1e585d2bdecd" />

13. **Pengujian koneksi antarjaringan.**

    Pengujian dilakukan dengan melakukan ping dari host menuju host yang berada pada subnet berbeda untuk memastikan konfigurasi routing berjalan dengan baik.

    Bukti 9 — Koneksi antarjaringan
    
    <img width="960" height="516" alt="Bukti 9 — Koneksi antarjaringan" src="https://github.com/user-attachments/assets/1275e2e3-8c8f-40ac-8533-5e12c6024a41" />


### Kesimpulan

Berdasarkan praktikum yang telah dilakukan, berhasil dibuat pembagian 25 subnet menggunakan metode VLSM dengan network utama `192.225.0.0/19`. Selanjutnya dilakukan konfigurasi IP address, static routing, dan IP forwarding. Pengujian koneksi dilakukan untuk memeriksa komunikasi antar-router maupun antar-host.
