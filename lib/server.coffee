app = require('express').createServer()
parser = require('./dopecukes/report_parser')
path = require('path')

app.get '/', (req, res) ->
  jsonFile = path.join(process.cwd(), 'report.json')
  console.log("reading cucumber report from #{jsonFile}")
  parser(jsonFile, (json) -> res.send(json))

module.exports.start = (port) ->
  console.log("starting server at http://0.0.0.0:#{port}")
  app.listen(port)
