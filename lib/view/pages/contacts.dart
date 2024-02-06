import 'package:contact_with_object_box/controller/contact_provider.dart';
import 'package:contact_with_object_box/model/contact_model.dart';
import 'package:contact_with_object_box/view/widgets/add_contact_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerWidget {
  ContactPage({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ContactEntity> contactList =
        ref.watch(contactProvider(search.text));
    return Scaffold(
      appBar: AppBar(
        title: AnimatedCrossFade(
            firstChild: const Center(
              child: Text('Contacts'),
            ),
            secondChild: TextField(
              controller: search,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: "Search contacts",
                suffixIcon: IconButton(
                  onPressed: () {
                    search.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onChanged: (value) {
                ref.invalidate(
                  contactProvider(search.text),
                );
              },
            ),
            crossFadeState: ref.watch(isSearch)
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300)),
        actions: [
          IconButton(
              onPressed: () {
                ref.watch(isSearch.notifier).state = !ref.read(isSearch);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: contactList.isEmpty
          ? const Center(
              child: Text('No Contacts'),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                      contactList[index].name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(contactList[index].phone),
                    leading: CircleAvatar(
                      child: Text(
                        contactList[index].name[0].toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ),
                    trailing: PopupMenuButton(itemBuilder: (context) {
                      return [
                        // Edit Contact
                        PopupMenuItem<int>(
                          child: TextButton(
                              onPressed: () {
                                name.text = contactList[index].name;
                                phone.text = contactList[index].phone;
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return localBottomSheet(
                                        formKey: formKey,
                                        name: name,
                                        phone: phone,
                                        ref: ref,
                                        onPressed: () {
                                          final ContactEntity contact =
                                              ContactEntity(
                                            id: contactList[index].id,
                                            name: name.text,
                                            phone: phone.text,
                                          );
                                          ref
                                              .watch(
                                                  contactProvider(search.text)
                                                      .notifier)
                                              .putContact(contact);
                                          Navigator.pop(context);
                                          name.clear();
                                          phone.clear();
                                        },
                                        context: context,
                                        isEdit: true);
                                  },
                                );
                              },
                              child: const Text('Edit')),
                        ),
                        // delete contact
                        PopupMenuItem(
                          child: TextButton(
                            onPressed: () {
                              ref
                                  .watch(contactProvider(search.text).notifier)
                                  .removeContact(contactList[index].id);
                              Navigator.pop(context);
                            },
                            child: const Text('Delete'),
                          ),
                        )
                      ];
                    }));
              },
            ),
      // add-contacts
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            phone.clear();
            name.clear();

            showModalBottomSheet(
              context: context,
              builder: (context) {
                return localBottomSheet(
                  onPressed: () {
                    final ContactEntity contact =
                        ContactEntity(name: name.text, phone: phone.text);
                    ref
                        .watch(contactProvider(search.text).notifier)
                        .putContact(contact);
                    name.clear();
                    phone.clear();
                    Navigator.pop(context);
                  },
                  ref: ref,
                  formKey: formKey,
                  name: name,
                  phone: phone,
                  context: context,
                  isEdit: false,
                );
              },
            );
          },
          label: const Text('Add contact')),
    );
  }
}
