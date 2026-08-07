import 'package:easy_localization/easy_localization.dart';
import 'package:evently/features/home/widgets/category_chip.dart';
import 'package:evently/features/home/widgets/event_card.dart';
import 'package:evently/models/event_category.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var selectedCategory = EventCategory.filters[selectedFilter];
    var events = selectedCategory.id == EventCategory.all.id
        ? EventModel.dummyEvents
        : EventModel.dummyEvents
              .where((event) => event.category.id == selectedCategory.id)
              .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome_back".tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "John Safwat",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(fontSize: 24),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  provider.changeTheme(
                    provider.themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                  );
                },
                child: Image.asset(
                  provider.themeMode == ThemeMode.dark
                      ? "assets/images/moon.png"
                      : "assets/images/sun_d.png",
                  color: provider.colors.primaryColor(),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  context.setLocale(
                    context.locale.languageCode == "en"
                        ? const Locale("ar")
                        : const Locale("en"),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: provider.colors.primaryColor(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    context.locale.languageCode.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => CategoryChip(
              category: EventCategory.filters[index],
              isSelected: index == selectedFilter,
              onTap: () {
                setState(() {
                  selectedFilter = index;
                });
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: EventCategory.filters.length,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => EventCard(
              event: events[index],
              onFavoriteTap: () {
                setState(() {
                  events[index].isFavorite = !events[index].isFavorite;
                });
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: events.length,
          ),
        ),
      ],
    );
  }
}
