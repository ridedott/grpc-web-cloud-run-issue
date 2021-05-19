protoc \
  --proto_path=./protos \
  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:$(pwd) \
  --js_out=import_style="commonjs,binary:$(pwd)" \
  ./protos/helloworld.proto
