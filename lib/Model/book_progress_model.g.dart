// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_progress_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookProgressModelCollection on Isar {
  IsarCollection<BookProgressModel> get bookProgressModels => this.collection();
}

const BookProgressModelSchema = CollectionSchema(
  name: r'BookProgressModel',
  id: 2050998199370397082,
  properties: {
    r'bookId': PropertySchema(
      id: 0,
      name: r'bookId',
      type: IsarType.string,
    ),
    r'bookmarks': PropertySchema(
      id: 1,
      name: r'bookmarks',
      type: IsarType.objectList,
      target: r'Bookmark',
    ),
    r'currentChapterIndex': PropertySchema(
      id: 2,
      name: r'currentChapterIndex',
      type: IsarType.long,
    ),
    r'currentPageIndex': PropertySchema(
      id: 3,
      name: r'currentPageIndex',
      type: IsarType.long,
    ),
    r'highlights': PropertySchema(
      id: 4,
      name: r'highlights',
      type: IsarType.objectList,
      target: r'Highlight',
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.objectList,
      target: r'NoteModel',
    )
  },
  estimateSize: _bookProgressModelEstimateSize,
  serialize: _bookProgressModelSerialize,
  deserialize: _bookProgressModelDeserialize,
  deserializeProp: _bookProgressModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Bookmark': BookmarkSchema,
    r'Highlight': HighlightSchema,
    r'NoteModel': NoteModelSchema
  },
  getId: _bookProgressModelGetId,
  getLinks: _bookProgressModelGetLinks,
  attach: _bookProgressModelAttach,
  version: '3.1.0+1',
);

int _bookProgressModelEstimateSize(
  BookProgressModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookId.length * 3;
  bytesCount += 3 + object.bookmarks.length * 3;
  {
    final offsets = allOffsets[Bookmark]!;
    for (var i = 0; i < object.bookmarks.length; i++) {
      final value = object.bookmarks[i];
      bytesCount += BookmarkSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.highlights.length * 3;
  {
    final offsets = allOffsets[Highlight]!;
    for (var i = 0; i < object.highlights.length; i++) {
      final value = object.highlights[i];
      bytesCount += HighlightSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.notes.length * 3;
  {
    final offsets = allOffsets[NoteModel]!;
    for (var i = 0; i < object.notes.length; i++) {
      final value = object.notes[i];
      bytesCount += NoteModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _bookProgressModelSerialize(
  BookProgressModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeObjectList<Bookmark>(
    offsets[1],
    allOffsets,
    BookmarkSchema.serialize,
    object.bookmarks,
  );
  writer.writeLong(offsets[2], object.currentChapterIndex);
  writer.writeLong(offsets[3], object.currentPageIndex);
  writer.writeObjectList<Highlight>(
    offsets[4],
    allOffsets,
    HighlightSchema.serialize,
    object.highlights,
  );
  writer.writeObjectList<NoteModel>(
    offsets[5],
    allOffsets,
    NoteModelSchema.serialize,
    object.notes,
  );
}

BookProgressModel _bookProgressModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookProgressModel(
    bookId: reader.readString(offsets[0]),
    currentChapterIndex: reader.readLong(offsets[2]),
    currentPageIndex: reader.readLong(offsets[3]),
  );
  object.bookmarks = reader.readObjectList<Bookmark>(
        offsets[1],
        BookmarkSchema.deserialize,
        allOffsets,
        Bookmark(),
      ) ??
      [];
  object.highlights = reader.readObjectList<Highlight>(
        offsets[4],
        HighlightSchema.deserialize,
        allOffsets,
        Highlight(),
      ) ??
      [];
  object.id = id;
  object.notes = reader.readObjectList<NoteModel>(
        offsets[5],
        NoteModelSchema.deserialize,
        allOffsets,
        NoteModel(),
      ) ??
      [];
  return object;
}

P _bookProgressModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectList<Bookmark>(
            offset,
            BookmarkSchema.deserialize,
            allOffsets,
            Bookmark(),
          ) ??
          []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readObjectList<Highlight>(
            offset,
            HighlightSchema.deserialize,
            allOffsets,
            Highlight(),
          ) ??
          []) as P;
    case 5:
      return (reader.readObjectList<NoteModel>(
            offset,
            NoteModelSchema.deserialize,
            allOffsets,
            NoteModel(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookProgressModelGetId(BookProgressModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookProgressModelGetLinks(
    BookProgressModel object) {
  return [];
}

void _bookProgressModelAttach(
    IsarCollection<dynamic> col, Id id, BookProgressModel object) {
  object.id = id;
}

extension BookProgressModelQueryWhereSort
    on QueryBuilder<BookProgressModel, BookProgressModel, QWhere> {
  QueryBuilder<BookProgressModel, BookProgressModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookProgressModelQueryWhere
    on QueryBuilder<BookProgressModel, BookProgressModel, QWhereClause> {
  QueryBuilder<BookProgressModel, BookProgressModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterWhereClause>
      idBetween(
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

extension BookProgressModelQueryFilter
    on QueryBuilder<BookProgressModel, BookProgressModel, QFilterCondition> {
  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookmarks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookmarks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookmarks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookmarks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookmarks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookmarks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentChapterIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentChapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentChapterIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentChapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentChapterIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentChapterIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentChapterIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentChapterIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentPageIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentPageIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentPageIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentPageIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentPageIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentPageIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      currentPageIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentPageIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'highlights',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'highlights',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'highlights',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'highlights',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'highlights',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'highlights',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension BookProgressModelQueryObject
    on QueryBuilder<BookProgressModel, BookProgressModel, QFilterCondition> {
  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      bookmarksElement(FilterQuery<Bookmark> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bookmarks');
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      highlightsElement(FilterQuery<Highlight> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'highlights');
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterFilterCondition>
      notesElement(FilterQuery<NoteModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notes');
    });
  }
}

extension BookProgressModelQueryLinks
    on QueryBuilder<BookProgressModel, BookProgressModel, QFilterCondition> {}

extension BookProgressModelQuerySortBy
    on QueryBuilder<BookProgressModel, BookProgressModel, QSortBy> {
  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      sortByCurrentChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapterIndex', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      sortByCurrentChapterIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapterIndex', Sort.desc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      sortByCurrentPageIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPageIndex', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      sortByCurrentPageIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPageIndex', Sort.desc);
    });
  }
}

extension BookProgressModelQuerySortThenBy
    on QueryBuilder<BookProgressModel, BookProgressModel, QSortThenBy> {
  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByCurrentChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapterIndex', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByCurrentChapterIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentChapterIndex', Sort.desc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByCurrentPageIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPageIndex', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByCurrentPageIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentPageIndex', Sort.desc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension BookProgressModelQueryWhereDistinct
    on QueryBuilder<BookProgressModel, BookProgressModel, QDistinct> {
  QueryBuilder<BookProgressModel, BookProgressModel, QDistinct>
      distinctByBookId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QDistinct>
      distinctByCurrentChapterIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentChapterIndex');
    });
  }

  QueryBuilder<BookProgressModel, BookProgressModel, QDistinct>
      distinctByCurrentPageIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentPageIndex');
    });
  }
}

extension BookProgressModelQueryProperty
    on QueryBuilder<BookProgressModel, BookProgressModel, QQueryProperty> {
  QueryBuilder<BookProgressModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookProgressModel, String, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<BookProgressModel, List<Bookmark>, QQueryOperations>
      bookmarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookmarks');
    });
  }

  QueryBuilder<BookProgressModel, int, QQueryOperations>
      currentChapterIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentChapterIndex');
    });
  }

  QueryBuilder<BookProgressModel, int, QQueryOperations>
      currentPageIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentPageIndex');
    });
  }

  QueryBuilder<BookProgressModel, List<Highlight>, QQueryOperations>
      highlightsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highlights');
    });
  }

  QueryBuilder<BookProgressModel, List<NoteModel>, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }
}
