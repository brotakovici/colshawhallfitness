app = require('./app')(process.env.NODE_ENV)
http = require('http')

http.createServer(app).listen(app.get('port'), ->
  console.log('Yay on port: ' + app.get('port'))
)
