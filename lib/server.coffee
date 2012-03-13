app = require('express').createServer()

app.get '/', (req, res) -> res.send('hello world')

module.exports.start = (port) -> 
	app.listen(port)
