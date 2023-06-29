const db = require('./index.js')
const bcrypt = require('bcrypt');
let saltRounds = 10;

let plainTextPassword = 'password';
let email = 'admin@admin.com'

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