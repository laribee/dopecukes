app = require('express').createServer()
path = require('path')
parser = require('./dopecukes/report_parser')
format = require('./dopecukes/formatter')

app.get '/', (request, response) ->

  jsonFile = path.join(process.cwd(), 'report.json')
  console.log("reading cucumber report from #{jsonFile}")

  parser jsonFile, (json) -> response.send(format(json))


module.exports.start = (port) ->

  console.log("starting server at http://0.0.0.0:#{port}")
  app.listen(port)
