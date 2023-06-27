const express = require('express')
const app = express()
const port = 3000
const expressLayouts = require('express-ejs-layouts')

const indexRouter = require('./routes/index')

const db = require('./db')

// Middleware
app.set('view engine', 'ejs')
app.use(express.static('public'))

app.use(expressLayouts)

app.use('/', indexRouter)


app.listen(port, () => {
    console.log(`listening on port ${port}`)
})