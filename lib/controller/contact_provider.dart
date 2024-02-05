import 'package:contact_with_object_box/model/contact_model.dart';
import 'package:contact_with_object_box/service/contact_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'contact_provider.g.dart';

@riverpod
class Contact extends _$Contact {
  @override
  List<ContactEntity> build() {
    return ContactServices.contactBox.getAll();
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
