const express = require('express');
const trackRouter = require('./routes/track.routes')
const PORT = 5000;
const hostname = '0.0.0.0';

const app = express();

app.use(express.json())
app.use('/', trackRouter)

const start = () => {
    app.listen(PORT, hostname, null, () => {
        console.log(`Server started at PORT=${PORT}`)
    })
}

start()