import 'package:flutter/material.dart';

// PrivacySecurityScreen
class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({Key? key}) : super(key: key);

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool biometricEnabled = false;
  bool twoFactorEnabled = false;
  bool notificationsEnabled = true;
  bool dataSharing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Privasi & Keamanan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Security Section
            const Text(
              'Keamanan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _SettingsSwitchTile(
              icon: Icons.fingerprint,
              title: 'Login Biometrik',
              subtitle: 'Gunakan sidik jari atau Face ID untuk masuk',
              value: biometricEnabled,
              onChanged: (value) {
                setState(() {
                  biometricEnabled = value;
                });
                _showSnackBar(
                  'Login biometrik ${value ? 'diaktifkan' : 'dinonaktifkan'}',
                );
              },
            ),
            const Divider(height: 1),

            _SettingsSwitchTile(
              icon: Icons.security,
              title: 'Autentikasi Dua Faktor',
              subtitle: 'Tambahkan keamanan ekstra ke akun Anda',
              value: twoFactorEnabled,
              onChanged: (value) {
                setState(() {
                  twoFactorEnabled = value;
                });
                _showSnackBar(
                  'Autentikasi dua faktor ${value ? 'diaktifkan' : 'dinonaktifkan'}',
                );
              },
            ),
            const Divider(height: 1),

            _SettingsActionTile(
              icon: Icons.lock_outline,
              title: 'Ubah Kata Sandi',
              subtitle: 'Perbarui kata sandi akun Anda',
              onTap: () {
                _showChangePasswordDialog();
              },
            ),
            const SizedBox(height: 24),

            // Privacy Section
            const Text(
              'Privasi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _SettingsSwitchTile(
              icon: Icons.notifications_outlined,
              title: 'Notifikasi Push',
              subtitle: 'Terima pengingat janji temu',
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
                _showSnackBar(
                  'Notifikasi ${value ? 'diaktifkan' : 'dinonaktifkan'}',
                );
              },
            ),
            const Divider(height: 1),

            _SettingsSwitchTile(
              icon: Icons.share_outlined,
              title: 'Berbagi Data',
              subtitle: 'Bagikan data anonim untuk meningkatkan aplikasi',
              value: dataSharing,
              onChanged: (value) {
                setState(() {
                  dataSharing = value;
                });
                _showSnackBar('Berbagi data ${value ? 'diaktifkan' : 'dinonaktifkan'}');
              },
            ),
            const Divider(height: 1),

            _SettingsActionTile(
              icon: Icons.visibility_outlined,
              title: 'Visibilitas Profil',
              subtitle: 'Kontrol siapa yang dapat melihat profil Anda',
              onTap: () {
                _showVisibilityOptions();
              },
            ),
            const SizedBox(height: 24),

            // Data Management Section
            const Text(
              'Manajemen Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _SettingsActionTile(
              icon: Icons.download_outlined,
              title: 'Unduh Data Saya',
              subtitle: 'Dapatkan salinan data Anda',
              onTap: () {
                _showSnackBar('Menyiapkan unduhan data Anda...');
              },
            ),
            const Divider(height: 1),

            _SettingsActionTile(
              icon: Icons.delete_outline,
              title: 'Hapus Akun',
              subtitle: 'Hapus akun Anda secara permanen',
              titleColor: Colors.red,
              onTap: () {
                _showDeleteAccountDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.teal,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ubah Kata Sandi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Saat Ini',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Baru',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Kata Sandi Baru',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showSnackBar('Kata sandi berhasil diubah');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showVisibilityOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Visibilitas Profil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.public, color: Colors.teal),
              title: const Text('Publik'),
              subtitle: const Text('Semua orang dapat melihat profil Anda'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar('Visibilitas profil diatur ke Publik');
              },
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Colors.teal),
              title: const Text('Hanya Dokter'),
              subtitle: const Text('Hanya dokter yang dapat melihat profil Anda'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar('Visibilitas profil diatur ke Hanya Dokter');
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.teal),
              title: const Text('Privat'),
              subtitle: const Text('Hanya Anda yang dapat melihat profil Anda'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar('Visibilitas profil diatur ke Privat');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  size: 40,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hapus Akun?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Tindakan ini tidak dapat dibatalkan. Semua data Anda akan dihapus secara permanen.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], height: 1.4),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showSnackBar('Permintaan penghapusan akun telah dikirim');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Hapus'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsSwitchTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.teal, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.teal,
      ),
    );
  }
}

class _SettingsActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? titleColor;
  final VoidCallback onTap;

  const _SettingsActionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: titleColor != null
              ? titleColor!.withOpacity(0.1)
              : Colors.teal[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: titleColor ?? Colors.teal, size: 24),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: titleColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: onTap,
    );
  }
}
