const express = require('express')
const app = express()
//const port = process.env.PORT || 3000 
const port = 3000
const expressLayouts = require('express-ejs-layouts')
const methodOverride = require('method-override')
const router = express.Router();



const indexRouter = require('./routes/index')
const artistsRouter = require('./routes/artists')
const addRouter = require('./routes/add')
const artworksRouter = require('./routes/artworks')
const movementsRouter = require('./routes/movements')

const db = require('./db')

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

app.use(expressLayouts)

app.use('/', indexRouter)
app.use('/artists', artistsRouter)
app.use('/artworks', artworksRouter)
app.use('/add', addRouter)
app.use('/movements', movementsRouter)



// app.use(
//     session({
//         cookie: {maxAge: 1000 * 60 * 60 * 24 * 3},
//         secret: process.env.SESSION_SECRET || "mistyrose",
//         resave: false,
//         saveUninitialized: true,
//     })
// );


  
  
 
  
  


  
  
  // Edit Artwork Route
  app.get('/artworks/:id/edit', (req, res) => {
    const artworkId = req.params.id;
  
    // Query artwork details
    const artworkSql = `SELECT * FROM artworks WHERE id = $1;`;
    db.query(artworkSql, [artworkId], (err, artworkDbRes) => {
      if (err) {
        console.log(err);
        res.status(500).send('Internal Server Error');
        return;
      }
      const artwork = artworkDbRes.rows[0];
  
      res.render('edit-artwork', { artwork });
    });
  });
  
  app.post('/artworks/:id/edit', (req, res) => {
    const artworkId = req.params.id;
    const { title, artist_id, year, dimension_width, dimension_height, medium, genre, description, style } = req.body;
  
    // Update artwork in the database
    const sql = `
      UPDATE artworks
      SET title = $1, artist_id = $2, year = $3, dimension_width = $4, dimension_height = $5, medium = $6, genre = $7, description = $8, style = $9
      WHERE id = $10;
    `;
  
    db.query(sql, [title, artist_id, year, dimension_width, dimension_height, medium, genre, description, style, artworkId], (err) => {
      if (err) {
        console.log(err);
        res.status(500).send('Internal Server Error');
        return;
      }
      res.redirect(`/artworks/${artworkId}`);
    });
  });


app.listen(port, () => {
    console.log(`listening on port ${port}`)
})