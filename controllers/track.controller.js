const database = require('../db/database')
const stream = require('../Stream')

class TrackController {
    async getTrack(req, res) {
        const id = req.params.id
        const track = await database.query('select * from tracks where id = $1', [id])

        stream.readStream(req, res, id)

        console.log(id)
        // res.json(track.rows[0])
    }

    async getAllTracks(req, res) {
        const tracks = await database.query('select tracks.name as track, tracks.uuid as id, tracks.duration as duration, tracks.count_of_plays as count_of_playing, artist.name as artist, album.name as album, album.image from tracks, artist, album, Album_Tracks where tracks.artist_id = artist.id and album.id = album_Tracks.album_id and tracks.id = Album_Tracks.tracks_id order by tracks.id')
        res.json(tracks.rows)
    }

    async updateCountOfPlayingTracks(req, res) {
        const {id} = req.body;
        const count_tracks = await database.query('update tracks set count_of_plays = (select count_of_plays) + 1 where id = $1 returning *', [id])
        res.json(count_tracks[0])
    }
}

module.exports = new TrackController()