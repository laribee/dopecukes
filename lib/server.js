(function() {
  var app, parser, path;

  app = require('express').createServer();

  parser = require('./dopecukes/report_parser');

  path = require('path');

  app.get('/', function(req, res) {
    var jsonFile;
    jsonFile = path.join(process.cwd(), 'report.json');
    console.log("reading cucumber report from " + jsonFile);
    return parser(jsonFile, function(json) {
      return res.send(json);
    });
  });

  module.exports.start = function(port) {
    console.log("starting server at http://0.0.0.0:" + port);
    return app.listen(port);
  };

}).call(this);
