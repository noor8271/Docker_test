const express = require('express')
const app = express();
const PORT = 8080;
app.get("/",(req,res)=>{
    return res.json({message: "HI THIS APPLICATION IS RUNNING ON DOCKER"});

});
app.listen(PORT,()=>console.log(`server started on port ${PORT}`))