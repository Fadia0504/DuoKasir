# Anggota
1. Fadia Nurcholifah 
2. Dinda Putri Soleha

## 1. Business Rule

| Kode  | Aturan |
|-------|--------|
| BR-01 | Belanja minimal Rp100.000 mendapat diskon 10%. |
| BR-02 | Member mendapat tambahan diskon 5% (hanya jika BR-01 terpenuhi). |
| BR-03 | Total potongan maksimal Rp25.000. |

## 2. Decomposition

```
hitungTotalBayar
  ├── hitungPersenDiskon  → tentukan persen diskon            (BR-01, BR-02)
  ├── hitungPotongan      → hitung potongan, maksimal 25.000  (BR-03)
  └── totalBelanja - potongan → total yang harus dibayar
```

## 3. Flowchart

```
                 START
                   |
                   v
      Input totalBelanja, member
                   |
                   v
      ┌──────────────────────────┐  Tidak
      │ totalBelanja >= 100000?  │─────────> persen = 0 ─────────┐
      └──────────────────────────┘                               |
                   | Ya                                          |
                   v                                             |
              ┌──────────┐  Tidak                                |
              │ member? │─────────────> persen = 10 ────────────┤
              └──────────┘                                       |
                   | Ya                                          |
                   v                                             |
             persen = 15 ────────────────────────────────────────┤
                                                                 |
      potongan = persen * totalBelanja         <─────────────────┘
                   |
                   v
      ┌──────────────────────┐  Ya
      │ potongan >= 25000?   │─────────> potongan = 25000 ───────┐
      └──────────────────────┘                                   |
                   | Tidak                                       |
                   v                                             |
      totalBayar = totalBelanja - potongan  <────────────────────┘
                   |
                   v
           Tampilkan totalBayar
                   |
                   v
                  END
```

## 4. Skenario Uji

| No | Total Belanja | Member | Expected Total Bayar |
|----|---------------|--------|----------------------|
| 1  | Rp80.000      | Tidak  | Rp80.000 |
| 2  | Rp150.000     | Tidak  | Rp135.000 |
| 3  | Rp150.000     | Ya     | Rp127.500 |
| 4  | Rp300.000     | Ya     | Rp275.000 (potongan dibatasi Rp25.000) |