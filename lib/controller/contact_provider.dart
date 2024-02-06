import 'package:contact_with_object_box/model/contact_model.dart';
import 'package:contact_with_object_box/objectbox.g.dart';
import 'package:contact_with_object_box/service/contact_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'contact_provider.g.dart';

@riverpod
class Contact extends _$Contact {
  @override
  List<ContactEntity> build(String search) {
    // return ContactServices.contactBox.getAll();
    return sortedList(search);
  }

  List<ContactEntity> sortedList(String search) {
    final Query<ContactEntity> query = ContactServices.contactBox
        .query(search.isEmpty ? null : ContactEntity_.name.contains(search))
        .order(ContactEntity_.name)
        .build();
    return query.find();
  }

  void putContact(ContactEntity contact) {
    ContactServices.contactBox.put(contact);
    state = List.from(sortedList(''));
  }

  void removeContact(int id) {
    ContactServices.contactBox.remove(id);
    state = List.from(sortedList(''));
  }
}

final isSearch = StateProvider((ref) => true);
