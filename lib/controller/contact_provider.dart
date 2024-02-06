import 'package:contact_with_object_box/model/contact_model.dart';
import 'package:contact_with_object_box/objectbox.g.dart';
import 'package:contact_with_object_box/service/contact_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'contact_provider.g.dart';

@riverpod
class Contact extends _$Contact {
  @override
  List<ContactEntity> build() {
    // return ContactServices.contactBox.getAll();
    return sortedList();
  }

  List<ContactEntity> sortedList() {
    final Query<ContactEntity> query =
        ContactServices.contactBox.query().order(ContactEntity_.name).build();
    return query.find();
  }

  void putContact(ContactEntity contact) {
    ContactServices.contactBox.put(contact);
    state = ContactServices.contactBox.getAll();
  }

  void removeContact(int id) {
    ContactServices.contactBox.remove(id);
    state = ContactServices.contactBox.getAll();
  }
}
