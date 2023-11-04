//
//  Generated code. Do not modify.
//  source: query_resource.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReadRequest extends $pb.GeneratedMessage {
  factory ReadRequest({
    $core.String? inputString,
  }) {
    final $result = create();
    if (inputString != null) {
      $result.inputString = inputString;
    }
    return $result;
  }
  ReadRequest._() : super();
  factory ReadRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'query_resource'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'inputString')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadRequest clone() => ReadRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadRequest copyWith(void Function(ReadRequest) updates) =>
      super.copyWith((message) => updates(message as ReadRequest))
          as ReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadRequest create() => ReadRequest._();
  ReadRequest createEmptyInstance() => create();
  static $pb.PbList<ReadRequest> createRepeated() => $pb.PbList<ReadRequest>();
  @$core.pragma('dart2js:noInline')
  static ReadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadRequest>(create);
  static ReadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get inputString => $_getSZ(0);
  @$pb.TagNumber(1)
  set inputString($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInputString() => $_has(0);
  @$pb.TagNumber(1)
  void clearInputString() => clearField(1);
}

class ReadResponse extends $pb.GeneratedMessage {
  factory ReadResponse({
    $core.Iterable<DataInfos>? outputLists,
  }) {
    final $result = create();
    if (outputLists != null) {
      $result.outputLists.addAll(outputLists);
    }
    return $result;
  }
  ReadResponse._() : super();
  factory ReadResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ReadResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReadResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'query_resource'),
      createEmptyInstance: create)
    ..pc<DataInfos>(1, _omitFieldNames ? '' : 'outputLists', $pb.PbFieldType.PM,
        protoName: 'output_Lists', subBuilder: DataInfos.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ReadResponse clone() => ReadResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ReadResponse copyWith(void Function(ReadResponse) updates) =>
      super.copyWith((message) => updates(message as ReadResponse))
          as ReadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReadResponse create() => ReadResponse._();
  ReadResponse createEmptyInstance() => create();
  static $pb.PbList<ReadResponse> createRepeated() =>
      $pb.PbList<ReadResponse>();
  @$core.pragma('dart2js:noInline')
  static ReadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReadResponse>(create);
  static ReadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<DataInfos> get outputLists => $_getList(0);
}

class DataInfos extends $pb.GeneratedMessage {
  factory DataInfos({
    $core.String? pno,
    $core.String? sn,
    $core.String? pn,
    $core.String? order,
    $core.String? workid,
    $core.String? datatime,
  }) {
    final $result = create();
    if (pno != null) {
      $result.pno = pno;
    }
    if (sn != null) {
      $result.sn = sn;
    }
    if (pn != null) {
      $result.pn = pn;
    }
    if (order != null) {
      $result.order = order;
    }
    if (workid != null) {
      $result.workid = workid;
    }
    if (datatime != null) {
      $result.datatime = datatime;
    }
    return $result;
  }
  DataInfos._() : super();
  factory DataInfos.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DataInfos.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DataInfos',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'query_resource'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pno')
    ..aOS(2, _omitFieldNames ? '' : 'sn')
    ..aOS(3, _omitFieldNames ? '' : 'pn')
    ..aOS(4, _omitFieldNames ? '' : 'order')
    ..aOS(5, _omitFieldNames ? '' : 'workid')
    ..aOS(6, _omitFieldNames ? '' : 'datatime')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DataInfos clone() => DataInfos()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DataInfos copyWith(void Function(DataInfos) updates) =>
      super.copyWith((message) => updates(message as DataInfos)) as DataInfos;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DataInfos create() => DataInfos._();
  DataInfos createEmptyInstance() => create();
  static $pb.PbList<DataInfos> createRepeated() => $pb.PbList<DataInfos>();
  @$core.pragma('dart2js:noInline')
  static DataInfos getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DataInfos>(create);
  static DataInfos? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pno => $_getSZ(0);
  @$pb.TagNumber(1)
  set pno($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPno() => $_has(0);
  @$pb.TagNumber(1)
  void clearPno() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sn => $_getSZ(1);
  @$pb.TagNumber(2)
  set sn($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSn() => $_has(1);
  @$pb.TagNumber(2)
  void clearSn() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get pn => $_getSZ(2);
  @$pb.TagNumber(3)
  set pn($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPn() => $_has(2);
  @$pb.TagNumber(3)
  void clearPn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get order => $_getSZ(3);
  @$pb.TagNumber(4)
  set order($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrder() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get workid => $_getSZ(4);
  @$pb.TagNumber(5)
  set workid($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWorkid() => $_has(4);
  @$pb.TagNumber(5)
  void clearWorkid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get datatime => $_getSZ(5);
  @$pb.TagNumber(6)
  set datatime($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDatatime() => $_has(5);
  @$pb.TagNumber(6)
  void clearDatatime() => clearField(6);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

const ID = 4;
