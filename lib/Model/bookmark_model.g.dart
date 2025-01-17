// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BookmarkSchema = Schema(
  name: r'Bookmark',
  id: 6727227738202460809,
  properties: {
    r'chapterIndex': PropertySchema(
      id: 0,
      name: r'chapterIndex',
      type: IsarType.long,
    ),
    r'pageIndex': PropertySchema(
      id: 1,
      name: r'pageIndex',
      type: IsarType.long,
    )
  },
  estimateSize: _bookmarkEstimateSize,
  serialize: _bookmarkSerialize,
  deserialize: _bookmarkDeserialize,
  deserializeProp: _bookmarkDeserializeProp,
);

int _bookmarkEstimateSize(
  Bookmark object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bookmarkSerialize(
  Bookmark object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chapterIndex);
  writer.writeLong(offsets[1], object.pageIndex);
}

Bookmark _bookmarkDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Bookmark(
    chapterIndex: reader.readLongOrNull(offsets[0]),
    pageIndex: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _bookmarkDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BookmarkQueryFilter
    on QueryBuilder<Bookmark, Bookmark, QFilterCondition> {
  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> chapterIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chapterIndex',
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition>
      chapterIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chapterIndex',
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> chapterIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition>
      chapterIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> chapterIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> chapterIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> pageIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pageIndex',
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> pageIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pageIndex',
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> pageIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> pageIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pageIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> pageIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pageIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Bookmark, Bookmark, QAfterFilterCondition> pageIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pageIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookmarkQueryObject
    on QueryBuilder<Bookmark, Bookmark, QFilterCondition> {}
