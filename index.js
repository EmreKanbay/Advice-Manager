const express = require("express")
require('dotenv').config()
const pg = require("pg")
const markdownint = require('markdown-it')
const md = markdownint()
var he = require('he');

const {Pool} = pg

 
const app = express()

const pool = new Pool({
    host: process.env.PG_HOST, // e.g. 'my-user'
    port: process.env.PG_PORT, // e.g. 'my-user-password'
    user: process.env.PG_USER, // e.g. 'my-database'
    password: process.env.PG_PASSWORD, // e.g. '/cloudsql/project:region:instance'
    database: process.env.PG_DATABASE, // e.g. '/cloudsql/project:region:instance'
})
 
 
const construct = async (x, ...values) => {
  try{

    var rendered = "";
    for (let u = 0; u < x.length; u++) {
      rendered = rendered.concat(x[u]);
      if (u < x.length - 1) {
        if (typeof values[u] == "function") {
          rendered = rendered.concat(await values[u]());
        } else {
          rendered = rendered.concat(values[u]);
        }
      }
    }
  
    return rendered;

  }catch(e){
    console.log("Error in templating")
    return "Error"
  }

};


var page;

 

app.use("/", (req, res, next)=> {
     page = construct`


<!DOCTYPE html>
<html lang="en">
  <head>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/he/1.2.0/he.min.js" integrity="sha512-PEsccDx9jqX6Dh4wZDCnWMaIO3gAaU0j46W//sSqQhUQxky6/eHZyeB3NrXD2xsyugAKd4KPiDANkcuoEa2JuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.6.1/github-markdown-dark.css" integrity="sha512-tVO0ZLV54CEoiM+i1hvfZGcopGR3rxyyC3L2/P/6NRTVXlrp4OKyTFunluVG1BRNasDLnm6ZRPDKBGM0CkS99Q==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HTML 5 Boilerplate</title>
   </head>
  <body>

  <style>
  html {
  scroll-behavior: smooth;
}
  
  body{
  overflow-x:hidden;
  min-height:100vh;
   background-repeat:no-repeat;
  
  background-image: linear-gradient(50deg,  hsl(90, 0%, 5%)  25%, hsl(90, 0%, 10%) 25% 50%, hsl(90, 0%, 15%) 50% 75%, hsl(90, 0%, 20%) 75% 100%);

  }
  </style>

  <h1 style="text-align:center;color:white;font-family:sans-serif">Advice Manager</h1>


<form class="visible"  id="form-add">


 

 <input placeholder="Add Title..." id="title" type="text" /> <br>
<br>

<textarea placeholder="Add Content..." id="content"></textarea><br>


  <input placeholder="Add Source..." id="source" type="text" /> 

<input id="submit" type="submit">
</form>


<form data-current-id=""  class=""  id="form-edit">


 
 <input id="title-edit" type="text" /> <br>

 <br>

<textarea data-id="" id="content-edit"></textarea><br>


 <input id="source-edit" type="text" /> 

<input id="submit-edit" value="save edit" type="submit">
</form>



<br>







<div id="advice-list">

${async ()=> {

 
    var record;

    try{

        record = await pool.query(
            `SELECT * FROM "advices"`,
        );
    
            
     

    }catch(e){

 
        console.log(e)
                    }

         if(record.rows.length == 0){

            return `<h2>No custom cheat sheet exist yet<h2>`
        }


  var x =  String(record.rows.map(t => {
        return `

         
         <details onclick="window.scrollTo({ top: 0 });" data-title='${he.encode(t.title)}' data-id='${t.id}' data-date='${t.date}' data-source='${he.encode(t.source)}' data-raw='${he.encode(t.content_raw)}' "  name="details" class="markdown-body advice-element">
        <summary>${t.title}</summary>
        ${t.content_rendered}
           <cite>-${t.source}</cite><br>
           <cite>-${new Date(t.date * 1).toString()}</cite><br>
          <button class="edit">Edit</button>
        <button  class="cancel-edit">Cancel Edit</button>
        <button class="delete">Delete</button>
        </details>
        
     

     
        
 


`;
    })).replaceAll(",", "\n");

    return x;

}}




${String(
  [
    2, 3, 1, 1, 1, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 3, 1, 2, 3, 1, 2, 3, 1, 2, 1, 2, 3, 1, 1, 1, 1, 2, 3, 1, 2, 3, 1,
    2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3,
  ].map(t => {
    return `
        <div style="height:0" class="advice-element tttt">      
        </div>
`;
  }),
).replaceAll(",", "\n")}




</div>

<style>

 
input[type=text]{
    outline: none;
    padding: .5rem 1rem;

background:rgb(0,0,0,0);
border: 1px white solid;
border-radius: 1rem;
box-sizing:border-box;
width:100%;
backdrop-filter: blur(20px);
color: white;
font-size:3rem;

}

 
textarea{
     outline: none;
color: white;

    padding: .5rem 1rem;

background:rgb(0,0,0,0);
border: 1px white solid;
border-radius: 1rem;
backdrop-filter: blur(20px);

box-sizing:border-box;
width:100%;
font-size:1.5rem;

}

::placeholder {
  color: white;
  opacity: .5; /* Firefox */
}

.advice-element{
 
    flex-grow:1;
 		min-width: 150px;
    max-width: 250px;
}


details summary{
 box-sizing:border-box;
padding: .4rem .4rem .4rem .4rem;
background:hsl(90,  0%, 15%);
color:white;
 
height:100%;
cursor:pointer;
 
}

 details[open] summary{
 border-bottom: 1px solid hsl(0, 0%, 50%);
padding: 0 1rem 1rem 0;


height:initial;
}



.advice-element.tttt{
order:3}
 

details{
background:hsl(90,  0%, 15%);

 padding:.4rem;
 border:solid hsl(0, 0%, 40%) 1px;
 order: 2;
 border-radius:.7rem;
 box-sizing:border-box;

}

 details[open]{
background:hsl(90,  0%, 15%);
 color:white;

order: 1;

 box-sizing:border-box;
padding: 1rem 1rem 1rem 1rem;

min-width:100%;

}


#form-edit.visible{
display:initial;
}

#form-edit{
display:none;

}

#form-add.visible{
display:initial;
}

#form-add{
display:none;

}





#content{
box-sizing:border-box;
width:100%;
resize:vertical;
height: 400px;

}



#content-edit{
  box-sizing:border-box;
  width:100%;
  resize:vertical;
  height: 200px;
  
  }


#advice-list{
margin-top:1rem;

display:flex;
flex-wrap: wrap;
gap:.5rem;
}

.cancel-edit{
display:none

}

</style>


<script>



 

document.querySelector("#form-edit").addEventListener("submit" , async (e)=> {

  e.preventDefault()
  
  const res = await fetch("/", {
  headers: {
  'Content-Type': 'application/json'
},
method:"PATCH",
body: JSON.stringify({id: e.target.getAttribute("data-current-id"), content: document.querySelector("#content-edit").value , source:document.querySelector("#source-edit").value, title: document.querySelector("#title-edit").value})



}) 


  if(res.ok){

window.location.replace("/")
}
else{

}

  
  })

 

 


 document.querySelectorAll(".cancel-edit").forEach(t => {t.addEventListener("click", async ()=> {
  
  
       document.querySelector("#form-edit").classList.remove("visible")
  document.querySelector("#form-add").classList.add("visible")

document.querySelectorAll(".edit").forEach(t => {t.style.display="inline"})



    t.style.display = "none"
      t.previousElementSibling.style.display = "inline"
  
  
  
  })})



document.querySelectorAll(".edit").forEach(t => {t.addEventListener("click", async ()=> {
  
document.querySelectorAll(".edit").forEach(t => {t.style.display="none"})

  t.style.display = "none"
      t.nextElementSibling.style.display = "inline"

       

     document.querySelector("#form-edit").classList.add("visible")
  document.querySelector("#form-add").classList.remove("visible")
 
  document.querySelector("#form-edit").setAttribute("data-current-id", t.parentNode.getAttribute("data-id") )


    document.querySelector("#content-edit").innerHTML = t.parentNode.getAttribute("data-raw")
  document.querySelector("#source-edit").setAttribute("value",  t.parentNode.getAttribute("data-source"))
  document.querySelector("#title-edit").setAttribute("value",  t.parentNode.getAttribute("data-title"))



   

  
  })

})

document.querySelectorAll(".delete").forEach(t => {t.addEventListener("click", async ()=> {
    
     const res = await fetch("/", {
      headers: {
      'Content-Type': 'application/json'
    },
    method:"delete",
    body: JSON.stringify({id: t.parentNode.getAttribute("data-id")})
    
    
    }) 

      if(res.ok){
    
    window.location.replace("/")
    }
    else{
    
    }

        
    })})


document.querySelector("#form-add").addEventListener("submit", async (e)=>{
    e.preventDefault()

    const res = await fetch("/", {
    
    headers: {
      'Content-Type': 'application/json'
    },
    method:"PUT",
    body: JSON.stringify({content:document.querySelector("#content").value, source:document.querySelector("#source").value, title:document.querySelector("#title").value})
    
    
    
    }) 

    if(res.ok){
    
    window.location.replace("/")
    }
    else{
    
    }

    } )

</script>

  </body>
</html>


`
next()

})

app.route("/")
.get( async (req,res, next) => {

    res.send(await page)
})

.put( express.json(), async (req, res)=> {

  console.log(req.body)

  const text = 'INSERT INTO advices (id,content_raw, content_rendered, source,date, title) VALUES (DEFAULT ,$1, $2, $3, $4, $5)'
const values = [req.body.content, md.render(req.body.content),req.body.source, Date.now(), req.body.title ]

    await pool.query(text, values)

      res.send()

})
.delete( express.json() , async (req, res, next) => {

    await pool.query(`DELETE FROM advices WHERE id = '${req.body.id}'`)

    
    res.send()


})

.patch(express.json() , async (req, res, next) => {

 
   
  const text = 'UPDATE advices SET content_raw = $1, content_rendered = $2, source = $3, title = $4 WHERE id = $5'
  const values = [req.body.content, md.render(req.body.content), req.body.source, req.body.title ,req.body.id ]
  
      await pool.query(text, values)
      
   res.send()


})

app.listen(3000, ()=> {console.log("app started listening")})