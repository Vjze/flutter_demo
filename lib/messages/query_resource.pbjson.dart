//
//  Generated code. Do not modify.
//  source: query_resource.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use readRequestDescriptor instead')
const ReadRequest$json = {
  '1': 'ReadRequest',
  '2': [
    {'1': 'input_string', '3': 1, '4': 1, '5': 9, '10': 'inputString'},
  ],
};

/// Descriptor for `ReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readRequestDescriptor = $convert.base64Decode(
    'CgtSZWFkUmVxdWVzdBIhCgxpbnB1dF9zdHJpbmcYASABKAlSC2lucHV0U3RyaW5n');

@$core.Deprecated('Use readResponseDescriptor instead')
const ReadResponse$json = {
  '1': 'ReadResponse',
  '2': [
    {
      '1': 'output_Lists',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.query_resource.DataInfos',
      '10': 'outputLists'
    },
  ],
};

/// Descriptor for `ReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List readResponseDescriptor = $convert.base64Decode(
    'CgxSZWFkUmVzcG9uc2USPAoMb3V0cHV0X0xpc3RzGAEgAygLMhkucXVlcnlfcmVzb3VyY2UuRG'
    'F0YUluZm9zUgtvdXRwdXRMaXN0cw==');

@$core.Deprecated('Use dataInfosDescriptor instead')
const DataInfos$json = {
  '1': 'DataInfos',
  '2': [
    {'1': 'pno', '3': 1, '4': 1, '5': 9, '10': 'pno'},
    {'1': 'sn', '3': 2, '4': 1, '5': 9, '10': 'sn'},
    {'1': 'pn', '3': 3, '4': 1, '5': 9, '10': 'pn'},
    {'1': 'order', '3': 4, '4': 1, '5': 9, '10': 'order'},
    {'1': 'workid', '3': 5, '4': 1, '5': 9, '10': 'workid'},
    {'1': 'datatime', '3': 6, '4': 1, '5': 9, '10': 'datatime'},
  ],
};

/// Descriptor for `DataInfos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataInfosDescriptor = $convert.base64Decode(
    'CglEYXRhSW5mb3MSEAoDcG5vGAEgASgJUgNwbm8SDgoCc24YAiABKAlSAnNuEg4KAnBuGAMgAS'
    'gJUgJwbhIUCgVvcmRlchgEIAEoCVIFb3JkZXISFgoGd29ya2lkGAUgASgJUgZ3b3JraWQSGgoI'
    'ZGF0YXRpbWUYBiABKAlSCGRhdGF0aW1l');
