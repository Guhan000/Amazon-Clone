const express = require('express');

const app = express();
const bcrypt = require('bcrypt');
const mongoose = require('mongoose')
const AuthRouter = require('./routes/auth')

const PORT = 3000;

const url = "mongodb+srv://guhan:guhan@cluster0.b0njnpd.mongodb.net/?retryWrites=true&w=majority"

// middleware
app.use(express.json())
app.use(AuthRouter);

app.get("/", (req,res) => {
    res.json({hi : "Guhan here!!"})
    console.log("Hello World");
})

// connection
mongoose.connect(url).then(() => {
    console.log("connected mongodb");
}).catch((e) => {
    console.log(e)
})



app.listen(PORT, function () {
    console.log(`server connected at ${PORT}`)
});