const express = require('express')
const router = express.Router()
const db = require('../db')

router.get('/', (req, res) => {
    let sql = `SELECT * FROM artists;`
    db.query(sql, (err, dbRes) => {
        if(err) {
            console.log(err)
        }
        let artists = dbRes.rows
        res.render('home', {artists:artists})
    })
})

module.exports = router