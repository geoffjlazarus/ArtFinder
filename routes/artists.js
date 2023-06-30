const express = require('express')
const router = express.Router()
const db = require('../db')
const methodOverride = require('method-override');
const ensureLoggedIn = require('../middlewares/ensure_logged_in')

// Add the method-override middleware
router.use(methodOverride('_method'));


router.get('/', (req,res) => {
  db.query(`SELECT * FROM artists;`, (err, dbRes) => {
    if(err) {
      console.log(err)
    }
    let artists = dbRes.rows;
    res.render('artists', {artists:artists})
  })
});




// Add Artist Route
router.get('/add', ensureLoggedIn, (req, res) => {
    res.render('add-artist');
});

// Artist Details Route
router.get('/:id', (req, res) => {
    const artistId = req.params.id;
  
    // Query artist details
    const artistSql = `SELECT * FROM artists WHERE id = $1;`;
    db.query(artistSql, [artistId], (err, artistDbRes) => {
      if (err) {
        console.log(err);
      }
      const artist = artistDbRes.rows[0];
  
      // Query artworks by the artist
      const artworksSql = `SELECT * FROM artworks WHERE id = $1;`;
      db.query(artworksSql, [artistId], (err, artworksDbRes) => {
        if (err) {
          console.log(err);
        }
        const artworks = artworksDbRes.rows;
  
        res.render('artist', { artist, artworks });
      });
    });
  });
  
  
router.post('/', ensureLoggedIn, (req, res) => {
     const { firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements } = req.body;

     // Insert new artist into the database
     const sql = `
         INSERT INTO artists (firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
         RETURNING id;`;

     db.query(sql, [firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements], (err, dbRes) => {
         if (err) {
         console.log(err);
         }
         res.redirect(`/artists/${dbRes.rows[0].id}`);
     });
 });
  

 router.delete('/:id', ensureLoggedIn, (req, res) => {
    db.query(`DELETE FROM artists WHERE id = ${req.params.id};`, (err, dbRes) => {
      res.redirect("/")
    })
  })




router.post('/:id/edit', ensureLoggedIn, (req, res) => {
    const artistId = req.params.id;
    const { firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements } = req.body;

  // Update artist in the database
  const sql = `
    UPDATE artists
    SET firstname = $1, lastname = $2, birth_year = $3, death_year = $4, gender = $5, biography = $6, nationality = $7, artist_image_url = $8, movements = $9
    WHERE id = $10;
  `;

  db.query(sql, [firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements, artistId], (err) => {
    if (err) {
      console.log(err);
    }
    res.redirect(`/artists/${artistId}`);
  });
});





// // Artists Index Route
// router.get('/', (req, res) => {
//   db.query(`SELECT * FROM artists;`, (err, dbRes) => {
//     if (err) {
//       console.log(err);
//       res.status(500).send('Internal Server Error');
//       return;
//     }
//     const artists = dbRes.rows;
//     res.render('artists', { artists });
//   });
// });

// // Artist Details Route
// router.get('/:id', (req, res) => {
//   const artistId = req.params.id;

//   // Query artist details
//   const artistSql = `SELECT * FROM artists WHERE id = $1;`;
//   db.query(artistSql, [artistId], (err, artistDbRes) => {
//     if (err) {
//       console.log(err);
//     }
//     const artist = artistDbRes.rows[0];

//     // Query artworks by the artist
//     const artworksSql = `SELECT * FROM artworks WHERE id = $1;`;
//     db.query(artworksSql, [artistId], (err, artworksDbRes) => {
//       if (err) {
//         console.log(err);
//       }
//       const artworks = artworksDbRes.rows;

//       res.render('artist', { artist, artworks });
//     });
//   });
// });

// Edit Artist Route
router.get('/:id/edit', (req, res) => {
  const artistId = req.params.id;

  // Query artist details
  const artistSql = `SELECT * FROM artists WHERE id = $1;`;
  db.query(artistSql, [artistId], (err, artistDbRes) => {
    if (err) {
      console.log(err);
    }
    const artist = artistDbRes.rows[0];

    res.render('edit-artist', { artist });
  });
});
  


module.exports = router


// router.get('/', (req, res) => {
//     db.query(`SELECT * FROM artists;`, (err, dbRes) => {
//         if(err) {
//             console.log(err)
//         }
//         let artists = dbRes.rows;
//         res.render('artists', {artists:artists})
//     })
// });

//  router.post('/', (req, res) => {
// //     let first_name = req.body.firstname;
// //     let last_name = req.body.lastname;
// //     let birth_year = req.body.birthyear;
// //     let death_year = req.body.deathyear;
// //     let gender = req.body.gender;
// //     let biography = req.body.biography;
// //     let nationality = req.body.nationality;
// //     let artist_image_url = req.body.image_url;
  
// //     const sql = `
// //       INSERT INTO artists (first_name, last_name, birth_year, death_year, gender, biography, nationality, artist_image_url) 
// //       VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
// //       RETURNING id;
// //     `
  
// //     db.query(sql, [first_name, last_name, birth_year, death_year, gender, biography, nationality, artist_image_url, req.params.id], (err, dbRes) => {
// //       // dbRes.rows = [{ id: 21 }]
// //       res.redirect(`/artists/${dbRes.rows[0].id}`)
// //     })

// res.redirect('/')
  
//  });



// router.get("/:id", (req, res) => {

//     let sql = `SELECT * FROM artists WHERE id = $1;`
//     db.query(sql, [req.params.id], (err, dbRes) => {
//         // dbRes.rows = [{ id: 1, title: 'cake', image_url: 'cake.jpg' }]
//         let artist = dbRes.rows[0]
//         res.render("artist", { artist: artist })
//     })
// })


// router.get('/:id/edit', (req, res) => {
//   const artistId = req.params.id;
//     const sql = `SELECT * FROM artists WHERE id = $1;`
//     db.query(sql, [artistId], (err, dbRes) => {
//       // rows is always an array [{ id: 2, title: 'cake' }]
//       if(err) {
//         console.log(err)
//       }
//       const artist = dbRes.rows[0] 
//       res.render('edit-artist', { artist: artist })
//     })
//   })


// router.put('/:id', (req, res) => {

//   const sql = 
//   `UPDATE artists SET 
//     firstname = $1,
//     lastname = $2,
//     birth_year = $3,
//     death_year = $4,
//     gender = $5,
//     biography = $6,
//     nationality = $7,
//     artist_image_url = $8,
//     movements = $9
//     WHERE id = $10;`;

//   const {
//     firstname,
//     lastname,
//     birth_year,
//     death_year,
//     gender,
//     biography,
//     nationality,
//     artist_image_url,
//     movements
//   } = req.body;

//   db.query(
//     sql,
//     [firstname, lastname, birth_year, death_year, gender, biography, nationality, artist_image_url, movements],
//     (err, dbRes) => {
//       res.redirect(`/artists/${req.params.id}`);
//     }
//   )
// })




// module.exports = router


// // const sql = 
// // `UPDATE artists SET 
// // firstname = $1,
// // lastname = $2,
// // birth_year = $3,
// // death_year = $4,
// // gender = $5,
// // biography = $6,
// // nationality = $7,
// // artist_image_url = $8,
// // movements = $9
// // WHERE id = $10;`

// // db.query(sql, [req.body.firstname, req.body.lastname, req.body.birthyear, req.body.deathyear, req.body.gender, req.body.biography, req.body.nationality, req.body.artist_image_url, req.body.movements, req.params.id], (err, dbRes) => {
// //     if(err) {
// //         console.log(err)
// //     }
// //   res.redirect(`/artists/${req.params.id}`)
// // })