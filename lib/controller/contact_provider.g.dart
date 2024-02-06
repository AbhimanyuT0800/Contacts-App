// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactHash() => r'd24e0407ff95f978b5760db65283cefa56dfff7f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Contact
    extends BuildlessAutoDisposeNotifier<List<ContactEntity>> {
  late final String search;

  List<ContactEntity> build(
    String search,
  );
}

/// See also [Contact].
@ProviderFor(Contact)
const contactProvider = ContactFamily();

/// See also [Contact].
class ContactFamily extends Family<List<ContactEntity>> {
  /// See also [Contact].
  const ContactFamily();

  /// See also [Contact].
  ContactProvider call(
    String search,
  ) {
    return ContactProvider(
      search,
    );
  }

  @override
  ContactProvider getProviderOverride(
    covariant ContactProvider provider,
  ) {
    return call(
      provider.search,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'contactProvider';
}

/// See also [Contact].
class ContactProvider
    extends AutoDisposeNotifierProviderImpl<Contact, List<ContactEntity>> {
  /// See also [Contact].
  ContactProvider(
    String search,
  ) : this._internal(
          () => Contact()..search = search,
          from: contactProvider,
          name: r'contactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactHash,
          dependencies: ContactFamily._dependencies,
          allTransitiveDependencies: ContactFamily._allTransitiveDependencies,
          search: search,
        );

  ContactProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String search;

  @override
  List<ContactEntity> runNotifierBuild(
    covariant Contact notifier,
  ) {
    return notifier.build(
      search,
    );
  }

  @override
  Override overrideWith(Contact Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactProvider._internal(
        () => create()..search = search,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Contact, List<ContactEntity>>
      createElement() {
    return _ContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ContactRef on AutoDisposeNotifierProviderRef<List<ContactEntity>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _ContactProviderElement
    extends AutoDisposeNotifierProviderElement<Contact, List<ContactEntity>>
    with ContactRef {
  _ContactProviderElement(super.provider);

  @override
  String get search => (origin as ContactProvider).search;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
