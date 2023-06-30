const express = require('express')
const router = express.Router()
const db = require('../db')
const methodOverride = require('method-override');

router.use(methodOverride('_method'));



router.get('/', (req, res) => {
    db.query(`SELECT * FROM movements;`, (err, dbRes) => {
        if(err) {
            console.log(err)
        }
        let movements = dbRes.rows;
        res.render('movements', {movements:movements})
    })
})


 // Movements Index Route
 router.get('/', (req, res) => {
    db.query(`SELECT * FROM movements;`, (err, dbRes) => {
      if (err) {
        console.log(err);
      }
      const movements = dbRes.rows;
      res.render('movements', { movements });
    });
  });
  
  // Movement Details Route
  router.get('/:id', (req, res) => {
    const movementId = req.params.id;
  
    // Query movement details
    const movementSql = `SELECT * FROM movements WHERE id = $1;`;
    db.query(movementSql, [movementId], (err, movementDbRes) => {
      if (err) {
        console.log(err);
      }
      const movement = movementDbRes.rows[0];
  
      res.render('movement', { movement });
    });
  });


// Edit Movement Route
router.get('/:id/edit', (req, res) => {
    const movementId = req.params.id;
  
    // Query movement details
    const movementSql = `SELECT * FROM movements WHERE id = $1;`;
    db.query(movementSql, [movementId], (err, movementDbRes) => {
      if (err) {
        console.log(err);
      }
      const movement = movementDbRes.rows[0];
  
      res.render('edit-movement', { movement });
    });
  });
  
router.post('/:id/edit', (req, res) => {
    const movementId = req.params.id;
    const { name, description, years, artists } = req.body;

    // Update movement in the database
    const sql = `
        UPDATE movements
        SET name = $1, description = $2, years = $3, artists = $4
        WHERE id = $5;
    `;

    db.query(sql, [name, description, years, artists, movementId], (err) => {
        if (err) {
        console.log(err);
        }
        res.redirect(`/movements/${movementId}`);
    });
});
  


module.exports = router