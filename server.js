require("dotenv").config()
const express = require('express')
const app = express()
const port = process.env.PORT || 3000 
//const port = 3000
const expressLayouts = require('express-ejs-layouts')
const requestLogger = require('./middlewares/request_logger.js')
const methodOverride = require('method-override')
const router = express.Router();
const session = require('express-session')

const indexRouter = require('./routes/index')
const artistsRouter = require('./routes/artists')
const addRouter = require('./routes/add')
const artworksRouter = require('./routes/artworks')
const movementsRouter = require('./routes/movements')
const sessionsRouter = require('./routes/sessions.js')
const setUser = require('./middlewares/set_user.js')
const ensureLoggedIn = require('./middlewares/ensure_logged_in.js')

const db = require('./db')
const bcrypt = require('bcrypt')


// Middleware
app.set('view engine', 'ejs')
app.use(express.static('public'))

app.use(express.urlencoded({ extended: true}))

app.use(methodOverride(function (req, res) {
    if (req.body && typeof req.body === 'object' && '_method' in req.body) {
    // look in urlencoded POST bodies and delete it
    var method = req.body._method
    delete req.body._method
    return method
}
}))

app.use(requestLogger)

app.use(
  session({
      cookie: {maxAge: 1000 * 60 * 60 * 24 * 3},
      secret: process.env.SESSION_SECRET || "mistyrose",
      resave: false,
      saveUninitialized: true,
  })
);

app.use(setUser)

app.use(expressLayouts)

app.use('/', sessionsRouter)

app.use('/', indexRouter)
app.use('/artists', artistsRouter)
app.use('/artworks', artworksRouter)
app.use('/add', addRouter)
app.use('/movements', movementsRouter)


app.listen(port, () => {
    console.log(`listening on port ${port}`)
})


