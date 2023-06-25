const express = require('express');
const fs = require('fs');
const trackRouter = require('./routes/track.routes')
const playlistRouter = require('./routes/playlist.routes')
const albumRouter = require('./routes/album.routes')
const PORT = 5000;
const hostname = '0.0.0.0';

const app = express();



app.use(express.json());
app.use('/', trackRouter);
app.use('/', playlistRouter);
app.use('/', albumRouter);



const start = () => {
    app.listen(PORT, hostname, null, () => {
        console.log(`Server started at PORT=${PORT}`)
    })
}

start()