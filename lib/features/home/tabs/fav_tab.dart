import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/home/widgets/event_card.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTab extends StatefulWidget {
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var events = EventModel.dummyEvents
        .where(
          (event) =>
              event.isFavorite &&
              event.title.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomTextFormField(
            hintText: "search_hint".tr(),
            suffixIcon: Icon(
              Icons.search,
              color: provider.colors.primaryColor(),
            ),
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
        ),
        Expanded(
          child: events.isEmpty
              ? Center(
                  child: Text(
                    "no_favorites".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) => EventCard(
                    event: events[index],
                    onFavoriteTap: () {
                      setState(() {
                        events[index].isFavorite = !events[index].isFavorite;
                      });
                    },
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: events.length,
                ),
        ),
      ],
    );
  }
}
