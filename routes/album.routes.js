const Router = require('express')
const router = new Router()
const albumController = require('../controllers/album.controller')

router.get('/albums', albumController.getAllAlbums)
router.get('/albums/:id', albumController.getAlbumTracks)

module.exports = router