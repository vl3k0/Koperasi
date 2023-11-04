# Database Koperasi

### Nyalakan MariaDB:
```shell
# Linux
sudo systemctl start mariadb

# Windows gak perlu nyalakan 
```

### Masuk ke mariadb CLI dan buat database:
```shell
# Linux
mariadb -u root
```

```powershell
# Windows, di MariaDB 10.x itu x nya berarti versi nya,
# pastikan sama dengan versi di komputermu
cd C:\Program Files\MariaDB\MariaDB 10.x\bin

# masuk ke mariadb cli
mariadb -u root
```

```sql
CREATE DATABASE Koperasi;
```

### Buat user baru
```shell
# Buat user dan password
CREATE USER 'namamu'@'localhost' IDENTIFIED BY 'password123';
```

### Beri user baru akses ke database
```sql
-- Pastikan nama user dan password yang tadi dibuat itu sesuai
GRANT ALL PRIVILEGES ON Koperasi.* TO 'namamu'@'localhost' IDENTIFIED BY 'password123';

-- Ini biar perubahan tersimpan tanpa restart mariadb
FLUSH PRIVILEGES;

-- Keluar
exit;
```

### Import data ke database yang tadi
```shell
# Saat melakukan ini, anda diminta menginput password yang tadi dibuat
# Pastikan anda tahu dimana letak file Data_Backup.sql (masa gk tau filesystem route)
mariadb -u namamu -p Koperasi < ./path/to/file/Data_Backup.sql
```

### Input manual table ke database
Bila belum puas dengan mengimport saja table-table itu, anda bisa menginput manual table yang sudah ada di folder **Table**. Contoh kalau mau menambah table **Jenis_Transaksi**, anda bisa membuka file nya di **Tables/Jenis_Transaksi.sql** lalu copy syntax SQL nya ke mariadb.

```sql
-- Paste syntax berikut ke mariadb
-- Pastikan sudah masuk ke akun mariadb yang sudah dibuat tadi
CREATE TABLE `Jenis_Transaksi` (
  `id_jns_transaksi` varchar(50) NOT NULL,
  `Nama_Transaksi` varchar(255) NOT NULL,
  PRIMARY KEY (`id_jns_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci
```