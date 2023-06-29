const express = require('express')
const router = express.Router()
const db = require('../db')
const bcrypt = require('bcrypt')

router.get("/login", (req, res) => {
    res.render("login")
})
  
  
router.post("/login", (req, res) => {
    let email = req.body.email
    let password = req.body.password

    let sql = `SELECT * FROM users WHERE email = '${email}';`

    db.query(sql, (err, dbRes) => {
        if(err) {
            console.log(err)
        }

        if(dbRes.rows.length === 0) {
            res.render('login')
            return
        }

        // user record found
        // password === dbRes.rows[0].password_digest

        bcrypt.compare(password, dbRes.rows[0].password_digest, (err, result) => {
            if(result) {

                req.session.userId = dbRes.rows[0].id
                console.log('valid details')

                res.redirect("/")
            } else {
                res.render("login")
            }
        })
    })
})

router.delete("/logout", (req, res) => {
req.session.userId = undefined
res.redirect('/login')
}) 
   
    
module.exports = router  