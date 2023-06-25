const database = require('../db/database')
const stream = require('../Stream')

class AlbumController {
    async getAlbumTracks(req, res) {
        const id = req.params.id
        const album = await database.query('select album.name as name, album.image as image, artist.name as artist, tracks.name as track, tracks.id as track_id, tracks.duration as duration, tracks.count_of_plays as count_of_playing from album, artist, tracks, album_tracks where album.id = $1 and album.artist_id = artist.id and album_tracks.tracks_id = tracks.id and album_tracks.album_id = album.id', [id])

        console.log(id)
        res.json(album.rows)
    }

    async getAllAlbums(req, res) {
        const tracks = await database.query('select album.id, album.name as name, album.image as image, ' +
            'artist.name as artist from album, artist where album.artist_id = artist.id')
        res.json(tracks.rows)
    }
}

module.exports = new AlbumController()