# gRPC-web Cloud Run issue

**Bring up envoy:**
```
dc up
```

**Open index.html in your browser**

This does requests every 500ms `https://grpc-web-test-snpekwsqaa-ez.a.run.app`.
This Cloud Run app runs an image built from the `Dockerfile` in this repo.
Only some requests return the correct response code/message.

![](./images/img.png)

## Other comments

This problem does not happen for a TLS server not on Cloud Run. To
demonstrate, use `server-ssl.js` to run the server locally with the envoy
config pointing at `server` host.
