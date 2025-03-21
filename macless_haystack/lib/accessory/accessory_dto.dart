/// This class is used for de-/serializing data to the JSON transfer format.
class AccessoryDTO {
  int id;
  List<double> colorComponents;
  String name;
  double? lastDerivationTimestamp;
  String? symmetricKey;
  int? updateInterval;
  String privateKey;
  String icon;
  String? oldestRelevantSymmetricKey;
  bool isActive;
  List<String>? additionalKeys;

  /// Creates a transfer object to serialize to the JSON export format.
  ///
  /// This implements the [toJson] method used by the Dart JSON serializer.
  /// ```dart
  ///   var accessoryDTO = AccessoryDTO(...);
  ///   jsonEncode(accessoryDTO);
  /// ```
  AccessoryDTO(
      {required this.id,
      required this.colorComponents,
      required this.name,
      this.lastDerivationTimestamp,
      this.symmetricKey,
      this.updateInterval,
      required this.privateKey,
      required this.icon,
      this.oldestRelevantSymmetricKey,
      required this.isActive,
      this.additionalKeys});

  /// Creates a transfer object from deserialized JSON data.
  ///
  /// The data is only decoded and not processed further.
  ///
  /// Typically used with JSON decoder.
  /// ```dart
  ///   String json = '...';
  ///   var accessoryDTO = AccessoryDTO.fromJSON(jsonDecode(json));
  /// ```
  ///
  /// This implements the [toJson] method used by the Dart JSON serializer.
  /// ```dart
  ///   var accessoryDTO = AccessoryDTO(...);
  ///   jsonEncode(accessoryDTO);
  /// ```
  AccessoryDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        colorComponents = List.from(json['colorComponents'])
            .map((val) => double.parse(val.toString()))
            .toList(),
        name = json['name'],
        lastDerivationTimestamp = json['lastDerivationTimestamp'] ?? 0,
        symmetricKey = json['symmetricKey'] ?? '',
        updateInterval = json['updateInterval'] ?? 0,
        privateKey = json['privateKey'],
        icon = json['icon'],
        oldestRelevantSymmetricKey = json['oldestRelevantSymmetricKey'] ?? '',
  /*isDeployed is only for migration an can be removed in the future*/
        isActive = json['isDeployed'] ?? json['isActive'],
        additionalKeys = json['additionalKeys']?.cast<String>() ?? List.empty();

  /// Creates a JSON map of the serialized transfer object.
  ///
  /// Typically used by JSON encoder.
  /// ```dart
  ///   var accessoryDTO = AccessoryDTO(...);
  ///   jsonEncode(accessoryDTO);
  /// ```
  Map<String, dynamic> toJson() =>  {
          // Without derivation (skip rolling key params)
          'id': id,
          'colorComponents': colorComponents,
          'name': name,
          'privateKey': privateKey,
          'icon': icon,
          'isActive': isActive,
          'additionalKeys': additionalKeys
        };
}
