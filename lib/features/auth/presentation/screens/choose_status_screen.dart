import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/theme/app_colors.dart';

// Choose Status Screen
// Based on Figma: Choise frame
// Shows: 'متلقي الخدمة' / 'مقدم الخدمة' selection with note about changing later
class ChooseStatusScreen extends StatefulWidget {
    const ChooseStatusScreen({super.key});

    @override
    State<ChooseStatusScreen> createState() => _ChooseStatusScreenState();
}

class _ChooseStatusScreenState extends State<ChooseStatusScreen> {
    String _selectedStatus = '';

    void _onContinue() {
          if (_selectedStatus.isNotEmpty) {
                  // TODO: API - save user status
                  context.go(AppRoutes.home);
          }
    }

    @override
    Widget build(BuildContext context) {
          return Scaffold(
                  backgroundColor: AppColors.background,
                  body: SafeArea(
                            child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24),
                                        child: Column(
                                                      children: [
                                                                      const Spacer(),
                                                                      _buildHeader(),
                                                                      const SizedBox(height: 48),
                                                                      _buildStatusOptions(),
                                                                      const SizedBox(height: 16),
                                                                      _buildNote(),
                                                                      const Spacer(),
                                                                      _buildButtons(),
                                                                      const SizedBox(height: 32),
                                                                    ],
                                                    ),
                                      ),
                          ),
                );
    }

    Widget _buildHeader() {
          return Column(
                  children: [
                            Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                                      color: AppColors.primary.withOpacity(0.1),
                                                      shape: BoxShape.circle,
                                                    ),
                                        child: const Icon(Icons.people_alt_outlined, size: 40, color: AppColors.primary),
                                      ),
                            const SizedBox(height: 16),
                            Text(
                                        'هل أنت متلقي أم مقدم للخدمة؟',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                      ),
                          ],
                );
    }

    Widget _buildStatusOptions() {
          return Column(
                  children: [
                            _buildStatusCard(
                                        status: 'متلقي الخدمة',
                                        description: 'أحتاج لخدمات متنوعة',
                                        icon: Icons.person_outline,
                                      ),
                            const SizedBox(height: 16),
                            _buildStatusCard(
                                        status: 'مقدم الخدمة',
                                        description: 'أقدم خدماتي للآخرين',
                                        icon: Icons.work_outline,
                                      ),
                          ],
                );
    }

    Widget _buildStatusCard({required String status, required String description, required IconData icon}) {
          final isSelected = _selectedStatus == status;
          return GestureDetector(
                  onTap: () => setState(() => _selectedStatus = status),
                  child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                        color: isSelected ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                                      color: isSelected ? AppColors.primary : AppColors.border,
                                                      width: isSelected ? 2 : 1,
                                                    ),
                                      ),
                            child: Row(
                                        children: [
                                                      Container(
                                                                      width: 48,
                                                                      height: 48,
                                                                      decoration: BoxDecoration(
                                                                                        color: isSelected ? AppColors.primary : AppColors.border.withOpacity(0.3),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                      child: Icon(icon, color: isSelected ? Colors.white : AppColors.textSecondary, size: 24),
                                                                    ),
                                                      const SizedBox(width: 16),
                                                      Expanded(
                                                                      child: Column(
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                                            Text(status, style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700, color: isSelected ? AppColors.primary : AppColors.textPrimary)),
                                                                                                            Text(description, style: GoogleFonts.cairo(fontSize: 13, color: AppColors.textSecondary)),
                                                                                                          ],
                                                                                      ),
                                                                    ),
                                                      if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
                                                    ],
                                      ),
                          ),
                );
    }

    Widget _buildNote() {
          return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                          ),
                  child: Row(
                            children: [
                                        const Icon(Icons.info_outline, color: AppColors.primary, size: 18),
                                        const SizedBox(width: 8),
                                        Expanded(
                                                      child: Text('يمكنك تغيير الوضع لاحقاً من إعدادات حسابك', style: GoogleFonts.cairo(fontSize: 12, color: AppColors.primary)),
                                                    ),
                                      ],
                          ),
                );
    }

    Widget _buildButtons() {
          return Column(
                  children: [
                            ElevatedButton(
                                        onPressed: _selectedStatus.isNotEmpty ? _onContinue : null,
                                        style: ElevatedButton.styleFrom(
                                                      backgroundColor: AppColors.primary,
                                                      disabledBackgroundColor: AppColors.border,
                                                      minimumSize: const Size(double.infinity, 52),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                                    ),
                                        child: Text('متلقي الخدمة', style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                                      ),
                            const SizedBox(height: 12),
                            OutlinedButton(
                                        onPressed: _selectedStatus.isNotEmpty ? _onContinue : null,
                                        style: OutlinedButton.styleFrom(
                                                      foregroundColor: AppColors.primary,
                                                      minimumSize: const Size(double.infinity, 52),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                                      side: const BorderSide(color: AppColors.primary),
                                                    ),
                                        child: Text('مقدم الخدمة', style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600)),
                                      ),
                          ],
                );
    }
}
