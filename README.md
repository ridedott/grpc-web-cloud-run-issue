# gRPC-web Cloud Run issue

**To run this example:**

Open `index.html` in your browser.

**What it shows**

The gRPC-web client running on this page does requests every 500ms to
`https://grpc-web-test-envoy-snpekwsqaa-ez.a.run.app`. This Cloud Run app
runs an Envoy proxy with a gRPC web filter pointing to another Cloud Run app
(`https://grpc-web-test-snpekwsqaa-ez.a.run.app`) that runs a regular gRPC
server built from the `Dockerfile` in this repository. This demo demonstrates
that _only some_ requests return the correct response code/message, namely
the expected error `invalid input`.

```
browser

    => Regular HTTP

        Envoy proxy (https://grpc-web-test-envoy-snpekwsqaa-ez.a.run.app)

            => HTTP2 (gRPC traffic)

                gRPC server (https://grpc-web-test-snpekwsqaa-ez.a.run.app)

            <= Response (with AND without `Content-Length: 0`)

    <= Valid response only if `Content-Length: 0` header is NOT present

result (screenshot from browser inspect console tab):
```

![](./images/img.png)

## Client URL update instructions

To update the browser client to point to another host like localhost or
another Cloud Run instance, do the following.

Update the `HOST` variable in `client.js` to the new URL.

Run the following from the project folder:

```shell
npm install
npx webpack
```

## Counterexample

This problem does not happen for a TLS server not on Cloud Run. To
demonstrate, use `server-ssl.js` to run the server locally with the envoy
config pointing at `server` host.

The local Envoy server is just to showcase the problem. The response
has been inspected and comes in empty, i.e. the problem is not caused
by Envoy.
