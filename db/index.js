require('dotenv').config()
const pg = require('pg')

const db = new pg.Pool({
    connectionString: process.env.DATABASE_URL,
    //connectionString: "postgresql://localhost:5432/artfinder",
})

module.exports = db


// const { Pool } = require("pg");

// const config = {
//   dev: {
//     database: "artfinder",
//   },
//   prod: {
//     connectionString: process.env.DATABASE_URL,
//   },
// };

// module.exports = new Pool(
//   process.env.DATABASE_URL ? config.prod : config.dev
// );