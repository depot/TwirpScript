# Changelog

## v0.0.35

- add body to request type for middleware and hooks by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/67

**Full Changelog**: https://github.com/tatethurston/TwirpScript/compare/v0.0.34...v0.0.35

## v0.034

This release includes breaking changes:

1. The generated `.pb.ts` files have been restructured. You'll need to run `yarn twirpscript` to regenerate your `.pb.ts` files after updating.
2. `context`'s `service` and `method` properties now point to generated objects instead of simply being strings (eg previously these were "Haberdasher" and "MakeHat" and now these properties point to generated objects. This enables more powerful runtime reflection, eg:

```
app.on('requestReceived', (ctx, req) => {
   console.log(`Received request body: ${ctx.contentType === 'Protobuf' ? ctx.method.input.decode(req.body) : req.body}`);
});
```

3. `requestRouted` and `responsePrepared` are now invoked with the JavaScript object input / output to your handler, rather than the serialized input / output. This should improve debugging workflows, because you may now simply console log the input / output instead of needing to deserialize protobuf human readable output.

- fix client error hook by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/56
- improve types for context's method and service properties by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/61
- Tate/service object by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/62
- context service and method now point to implementation instead of string by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/63
- requestRouted and responsePrepared are now invoked with input/output by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/64
- remove unnecessary isEndGroup check in serializer by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/65
- format error output from protoc compiler by @tatethurston in https://github.com/tatethurston/TwirpScript/pull/66

**Full Changelog**: https://github.com/tatethurston/TwirpScript/compare/v0.0.33...v0.0.34