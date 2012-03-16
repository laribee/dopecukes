fs = require('fs')

module.exports = (jsonFile) ->
  data = fs.readFileSync(jsonFile)
  JSON.parse(data)
