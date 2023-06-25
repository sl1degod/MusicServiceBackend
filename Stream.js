const fs = require("fs");
class Stream {
    readStream(req, res, id) {
        res.writeHead(200, {'Content-Type': 'audio/mp3'})
        fs.createReadStream(`./music/${id}.mp3`).pipe(res);
    }
}

module.exports = new Stream()

