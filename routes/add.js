const express = require('express')
const router = express.Router()
const db = require('../db')
const methodOverride = require('method-override');

// Add the method-override middleware
router.use(methodOverride('_method'));

router.get('/', (req,res) => {
    res.render("add");
})


// // Add Artist Route
// router.get('/artist', (req, res) => {
//     res.render('add-artist');
// });
  
// router.post('/artist', (req, res) => {
//      const { firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements } = req.body;

//      // Insert new artist into the database
//      const sql = `
//          INSERT INTO artists (firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements)
//          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
//          RETURNING id;`;

//      db.query(sql, [firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements], (err, dbRes) => {
//          if (err) {
//          console.log(err);
//          }
//          res.redirect(`/artists/${dbRes.rows[0].id}`);
//      });
//  });
  



// Add Artwork Route
router.get('/artwork', (req, res) => {
    res.render('add-artwork');
});

router.post('/artwork', (req, res) => {
    const { title, id, year, dimension_width, dimension_height, medium, genre, description, style } = req.body;

    // Insert new artwork into the database
    const sql = `
        INSERT INTO artworks (title, id, year, dimension_width, dimension_height, medium, genre, description, style)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
        RETURNING id;
    `;

    db.query(sql, [title, id, year, dimension_width, dimension_height, medium, genre, description, style], (err, dbRes) => {
        if (err) {
        console.log(err);
        }
        const artworkId = dbRes.rows[0].id;
        res.redirect(`/artworks/${artworkId}`);
    });
});

// Add Movement Route
router.get('/movement', (req, res) => {
    res.render('add-movement');
});

router.post('/movement', (req, res) => {
    const { name, description, years, artists } = req.body;

    // Insert new movement into the database
    const sql = `
        INSERT INTO movements (name, description, years, artists)
        VALUES ($1, $2, $3, $4)
        RETURNING id;
    `;

    db.query(sql, [name, description, years, artists], (err, dbRes) => {
        if (err) {
        console.log(err);

        }
        const movementId = dbRes.rows[0].id;
        res.redirect(`/movements/${movementId}`);
    });
});
  

// router.get('/', (req, res) => {
//     res.render('add')
// });

// router.get("/:id", (req, res) => {

//     let sql = `SELECT * FROM artists WHERE id = $1;`
//     db.query(sql, [req.params.id], (err, dbRes) => {
//         // dbRes.rows = [{ id: 1, title: 'cake', image_url: 'cake.jpg' }]
//         let artist = dbRes.rows[0]
//         res.render("artist", { artist: artist })
//     })
// })

// router.post('/', (req, res) => {
//     let firstname = req.body.firstname;
//     let lastname = req.body.lastname;
//     let birth_year = req.body.birthyear;
//     let death_year = req.body.deathyear;
//     let gender = req.body.gender;
//     let biography = req.body.biography;
//     let nationality = req.body.nationality;
//     let artist_image_url = req.body.image_url;
//     let movements = req.body.movements;
    
//     const sql = `
//         INSERT INTO artists 
//         (firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements) 
//         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
//         RETURNING id;`;
    
//     db.query(sql, [firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements, req.params.id], (err, dbRes) => {
//         // dbRes.rows = [{ id: 21 }]
//         if(err) {
//             console.log(err)
//         }
//         res.redirect(`../artists/${dbRes.rows[0].id}`)
//     })

// //res.redirect('/')
      
// });


module.exports = router