const database = require('../db/database')
const stream = require('../Stream')

class PlaylistController {
    async createPlaylist(req, res) {
        const {name} = req.body;
        const newPlaylist = await database.query(`insert into playlist(name, image, user_id) values($1, 'https://images.genius.com/24afe321dcba210a2b1adbeab043b10a.1000x1000x1.jpg', 1) RETURNING *`, [name])
        res.json(newPlaylist)
    }

    async getPlaylistTracks(req, res) {
        const id = req.params.id
        const playlist = await database.query('select playlist.id, playlist.name as name, album.image, album.name as album, users.username, tracks.id, tracks.name as track, tracks.duration as duration, tracks.count_of_plays as count_of_playing, artist.name as artist from playlist, tracks, users, playlist_tracks, artist, album where playlist.id = $1 and playlist_tracks.tracks_id = tracks.id and playlist_tracks.playlist_id = playlist.id and tracks.artist_id = artist.id and album.artist_id = artist.id ', [id])

        console.log(id)
        res.json(playlist.rows)
    }

    async getAllPlaylists(req, res) {
        const playlist = await database.query('select playlist.id, playlist.name as name, count(playlist_tracks.tracks_id) as count_tracks, playlist.image as image, users.username as user from users, playlist, playlist_tracks  where playlist.user_id = users.id and playlist_tracks.playlist_id = playlist.id group by playlist.id, playlist.name, playlist.image, users.username')
        res.json(playlist.rows)
    }
}

module.exports = new PlaylistController()