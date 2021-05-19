const {HelloRequest} = require('./helloworld_pb.js');
const {GreeterClient} = require('./helloworld_grpc_web_pb.js');

var client = new GreeterClient('http://localhost:9000', null, null);

// simple unary call
var request = new HelloRequest();
request.setName('World');

setInterval(() => {
  client.sayHello(request, {}, (err) => {
    console.log(`Response code ${err.code}, message = "${err.message}"`);
  });
}, 500)
