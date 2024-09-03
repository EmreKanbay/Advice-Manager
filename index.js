const express = require("express")
require('dotenv').config()
const pg = require("pg")

const {Pool} = pg

const app = express()

const pool = new Pool({
    user: process.env.PG_CONENCTION_USERNAME, 
    password: process.env.PG_CONENCTION_PASSWORD,
    host: process.env.PG_CONENCTION_HOST,
    port: process.env.PG_CONENCTION_PORT, 
    database: process.env.PG_CONENCTION_DB, 

})
 

const page = `


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HTML 5 Boilerplate</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>




   <h1>Advices</h1>

   <span>Advice: </span>
<input id="content" type="text" /> 

<input id="submit" type="submit">



<div id="advice-list">



</div>

<style>

#advice-list{

width:100%;
display:flex;
flex-direction:column;


}

</style>


<script>




</script>

  </body>
</html>


`


app.route("/")
.get( async (req,res, next) => {
    console.log(await pool.query("SELECT * from advices"))

    res.send(page)
})

.put( async (req, res)=> {

    console.log("works")
    res.send()



})


app.listen(3000, ()=> {console.log("app started listening")})