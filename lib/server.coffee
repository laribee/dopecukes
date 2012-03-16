express = require('express')
app = express.createServer()
path = require('path')
parser = require('./dopecukes/report_parser')
format = require('./dopecukes/formatter')

app.configure ->
  app.use(express.methodOverride())
  app.use(express.bodyParser())
  app.use(app.router)
  app.use(express.static(path.join(__dirname, 'dopecukes', 'public')))
  app.set('view engine', 'jade')
  app.set('view options', { layout:false })
  app.set('views', path.join(__dirname, 'dopecukes', 'views'))

app.get '/', (request, response) ->
  jsonFile = path.join(process.cwd(), 'report.json')
  #response.render('index', {features: [1,2,3,4]})
  features = format(parser(jsonFile))
  response.render('index', { features: features })

module.exports.start = (port) ->
  console.log("starting server at http://0.0.0.0:#{port}")
  app.listen(port)
