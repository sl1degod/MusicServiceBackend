const Router = require('express')
const router = new Router()
const playlistController = require('../controllers/playlist.controller')

router.get('/playlist', playlistController.getAllPlaylists)
router.post('/playlist', playlistController.createPlaylist)
router.get('/playlist/:id', playlistController.getPlaylistTracks)
router.post('/playlist/:id', playlistController.addTracksToPlaylist)

module.exports = router