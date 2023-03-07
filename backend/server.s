const express = require('express');
const app = express();
const mongoose = require('mongoose');
const cors = require('cors')
const routes = require ('./MealRoutes')

require('dotenv').config()

mongoose.set("strictQuery", false)


const PORT = 8000 || process.env.port;

app.use(express.json())
app.use(cors())

mongoose
.connect(process.env.MONGODB_LINK)
.then(()=> console.log("WE WERE CONNECTED TO MONGO"))
.catch((err) => console.log(err))

app.use(routes)



app.listen(PORT, ()=> {
    console.log(`I AM LISTENNING On PORT ${PORT}`)
})



//mongodb+srv://yelenadzhaparova:<password>@cluster0.jqmgog8.mongodb.net/?retryWrites=true&w=majority