const express = require('express')
const router = express.Router()
const db = require('../db')

router.get('/', (req,res) => {
    db.query(`SELECT * FROM artworks;`, (err, dbRes) => {
        if(err) {
            console.log(err)
        }
        let artworks = dbRes.rows;
        res.render('artworks', {artworks:artworks})
    })
  })

// // Artworks Index Route
// router.get('/artworks', (req, res) => {
//     db.query(`SELECT * FROM artworks;`, (err, dbRes) => {
//       if (err) {
//         console.log(err);
//       }
//       const artworks = dbRes.rows;
//       res.render('artworks', { artworks });
//     });
//   });

router.post('/:id/edit', (req, res) => {
    const artworkId = req.params.id;
    const { title, artist, year, dimension_width, dimension_height, medium, genre, description, style, artwork_image_url } = req.body;

  // Update artist in the database
  const sql = `
    UPDATE artworks
    SET title = $1, artist = $2, year = $3, dimension_width = $4, dimension_height = $5, medium = $6, genre = $7, description = $8, style = $9, artwork_image_url = $10
    WHERE id = $11;
  `;

  db.query(sql, [title, artist, year, dimension_width, dimension_height, medium, genre, description, style, artwork_image_url, artworkId], (err) => {
    if (err) {
      console.log(err);
    }
    res.redirect(`/artworks/${artworkId}`);
  });
});




  
  // Artwork Details Route
router.get('/:id', (req, res) => {
    const artworkId = req.params.id;
  
    // Query artwork details
    const artworkSql = `SELECT * FROM artworks WHERE id = $1;`;
    db.query(artworkSql, [artworkId], (err, artworkDbRes) => {
      if (err) {
        console.log(err);
      }
      const artwork = artworkDbRes.rows[0];
  
      res.render('artwork', { artwork });
    });
  });
  
 // Edit Artwork Route
 router.get('/:id/edit', (req, res) => {
  const artworkId = req.params.id;

  // Query artwork details
  const artworkSql = `SELECT * FROM artworks WHERE id = $1;`;
  db.query(artworkSql, [artworkId], (err, artworkDbRes) => {
    if (err) {
      console.log(err);
    }
    const artwork = artworkDbRes.rows[0];

    res.render('edit-artwork', { artwork });
  });
});

router.post('/:id/edit', (req, res) => {
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





module.exports = router