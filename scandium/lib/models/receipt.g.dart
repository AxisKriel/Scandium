// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReceiptCollection on Isar {
  IsarCollection<Receipt> get receipts => this.collection();
}

const ReceiptSchema = CollectionSchema(
  name: r'Receipt',
  id: 4668855833497531014,
  properties: {
    r'actud': PropertySchema(
      id: 0,
      name: r'actud',
      type: IsarType.string,
    ),
    r'cost': PropertySchema(
      id: 1,
      name: r'cost',
      type: IsarType.double,
    ),
    r'countryCode': PropertySchema(
      id: 2,
      name: r'countryCode',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'fullId': PropertySchema(
      id: 4,
      name: r'fullId',
      type: IsarType.string,
    ),
    r'nif': PropertySchema(
      id: 5,
      name: r'nif',
      type: IsarType.string,
    ),
    r'qrcode': PropertySchema(
      id: 6,
      name: r'qrcode',
      type: IsarType.string,
    ),
    r'tax': PropertySchema(
      id: 7,
      name: r'tax',
      type: IsarType.double,
    )
  },
  estimateSize: _receiptEstimateSize,
  serialize: _receiptSerialize,
  deserialize: _receiptDeserialize,
  deserializeProp: _receiptDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'category': LinkSchema(
      id: -733341449363219201,
      name: r'category',
      target: r'Category',
      single: true,
    ),
    r'merchant': LinkSchema(
      id: -5640865025352972320,
      name: r'merchant',
      target: r'Merchant',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _receiptGetId,
  getLinks: _receiptGetLinks,
  attach: _receiptAttach,
  version: '3.1.0+1',
);

int _receiptEstimateSize(
  Receipt object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actud.length * 3;
  bytesCount += 3 + object.countryCode.length * 3;
  bytesCount += 3 + object.fullId.length * 3;
  {
    final value = object.nif;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.qrcode.length * 3;
  return bytesCount;
}

void _receiptSerialize(
  Receipt object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actud);
  writer.writeDouble(offsets[1], object.cost);
  writer.writeString(offsets[2], object.countryCode);
  writer.writeDateTime(offsets[3], object.date);
  writer.writeString(offsets[4], object.fullId);
  writer.writeString(offsets[5], object.nif);
  writer.writeString(offsets[6], object.qrcode);
  writer.writeDouble(offsets[7], object.tax);
}

Receipt _receiptDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Receipt(
    actud: reader.readString(offsets[0]),
    cost: reader.readDouble(offsets[1]),
    countryCode: reader.readString(offsets[2]),
    date: reader.readDateTime(offsets[3]),
    fullId: reader.readString(offsets[4]),
    nif: reader.readStringOrNull(offsets[5]),
    qrcode: reader.readString(offsets[6]),
    tax: reader.readDouble(offsets[7]),
  );
  object.id = id;
  return object;
}

P _receiptDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _receiptGetId(Receipt object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _receiptGetLinks(Receipt object) {
  return [object.category, object.merchant];
}

void _receiptAttach(IsarCollection<dynamic> col, Id id, Receipt object) {
  object.id = id;
  object.category.attach(col, col.isar.collection<Category>(), r'category', id);
  object.merchant.attach(col, col.isar.collection<Merchant>(), r'merchant', id);
}

extension ReceiptQueryWhereSort on QueryBuilder<Receipt, Receipt, QWhere> {
  QueryBuilder<Receipt, Receipt, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReceiptQueryWhere on QueryBuilder<Receipt, Receipt, QWhereClause> {
  QueryBuilder<Receipt, Receipt, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReceiptQueryFilter
    on QueryBuilder<Receipt, Receipt, QFilterCondition> {
  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actud',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actud',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> actudIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actud',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> costEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> costGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> costLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> costBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countryCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countryCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countryCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> countryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition>
      countryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countryCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullId',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> fullIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullId',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nif',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nif',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nif',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nif',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nif',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nif',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> nifIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nif',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qrcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qrcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qrcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qrcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qrcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qrcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qrcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qrcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qrcode',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> qrcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qrcode',
        value: '',
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> taxEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> taxGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> taxLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> taxBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ReceiptQueryObject
    on QueryBuilder<Receipt, Receipt, QFilterCondition> {}

extension ReceiptQueryLinks
    on QueryBuilder<Receipt, Receipt, QFilterCondition> {
  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> category(
      FilterQuery<Category> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'category');
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'category', 0, true, 0, true);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> merchant(
      FilterQuery<Merchant> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'merchant');
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterFilterCondition> merchantIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'merchant', 0, true, 0, true);
    });
  }
}

extension ReceiptQuerySortBy on QueryBuilder<Receipt, Receipt, QSortBy> {
  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByActud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actud', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByActudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actud', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByFullId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullId', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByFullIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullId', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByNif() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nif', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByNifDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nif', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByQrcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrcode', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByQrcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrcode', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> sortByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }
}

extension ReceiptQuerySortThenBy
    on QueryBuilder<Receipt, Receipt, QSortThenBy> {
  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByActud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actud', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByActudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actud', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByFullId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullId', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByFullIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullId', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByNif() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nif', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByNifDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nif', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByQrcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrcode', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByQrcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrcode', Sort.desc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.asc);
    });
  }

  QueryBuilder<Receipt, Receipt, QAfterSortBy> thenByTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tax', Sort.desc);
    });
  }
}

extension ReceiptQueryWhereDistinct
    on QueryBuilder<Receipt, Receipt, QDistinct> {
  QueryBuilder<Receipt, Receipt, QDistinct> distinctByActud(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actud', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cost');
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByCountryCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countryCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByFullId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByNif(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nif', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByQrcode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qrcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Receipt, Receipt, QDistinct> distinctByTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tax');
    });
  }
}

extension ReceiptQueryProperty
    on QueryBuilder<Receipt, Receipt, QQueryProperty> {
  QueryBuilder<Receipt, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Receipt, String, QQueryOperations> actudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actud');
    });
  }

  QueryBuilder<Receipt, double, QQueryOperations> costProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cost');
    });
  }

  QueryBuilder<Receipt, String, QQueryOperations> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryCode');
    });
  }

  QueryBuilder<Receipt, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Receipt, String, QQueryOperations> fullIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullId');
    });
  }

  QueryBuilder<Receipt, String?, QQueryOperations> nifProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nif');
    });
  }

  QueryBuilder<Receipt, String, QQueryOperations> qrcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrcode');
    });
  }

  QueryBuilder<Receipt, double, QQueryOperations> taxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tax');
    });
  }
}
