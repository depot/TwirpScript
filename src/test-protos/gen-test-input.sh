#!/usr/bin/env bash

# Run from src/test-protos to regnerate test-input-typescript and test-input-javascript.

protoc \
  --plugin=protoc-gen-twirpscript=../../dist/test-protos/gen-test-input.js \
  --twirpscript_out=. \
  --twirpscript_opt=typescript \
  $(find . -name *.proto)

protoc \
  --plugin=protoc-gen-twirpscript=../../dist/test-protos/gen-test-input.js \
  --twirpscript_out=. \
  --twirpscript_opt=javascript \
  $(find . -name *.proto)

echo "Generated test-input-typescript and test-input-javascript"