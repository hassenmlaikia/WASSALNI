import 'package:flutter/material.dart';
import 'package:wassalni/core/theme/wassalni_colors.dart';
import 'package:wassalni/models/order.dart';

/// Home Screen - Main Client interface for requesting rides/deliveries
/// Features premium dark design with gold accents and Tunisian Arabic support
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ServiceType _selectedService = ServiceType.motoRide;
  bool _helmetRequired = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WassalniColors.deepBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with logo and greeting
                _buildHeader(),
                const SizedBox(height: 32),

                // Service Selection
                _buildServiceSelector(),
                const SizedBox(height: 32),

                // Location Cards
                _buildLocationSection(),
                const SizedBox(height: 24),

                // Price Display
                if (_selectedService == ServiceType.motoRide)
                  _buildPriceCard(),
                const SizedBox(height: 24),

                // Options (helmet for moto)
                if (_selectedService == ServiceType.motoRide)
                  _buildOptionsSection(),
                const SizedBox(height: 32),

                // Request Button
                _buildRequestButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أهلا بك',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: WassalniColors.textPrimary,
                  ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 4),
            Text(
              'وصلك توصلك',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: WassalniColors.gold,
                    fontWeight: FontWeight.w600,
                  ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        // Profile/Settings button
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: WassalniColors.darkSurface2,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: WassalniColors.divider,
              width: 1,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.person, color: WassalniColors.gold),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildServiceSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اختر الخدمة',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: WassalniColors.textPrimary,
              ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildServiceCard(
                serviceType: ServiceType.motoRide,
                icon: Icons.two_wheeler,
                label: 'دراجة',
                isSelected: _selectedService == ServiceType.motoRide,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildServiceCard(
                serviceType: ServiceType.delivery,
                icon: Icons.local_shipping,
                label: 'توصيل',
                isSelected: _selectedService == ServiceType.delivery,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceCard({
    required ServiceType serviceType,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedService = serviceType;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? WassalniColors.gold.withOpacity(0.15)
              : WassalniColors.darkSurface2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? WassalniColors.gold
                : WassalniColors.divider,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? WassalniColors.gold
                  : WassalniColors.textSecondary,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? WassalniColors.gold
                    : WassalniColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المسار',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: WassalniColors.textPrimary,
              ),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 16),
        // Pickup Location
        _buildLocationCard(
          icon: Icons.location_on,
          label: 'نقطة البداية',
          placeholder: 'أين أنت؟',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        // Swap button
        Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: WassalniColors.gold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: WassalniColors.gold,
                width: 1.5,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.unfold_more, color: WassalniColors.gold),
              onPressed: () {},
              iconSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Destination Location
        _buildLocationCard(
          icon: Icons.flag,
          label: 'نقطة النهاية',
          placeholder: 'إلى أين؟',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLocationCard({
    required IconData icon,
    required String label,
    required String placeholder,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: WassalniColors.darkSurface2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: WassalniColors.divider,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: WassalniColors.gold, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: WassalniColors.textTertiary,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    placeholder,
                    style: const TextStyle(
                      color: WassalniColors.textSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: WassalniColors.textTertiary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WassalniColors.darkSurface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: WassalniColors.gold.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'السعر المتوقع',
                style: TextStyle(
                  color: WassalniColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              const Text(
                '5.50 TND',
                style: TextStyle(
                  color: WassalniColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 0.5,
            color: WassalniColors.divider,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'المسافة المتوقعة',
                style: TextStyle(
                  color: WassalniColors.textTertiary,
                  fontSize: 12,
                ),
              ),
              Text(
                '5.5 km',
                style: TextStyle(
                  color: WassalniColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WassalniColors.darkSurface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: WassalniColors.divider,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'خيار الخوذة',
                style: TextStyle(
                  color: WassalniColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '+1.00 TND',
                style: TextStyle(
                  color: WassalniColors.gold,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Switch(
            value: _helmetRequired,
            onChanged: (value) {
              setState(() {
                _helmetRequired = value;
              });
            },
            activeColor: WassalniColors.gold,
            activeTrackColor: WassalniColors.gold.withOpacity(0.3),
            inactiveThumbColor: WassalniColors.textTertiary,
            inactiveTrackColor: WassalniColors.divider,
          ),
        ],
      ),
    );
  }

  Widget _buildRequestButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('طلب قيد البحث عن سائق...'),
              backgroundColor: WassalniColors.gold,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: WassalniColors.gold,
          foregroundColor: WassalniColors.deepBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'اطلب الآن',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: WassalniColors.deepBlack,
          ),
        ),
      ),
    );
  }
}
