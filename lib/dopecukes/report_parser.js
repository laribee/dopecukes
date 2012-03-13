(function() {
  var fs;

  fs = require('fs');

  module.exports = function(jsonFile, callback) {
    return fs.readFile(jsonFile, function(err, data) {
      var json;
      json = data;
      return callback(json);
    });
  };

}).call(this);
