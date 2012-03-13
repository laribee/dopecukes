fs = require('fs')

module.exports = (jsonFile, callback) ->
  fs.readFile jsonFile, (err, data) ->
    json = JSON.parse(data)
    callback(json)

