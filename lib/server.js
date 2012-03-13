(function() {
  var app;

  app = require('express').createServer();

  app.get('/', function(req, res) {
    return res.send('hello world');
  });

  module.exports.start = function(port) {
    return app.listen(port);
  };

}).call(this);
