app = require('./app')
http = require('http')

http.createServer(app).listen(app.get('port'), ->
  console.log('Yay on port: ' + app.get('port'))
)
