const database = require('../db/database')

class TrackController {
    async getTrack(req, res) {
        const id = req.params.id
        const track = await database.query('select * from tracks where id = $1', [id])
        res.json(track.rows[0])
    }

    async getAllTracks(req, res) {
        const tracks = await database.query('select tracks.name as track, tracks.uuid as id, performer.name as artist from tracks, performer where tracks.performer_id = performer.id')
        res.json(tracks.rows)
    }
}

module.exports = new TrackController()