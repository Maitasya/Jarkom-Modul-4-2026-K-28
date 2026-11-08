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

    kalau mau langsung pakek script semua node di cek  pakek *ping.sh*

    caranya :
    ```
    chmod +x ping.sh
    ./ping.sh
    ```

### Kesimpulan

Berdasarkan praktikum yang telah dilakukan, berhasil dibuat pembagian 25 subnet menggunakan metode VLSM dengan network utama `192.225.0.0/19`. Selanjutnya dilakukan konfigurasi IP address, static routing, dan IP forwarding. Pengujian koneksi dilakukan untuk memeriksa komunikasi antar-router maupun antar-host.



---

### Cisco Packet Tracer (CPT) – CIDR (Classless Inter-Domain Routing)

Pada pengerjaan di Cisco Packet Tracer (CPT), metode perhitungan yang digunakan adalah **CIDR (Classless Inter-Domain Routing)** dengan penggabungan subnet (*supernetting / route aggregation*) berbasis pohon hierarki (*tree*).

---

<img width="1100" height="677" alt="image" src="https://github.com/user-attachments/assets/99bbe849-323b-4138-b43f-b654ba47c5af" />


## 1. Pendahuluan

Pada Layer 04, jaringan The Wired dibangun ulang dalam skala besar. Hanya router **Cyberia** yang terhubung ke dunia luar (Cloud). Tugasnya adalah membagi alamat IP seefisien mungkin dan menyusun routing sehingga seluruh node saling terhubung.

- Topologi: 13 router, 13 switch, 25 subnet
- Metode di CPT: **CIDR** (penggabungan subnet bottom-up)
- Prefix IP: `192.225.0.0`
- Blok induk hasil perhitungan: `192.225.0.0/19`

---

## 2. Perhitungan Jumlah IP dan Netmask

Aturan perhitungan:
- Jumlah IP = jumlah host + jumlah interface router di subnet tersebut (switch tidak dihitung)
- Prefix dipilih dari prefix terbesar yang memenuhi `2^n - 2 >= jumlah IP`

<img width="815" height="648" alt="image" src="https://github.com/user-attachments/assets/8c88cb93-a510-4636-82d8-75b94a589730" />

---

## 3. Penggabungan Subnet (Konsep CIDR)

Pada CIDR, subnet digabung dari bawah ke atas. Dua subnet dapat digabung jika:
1. Alamatnya bersebelahan
2. Awalnya rata (network subnet pertama kelipatan ukuran blok gabungan)
3. Prefix turun 1 bit tiap penggabungan

Jika dua subnet berbeda ukuran (C4 dan F2), dipilih blok pangkat dua terkecil yang rata dan memuat keduanya. Selisih ukuran menyisakan ruang kosong.

<img width="703" height="751" alt="image" src="https://github.com/user-attachments/assets/2147e058-a05f-4c8c-8b96-24dceb44150c" />

---

## 4. Pohon Pembagian IP (Tree)

Tree dibaca dari bawah ke atas. Daun adalah subnet A1 - A25, lalu digabung menjadi B, C, D, E, F, G, dan puncaknya H1 (`192.225.0.0/19`).

<img width="772" height="425" alt="image" src="https://github.com/user-attachments/assets/f2ef2634-c467-4cf0-ae63-764076ee2cc3" />


---

## 5. Tabel Pembagian IP

<img width="791" height="527" alt="image" src="https://github.com/user-attachments/assets/7327641f-fabb-4d76-8fc8-e9f8fd11b44b" />

---

## 6. Pembuatan Topologi di Cisco Packet Tracer

### 6.1 Menambahkan device

Device yang dipakai: 13 router **2811**, 13 **Switch-PT**, 1 **Cloud-PT**, serta Server-PT, Laptop-PT, dan PC-PT sesuai gambar topologi. Setiap device diberi nama sesuai soal.

### 6.2 Menambah modul router

Router 2811 hanya punya 2 port bawaan. Router yang membutuhkan 3 atau 4 port ditambah modul **NM-2FE2W** (power dimatikan dulu, modul dipasang, lalu power dinyalakan kembali). Router yang dipasangi modul: Wired, Navi, Cyberia, Copland, Schumann, Tachibana, Deus, Protocol7, Knights, Phantoma.

### 6.3 Memasang kabel

- Router ke router dan router ke end device langsung: **Copper Cross-Over**
- Router ke switch dan switch ke end device: **Copper Straight-Through**
- Cloud ke Cyberia: **Copper Straight-Through**

---

## 7. Konfigurasi IP pada Router

IP interface router diberikan sesuai tabel pembagian IP. Router yang lebih dekat ke Cyberia/Wired mendapat IP pertama pada link point-to-point.

| Router | Tujuan | IP | Netmask |
|---|---|---|---|
| Cyberia | Switch1 | 192.225.14.1 | 255.255.255.128 |
| | Wired | 192.225.16.57 | 255.255.255.252 |
| Wired | Cyberia | 192.225.16.58 | 255.255.255.252 |
| | Switch2 | 192.225.16.33 | 255.255.255.248 |
| | Tachibana | 192.225.16.65 | 255.255.255.252 |
| | Navi | 192.225.16.69 | 255.255.255.252 |
| Psyche | Switch2 | 192.225.16.34 | 255.255.255.248 |
| | Switch3 | 192.225.0.1 | 255.255.252.0 |
| Copland | Switch2 | 192.225.16.35 | 255.255.255.248 |
| | Juri | 192.225.15.193 | 255.255.255.192 |
| | Switch4 | 192.225.8.1 | 255.255.254.0 |
| Schumann | Switch2 | 192.225.16.36 | 255.255.255.248 |
| | Akashic | 192.225.16.41 | 255.255.255.248 |
| | Accela | 192.225.16.61 | 255.255.255.252 |
| Accela | Schumann | 192.225.16.62 | 255.255.255.252 |
| | Switch5 | 192.225.4.1 | 255.255.252.0 |
| Navi | Wired | 192.225.16.70 | 255.255.255.252 |
| | Switch6 | 192.225.12.1 | 255.255.255.0 |
| | Switch7 | 192.225.15.65 | 255.255.255.192 |
| | Switch8 | 192.225.13.1 | 255.255.255.0 |
| Tachibana | Wired | 192.225.16.66 | 255.255.255.252 |
| | Switch9 | 192.225.10.1 | 255.255.254.0 |
| | Deus | 192.225.16.73 | 255.255.255.252 |
| Deus | Tachibana | 192.225.16.74 | 255.255.255.252 |
| | Switch10 | 192.225.14.129 | 255.255.255.128 |
| | Protocol7 | 192.225.16.77 | 255.255.255.252 |
| Protocol7 | Deus | 192.225.16.78 | 255.255.255.252 |
| | Switch11 | 192.225.15.129 | 255.255.255.192 |
| | Knights | 192.225.16.81 | 255.255.255.252 |
| Knights | Protocol7 | 192.225.16.82 | 255.255.255.252 |
| | Eiri | 192.225.16.49 | 255.255.255.248 |
| | Phantoma | 192.225.16.85 | 255.255.255.252 |
| Phantoma | Knights | 192.225.16.86 | 255.255.255.252 |
| | Switch12 | 192.225.16.1 | 255.255.255.224 |
| | Shibuya | 192.225.16.89 | 255.255.255.252 |
| Shibuya | Phantoma | 192.225.16.90 | 255.255.255.252 |
| | Switch13 | 192.225.15.1 | 255.255.255.192 |

Contoh konfigurasi (Cyberia):

```
enable
configure terminal
interface fastEthernet0/1
 ip address 192.225.14.1 255.255.255.128
 no shutdown
interface fastEthernet1/0
 ip address 192.225.16.57 255.255.255.252
 no shutdown
end
write memory
```

Verifikasi dengan `show ip interface brief`:

---

## 8. Konfigurasi IP pada End Device

Setiap end device dikonfigurasi pada **Desktop > IP Configuration** (Static). IP berada dalam subnet yang sama dengan gateway-nya (IP interface router di segmen itu).

| Node | IP | Netmask | Gateway |
|---|---|---|---|
| JJ, MyuMyu | 192.225.14.2, 192.225.14.3 | 255.255.255.128 | 192.225.14.1 |
| Karl, Lin | 192.225.0.2, 192.225.0.3 | 255.255.252.0 | 192.225.0.1 |
| Juri | 192.225.15.194 | 255.255.255.192 | 192.225.15.193 |
| Masayuki | 192.225.8.2 | 255.255.254.0 | 192.225.8.1 |
| Akashic | 192.225.16.42 | 255.255.255.248 | 192.225.16.41 |
| Omnipresence, Denpa | 192.225.4.2, 192.225.4.3 | 255.255.252.0 | 192.225.4.1 |
| Alice, Reika | 192.225.12.2, 192.225.12.3 | 255.255.255.0 | 192.225.12.1 |
| Taro | 192.225.15.66 | 255.255.255.192 | 192.225.15.65 |
| Yasuo, Miho, Kuma | 192.225.13.2, .3, .4 | 255.255.255.0 | 192.225.13.1 |
| Collective, Ghost | 192.225.10.2, 192.225.10.3 | 255.255.254.0 | 192.225.10.1 |
| Lilith, Specter | 192.225.14.130, 192.225.14.131 | 255.255.255.128 | 192.225.14.129 |
| Chisa, Hodgeson | 192.225.15.130, 192.225.15.131 | 255.255.255.192 | 192.225.15.129 |
| Eiri | 192.225.16.50 | 255.255.255.248 | 192.225.16.49 |
| Semi | 192.225.16.2 | 255.255.255.224 | 192.225.16.1 |
| Lain, Mika | 192.225.15.2, 192.225.15.3 | 255.255.255.192 | 192.225.15.1 |


---

## 9. Konfigurasi Routing (Static Route)

Strategi routing: router pinggir memakai **default route ke parent**, router yang memiliki cabang diberi **route ke child**, dan subnet diringkas (summary) bila memungkinkan.

### 9.1 Cyberia

Route summary ke seluruh blok di balik Wired:

```
enable
configure terminal
ip route 192.225.0.0 255.255.224.0 192.225.16.58
end
write memory
```

<img width="607" height="352" alt="image" src="https://github.com/user-attachments/assets/edc212d3-3018-4b22-a7ba-4944f190c006" />


### 9.2 Wired

```
enable
configure terminal
ip route 0.0.0.0 0.0.0.0 192.225.16.57
ip route 192.225.0.0 255.255.252.0 192.225.16.34
ip route 192.225.8.0 255.255.254.0 192.225.16.35
ip route 192.225.15.192 255.255.255.192 192.225.16.35
ip route 192.225.4.0 255.255.252.0 192.225.16.36
ip route 192.225.16.40 255.255.255.248 192.225.16.36
ip route 192.225.16.60 255.255.255.252 192.225.16.36
ip route 192.225.12.0 255.255.254.0 192.225.16.70
ip route 192.225.15.64 255.255.255.192 192.225.16.70
ip route 192.225.10.0 255.255.254.0 192.225.16.66
ip route 192.225.14.128 255.255.255.128 192.225.16.66
ip route 192.225.15.0 255.255.255.192 192.225.16.66
ip route 192.225.15.128 255.255.255.192 192.225.16.66
ip route 192.225.16.0 255.255.255.224 192.225.16.66
ip route 192.225.16.48 255.255.255.248 192.225.16.66
ip route 192.225.16.72 255.255.255.248 192.225.16.66
ip route 192.225.16.80 255.255.255.240 192.225.16.66
end
write memory
```

<img width="647" height="592" alt="image" src="https://github.com/user-attachments/assets/bbed98f0-90b7-409f-8bca-888ae54e27db" />


### 9.3 Tachibana

```
enable
configure terminal
ip route 0.0.0.0 0.0.0.0 192.225.16.65
ip route 192.225.14.128 255.255.255.128 192.225.16.74
ip route 192.225.15.0 255.255.255.192 192.225.16.74
ip route 192.225.15.128 255.255.255.192 192.225.16.74
ip route 192.225.16.0 255.255.255.224 192.225.16.74
ip route 192.225.16.48 255.255.255.248 192.225.16.74
ip route 192.225.16.76 255.255.255.252 192.225.16.74
ip route 192.225.16.80 255.255.255.240 192.225.16.74
end
write memory
```
<img width="646" height="438" alt="image" src="https://github.com/user-attachments/assets/42564b57-67f9-4755-9352-ad3f94e267ee" />

### 9.4 Router lainnya

Router lain memakai default route ke parent, dan route ke child bila memiliki cabang.

| Router | Default route (via) | Route ke child |
|---|---|---|
| Psyche | 192.225.16.33 | Copland, Schumann, Accela |
| Copland | 192.225.16.33 | Psyche, Accela |
| Schumann | 192.225.16.33 | Psyche, Copland, Accela |
| Accela | 192.225.16.61 | - |
| Navi | 192.225.16.69 | - |
| Deus | 192.225.16.73 | Protocol7 sampai Shibuya |
| Protocol7 | 192.225.16.77 | Knights sampai Shibuya |
| Knights | 192.225.16.81 | Phantoma, Shibuya |
| Phantoma | 192.225.16.85 | Subnet Shibuya |
| Shibuya | 192.225.16.89 | - |

---

## 10. Pengujian Konektivitas

### 10.1 Ping router ke router

| Dari | Ke | Hasil |
|---|---|---|
| Wired | Accela (192.225.16.62) | Berhasil |
| Wired | Protocol7 (192.225.16.78) | Berhasil |
| Wired | Shibuya (192.225.16.90) | Berhasil |
| Cyberia | Shibuya (192.225.16.90) | Berhasil |
| Psyche | Protocol7 (192.225.16.78) | Berhasil |
| Protocol7 | Psyche (192.225.16.34) | Berhasil |

<img width="570" height="126" alt="image" src="https://github.com/user-attachments/assets/7a1a8996-0822-4f6e-8c77-b254b5609507" />
<img width="562" height="125" alt="image" src="https://github.com/user-attachments/assets/72d9f356-9d07-4903-aa00-b7ffd1b5483c" />
<img width="565" height="130" alt="image" src="https://github.com/user-attachments/assets/0f927ffd-7598-47f8-a1ec-5aeae3140c07" />
<img width="565" height="123" alt="image" src="https://github.com/user-attachments/assets/d743e0e1-e652-4532-bf21-8d0f3ecafe28" />
<img width="563" height="120" alt="image" src="https://github.com/user-attachments/assets/9c6948f2-8acd-4510-a446-2b33c7cf269d" />
<img width="556" height="128" alt="image" src="https://github.com/user-attachments/assets/4e8d5487-bdf1-4b64-9b70-4860b2db3288" />

### 10.2 Ping PC ke PC

| Dari | Ke | Hasil |
|---|---|---|
| Lain | JJ (192.225.14.2) | Berhasil |
| JJ | Lain (192.225.15.2) | Berhasil |
| Omnipresence | Mika (192.225.15.3) | Berhasil |
| Mika | Omnipresence (192.225.4.2) | Berhasil |

<img width="452" height="240" alt="image" src="https://github.com/user-attachments/assets/0b4348a1-26b3-4f50-a09d-b41d681e7326" />
<img width="460" height="252" alt="image" src="https://github.com/user-attachments/assets/af1f0eb4-6915-46c9-a6e6-1f04eac3c664" />
<img width="450" height="220" alt="image" src="https://github.com/user-attachments/assets/b45be59f-0e16-4a89-8ac0-d8abd3393989" />
<img width="457" height="230" alt="image" src="https://github.com/user-attachments/assets/66cf42ec-0508-46d2-8252-28d2cafa63c9" />


### 10.3 Ping PC ke router

| Dari | Ke | Hasil |
|---|---|---|
| Karl | Shibuya (192.225.16.90) | Berhasil |
| Shibuya | Karl (192.225.0.2) | Berhasil |
| Yasuo | Phantoma (192.225.16.86) | Berhasil |
| Phantoma | Yasuo (192.225.13.2) | Berhasil |

<img width="458" height="196" alt="image" src="https://github.com/user-attachments/assets/c405f340-bb4e-4f0c-a8e4-a50e42c96fd1" />
<img width="560" height="125" alt="image" src="https://github.com/user-attachments/assets/06327443-f80a-4915-a75b-af5ad9e21849" />
<img width="451" height="207" alt="image" src="https://github.com/user-attachments/assets/e429ce5e-4943-49f0-9135-207f7d6b0347" />
<img width="562" height="112" alt="image" src="https://github.com/user-attachments/assets/5d3866b3-9c8a-4d7a-a945-f9b8f8ed457e" />


### 10.5 Koneksi ke luar (Cloud)

Router Cyberia adalah satu-satunya yang terhubung ke Cloud. Di Cisco Packet Tracer, Cloud-PT tidak terhubung ke internet sebenarnya, sehingga `ping 8.8.8.8` dari Lain tidak berhasil. Pengujian koneksi ke luar yang sesungguhnya dilakukan pada bagian GNS3 melalui NAT.

<img width="481" height="180" alt="image" src="https://github.com/user-attachments/assets/9132af10-b835-4159-81ad-02157f00401e" />

---

## 11. Kendala dan Solusi

| Kendala | Solusi |
|---|---|
| Menu port router hanya menampilkan Console dan Auxiliary | Router belum dinyalakan setelah pemasangan modul, atau modul NM-2FE2W belum terpasang. Power dimatikan, modul dipasang, lalu dinyalakan kembali |
| Nomor port yang muncul berbeda dari rencana | Port yang dipakai dicatat dengan hover pada kabel, lalu IP dipasang sesuai tujuan kabel |
| Ping gagal karena IP end device salah | IP, netmask, dan gateway tiap end device dicocokkan ulang dengan subnet router |
| Route statis hilang pada Cyberia dan Wired | Konfigurasi dimasukkan ulang, lalu project disimpan dengan `Ctrl+S` |
| IP interface Accela salah | IP diperbaiki menjadi 192.225.16.62/30 |

---

## 12. Kesimpulan

- Seluruh 25 subnet dapat digabung menjadi satu blok induk `192.225.0.0/19` dengan metode CIDR.
- Pembagian IP efisien, tanpa tumpang tindih, dengan ruang kosong hanya di dua tempat.
- Routing memakai default route ke parent dan route summary ke child.
- Seluruh node pada topologi Cisco Packet Tracer dapat saling terhubung.
