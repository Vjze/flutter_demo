// @generated
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ReadRequest {
    #[prost(string, tag = "1")]
    pub input_string: ::prost::alloc::string::String,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct ReadResponse {
    #[prost(message, repeated, tag = "1")]
    pub output_lists: ::prost::alloc::vec::Vec<DataInfos>,
}
#[allow(clippy::derive_partial_eq_without_eq)]
#[derive(Clone, PartialEq, ::prost::Message)]
pub struct DataInfos {
    #[prost(string, tag = "1")]
    pub pno: ::prost::alloc::string::String,
    #[prost(string, tag = "2")]
    pub sn: ::prost::alloc::string::String,
    #[prost(string, tag = "3")]
    pub pn: ::prost::alloc::string::String,
    #[prost(string, tag = "4")]
    pub order: ::prost::alloc::string::String,
    #[prost(string, tag = "5")]
    pub workid: ::prost::alloc::string::String,
    #[prost(string, tag = "6")]
    pub datatime: ::prost::alloc::string::String,
}
// @@protoc_insertion_point(module)

pub const ID: i32 = 4;
