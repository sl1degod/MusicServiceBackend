const fs = require("fs");
class Stream {


    readStream(req, res, id) {
        try {
            res.writeHead(200, {'Content-Type': 'audio/mp3'})
            fs.createReadStream(`./music/${id}.mp3`).pipe(res);
        } catch (error) {
            res.json({
                "message": "Произошла ошибка"
            })
        }

    }
}

module.exports = new Stream()

