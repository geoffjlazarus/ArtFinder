require("dotenv").config()
const db = require('./index.js')
const bcrypt = require('bcrypt');
let saltRounds = 10;
console.log(process.env.DATABASE_URL)

let plainTextPassword = 'pudding';
let email = 'dt@ga.co'

// gen a salt
// hash/digest the pw
// insert into user table
bcrypt.genSalt(saltRounds, (err, salt) => {
    bcrypt.hash(plainTextPassword, salt, (err, hash) => {
        //console.log(hash)
        let sql = `
        INSERT INTO users (email, password_digest)
        VALUES ('${email}','${hash}');`

        db.query(sql, (err, res) => {
            if(err) {
                console.log(err) 
            } else {
                console.log("New user created")
            }
        })
    })
})