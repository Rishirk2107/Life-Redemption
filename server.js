const express=require("express");
const bodyParser=require('body-parser');
const cors=require("cors");
const axios = require('axios');

const app=express();

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
app.use(cors());

app.post("/process_data",async(req,res)=>{
    console.log(req.body)
    const prompt=req.body.name;
    const response=await axios.post("https://citchennai.ap-south-1.modelbit.com/v1/story/latest",{
        data:prompt
    })
    console.log(response.data.data);
    //console.log(Object.keys(response),"Hello")
    res.json({"message":response.data.data})
});

app.post("/getuser",(req,res)=>{
    console.log(req.body);
    res.json({"message":"welcome to the page"});
})

app.listen(3000,()=>{
    console.log("Server running at http://loachost:3000/")
});