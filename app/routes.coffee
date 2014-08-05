module.exports = (app) ->
  
  app.get('/', (req, res) ->
    res.render('index')
  )

  app.get('/location', (req, res) ->
    res.render('location')
  )
  
  app.get('/contact', (req, res) ->
    res.render('contact')
  )

  app.get('/personal-training', (req, res) ->
    res.render('services')
  )

  app.get('/about-us', (req, res) ->
    res.render('about-us')
  )
